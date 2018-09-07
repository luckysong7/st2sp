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

	// ��ü����
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

		dto.setBoardNum(boardNum); // �Խù��� ��ȣ
		dto.setCommentNum(maxNum + 1); // ����� ��ȣ
		dto.setIpAddr(request.getRemoteAddr());
	
		System.out.println("�Խù� ��ȣ : " + dto.getBoardNum());
		System.out.println("��� ��ȣ : " + dto.getCommentNum());

		dao.insertData("ibbs.insertData2", dto);

		// redirect ��Ű�� ��üȭ���� ���ΰ�ħ�� ��

		return list2(); // �޼ҵ�� �̵���Ŵ

	}

	// created()���� list() �� ã�ƿ�
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

		totalDataCount = dao.getIntValue("ibbs.dataCount2",boardNum); // �Խù� ����

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

		// ����¡ ó���� �ڹٽ�ũ��Ʈ�� ��
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
		System.out.println("�Խù���ȣ : " + boardNum);
		String commentNum = request.getParameter("commentNum"); 
		System.out.println("��� ��ȣ : " + commentNum);
		
		Map<String, Object> hMap2 = new HashMap<String, Object>();

		hMap2.put("boardNum", boardNum);
		hMap2.put("commentNum", commentNum);
		
		System.out.println("hmap : bn = " + hMap2.get("boardNum"));
		System.out.println("hmap : cn = " + hMap2.get("commentNum"));
		
		
		dao.deleteData("ibbs.deleteData2", hMap2);
		return list2();

	}

}
