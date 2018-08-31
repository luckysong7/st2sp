package com.board;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.forever.common.MyUtil;
import com.forever.common.dao.CommonDAO;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class BoardAction extends ActionSupport implements Preparable,
		ModelDriven<BoardDTO> {

	private static final long serialVersionUID = 1L;

	// ***************************************************

	private BoardDTO dto;

	// 객체 생성
	@Resource(name = "dao")
	private CommonDAO dao;

	@Resource(name = "myUtil")
	private MyUtil myUtil;

	public BoardDTO getDto() {
		return dto;
	}

	@Override
	public BoardDTO getModel() {
		return dto;
	}

	@Override
	public void prepare() throws Exception {
		dto = new BoardDTO();
	}

	// ***************************************************
	public String created() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();

		if (dto == null || dto.getMode() == null || dto.getMode().equals("")) {
			return INPUT;
		}

		int numMax = dao.getIntValue("board.numMax");

		dto.setNum(numMax + 1);
		dto.setIpAddr(request.getRemoteAddr());

		dao.insertData("board.insertData", dto);

		return SUCCESS;
	}

	public String list() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();

		String cp = request.getContextPath();

		int numPerPage = 10;
		int totalPage = 5;
		int totalDataCount = 0;

		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		if (pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");

		if (searchKey == null) {
			searchKey = "subject";
			searchValue = "";
		}

		Map<String, Object> hMap = new HashMap<String, Object>();

		hMap.put("searchKey", searchKey);
		hMap.put("searchValue", searchValue);

		totalDataCount = dao.getIntValue("board.dataCount", hMap);

		if (totalDataCount != 0) {
			totalPage = myUtil.getPageCount(numPerPage, totalDataCount);
		}

		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		hMap.put("start", start);
		hMap.put("end", end);

		List<Object> lists = (List<Object>) dao.getListData("board.listData",
				hMap);

		int listNum, n = 0;

		Iterator<Object> it = lists.iterator();

		while (it.hasNext()) {
			BoardDTO vo = (BoardDTO) it.next();
			listNum = totalDataCount - (start + n - 1);
			vo.setListNum(listNum);
			n++;
		}

		String param = "";
		String urlArticle = "";
		String urlList = "";

		if (!searchValue.equals("")) {
			searchValue = URLEncoder.encode(searchValue, "UTF-8");

			param += "searchKey=" + searchKey;
			param += "&searchValue=" + searchValue;
		}

		urlList = cp + "/bbs/list.action";
		urlArticle = cp + "/bbs/article.action?pageNum=" + currentPage;

		if (!param.equals("")) {
			urlList += "?" + param;
			urlArticle += "&" + param;
		}

		request.setAttribute("lists", lists);
		request.setAttribute("urlArticle", urlArticle);
		request.setAttribute("totalDataCount", totalDataCount);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("pageIndexList",
				myUtil.pageIndexList(currentPage, totalPage, urlList));

		return SUCCESS;
	}

	public String article() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num")); // 게시물의 번호

		if (searchKey == null || searchKey.equals("")) {
			searchKey = "subject";
			searchValue = "";
		}

		if (request.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");

		}

		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("searchKey", searchKey);
		hMap.put("searchValue", searchValue);
		hMap.put("num", num);

		dao.updateData("board.hitCountUpdate", num); // 조회수 증가
		dto = (BoardDTO) dao.getReadData("board.readData", num);

		if (dto == null) {
			return "read-error";
		}

		int lineSu = dto.getContent().split("\n\r").length;
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));

		BoardDTO preDTO = (BoardDTO) dao.getReadData("board.preReadData", hMap);
		int preNum = 0;
		String preSubject = "";
		if (preDTO != null) {
			preNum = preDTO.getNum();
			preSubject = preDTO.getSubject();
		}

		BoardDTO nextDTO = (BoardDTO) dao.getReadData("board.nextReadData",
				hMap);
		int nextNum = 0;
		String nextSubject = "";
		if (nextDTO != null) {
			nextNum = nextDTO.getNum();
			nextSubject = nextDTO.getSubject();
		}

		String params = "pageNum=" + pageNum;
		if (!searchValue.equals("")) {
			params += "searchKey=" + searchKey;
			params += "&searchValue=" + searchValue;
			URLEncoder.encode(searchValue, "UTF-8");
		}

		request.setAttribute("preNum", preNum);
		request.setAttribute("preSubject", preSubject);
		request.setAttribute("nextNum", nextNum);
		request.setAttribute("nextSubject", nextSubject);

		request.setAttribute("params", params);
		request.setAttribute("lineSu", lineSu);
		request.setAttribute("pageNum", pageNum);
		return SUCCESS;
	}

	public String updated() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		int num = Integer.parseInt(request.getParameter("num"));
		String mode = request.getParameter("mode");
		if (mode.equals("mode")) {
			dto = (BoardDTO) dao.getReadData("board.readData", num);

			if (dto == null) {
				return "read-error";
			}

			request.setAttribute("mode", "updated");
			request.setAttribute("pageNum", dto.getPageNum());
			return INPUT;
		}
		dao.updateData("board.updateData", dto);

		return SUCCESS;
	}
}
