package com.oyr.webapp.dao;

import java.util.List;

import com.oyr.webapp.dto.BoardDto;
import com.oyr.webapp.dto.BoardFileDto;

public interface BoardDao {
   int boardInsert(BoardDto dto);
   List<BoardDto> boardList(int limit, int offset);

   int boardListTotalCnt();
   BoardDto boardDetail(int boardId);
   int boardUpdate(BoardDto dto);
   int boardDelete(BoardDto dto);
   int boardDeleteFile(int boardId);
   int boardInsertFile(BoardFileDto dto);
   List<BoardFileDto> boardDetailFileList(int boardId);
   List<String> boardDeleteFileUrl(int boardId);
   
   public List<BoardDto> boardListSearchWord(int limit, int offset, String searchWord);
   public int boardListSearchWordTotalCnt(String searchWord);

}