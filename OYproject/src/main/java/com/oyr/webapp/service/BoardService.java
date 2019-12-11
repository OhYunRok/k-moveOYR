package com.oyr.webapp.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.oyr.webapp.dto.BoardDto;

public interface BoardService {
	public int boardInsert(BoardDto dto);
	
	public List<BoardDto> boardList(int limit, int offset, String searchWord);
	
	public int boardListTotalCnt(String searchWord);
	
	public BoardDto boardDetail(int boardId);
	
	public int boardUpdate(BoardDto dto);
	
	public int boardDelete(BoardDto dto);
	
	public int boardInsertFile(BoardDto dto, MultipartFile file) throws Exception;
	
	int boardUpdateFile(BoardDto dto, MultipartFile file) throws Exception;
}
