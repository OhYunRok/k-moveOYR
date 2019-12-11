package com.oyr.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oyr.webapp.dto.BoardDto;
import com.oyr.webapp.service.BoardService;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(HttpSession session) {
		logger.debug("/board");
		return "boardFile";
	}

	@RequestMapping(value = "/boardFile", method = RequestMethod.GET)
	public String boardFile(HttpSession session) {
		logger.debug("/boardFile");
		return "boardFile";
	}

	@RequestMapping(value = "/board/insert", method = RequestMethod.POST)
	@ResponseBody
	public int boardInsert(BoardDto dto) {
		logger.debug("/board/insert");
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		return boardService.boardInsert(dto);
	}

	@RequestMapping(value = "/board/insertFile", method = RequestMethod.POST)
	@ResponseBody
	public int boardInsertFile(BoardDto dto, MultipartFile file) throws Exception {
		logger.debug("/board/insert");

		return boardService.boardInsertFile(dto, file);
	}

	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	@ResponseBody
	public List<BoardDto> boardList(int limit, int offset, String searchWord) {
		logger.debug("/board/list");

		return boardService.boardList(limit, offset, searchWord);
	}

	@RequestMapping(value = "/board/detail", method = RequestMethod.GET)
	@ResponseBody
	public BoardDto boardDetail(int boardId) {
		logger.debug("/board/detail");
		System.out.println(boardId + "-----------");
		System.out.println(boardService.boardDetail(boardId).toString());
		return boardService.boardDetail(boardId);
	}

	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	@ResponseBody
	public int boardUpdate(BoardDto dto) {
		logger.debug("/board/update");
		System.out.println(dto.getContent() + dto.getTitle() + dto.getBoardId());
		return boardService.boardUpdate(dto);
	}

	@RequestMapping(value = "/board/delete", method = RequestMethod.POST)
	@ResponseBody
	public int boardDelete(BoardDto dto) {
		logger.debug("/board/delete");

		return boardService.boardDelete(dto);
	}

	@RequestMapping(value = "/board/list/totalCnt", method = RequestMethod.GET)
	@ResponseBody
	public int boardListCnt(String searchWord) {

		logger.debug("/board/listTotalCnt");

		return boardService.boardListTotalCnt(searchWord);
	}

	@RequestMapping(value = "/board/updateFile", method = RequestMethod.POST)
	@ResponseBody
	public int boardUpdateFile(BoardDto dto, MultipartFile file) throws Exception {

		logger.debug("/board/updateFile");

		return boardService.boardUpdateFile(dto, file);
	}

}