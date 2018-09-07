package com.ibbs;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.forever.common.MyUtil;
import com.forever.common.dao.CommonDAO;
import com.iguest.GuestDTO;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class CommentAction extends ActionSupport implements Preparable,
		ModelDriven<CommentDTO> {

	private static final long serialVersionUID = 1L;
	private CommentDTO dto;

	// 객체생성
	@Resource(name = "dao")
	private CommonDAO dao;

	@Resource(name = "myUtil")
	private MyUtil myUtil;

	public CommentDTO getDto() {
		return dto;
	}

	@Override
	public CommentDTO getModel() {
		return dto;
	}

	@Override
	public void prepare() throws Exception {
		dto = new CommentDTO();
	}

	public String created2() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		int maxNum = dao.getIntValue("ibbs.numMax2",boardNum);

		dto.setBoardNum(boardNum); // 게시물의 번호
		dto.setCommentNum(maxNum + 1); // 댓글의 번호
		dto.setIpAddr(request.getRemoteAddr());
	
		System.out.println("게시물 번호 : " + dto.getBoardNum());
		System.out.println("댓글 번호 : " + dto.getCommentNum());

		dao.insertData("ibbs.insertData2", dto);

		// redirect 시키면 전체화면이 새로고침이 됨

		return list2(); // 메소드로 이동시킴

	}

	// created()에서 list() 로 찾아옴
	public String list2() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();

		int numPerPage = 5;
		int totalPage = 0;
		int totalDataCount = 0;
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		System.out.println(boardNum);
		String pageNum = request.getParameter("pageNum");

		int currentPage = 1;

		if (pageNum != null && pageNum != "") {
			currentPage = Integer.parseInt(pageNum);
		} else {
			pageNum = "1";
		}

		totalDataCount = dao.getIntValue("ibbs.dataCount2",boardNum); // 게시물 개수

		if (totalDataCount != 0) {
			totalPage = myUtil.getPageCount(numPerPage, totalDataCount);

		}

		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		Map<String, Object> hMap = new HashMap<String, Object>();

		int start = (currentPage - 1) * numPerPage + 1;
		int end = (currentPage) * numPerPage;

		hMap.put("start", start);
		hMap.put("end", end);
		hMap.put("boardNum", boardNum);

		List<Object> lists = (List<Object>) dao.getListData("ibbs.listData2",
				hMap);

		int listNum, n = 0;

		Iterator<Object> it = lists.iterator();

		while (it.hasNext()) {

			CommentDTO vo = (CommentDTO) it.next();

			listNum = totalDataCount - (start + n - 1);
			vo.setListNum(listNum);

			vo.setContent(vo.getContent().replaceAll("\n", "<br/>"));
			n++;

		}

		// 페이징 처리를 자바스크립트로 함
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage);

		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("totalDataCount", totalDataCount);
		request.setAttribute("pageNum", currentPage);

		return SUCCESS;
	}

	public String deleted2() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		System.out.println("게시물번호 : " + boardNum);
		String commentNum = request.getParameter("commentNum"); 
		System.out.println("댓글 번호 : " + commentNum);
		
		Map<String, Object> hMap2 = new HashMap<String, Object>();

		hMap2.put("boardNum", boardNum);
		hMap2.put("commentNum", commentNum);
		
		System.out.println("hmap : bn = " + hMap2.get("boardNum"));
		System.out.println("hmap : cn = " + hMap2.get("commentNum"));
		
		
		dao.deleteData("ibbs.deleteData2", hMap2);
		return list2();

	}

}
