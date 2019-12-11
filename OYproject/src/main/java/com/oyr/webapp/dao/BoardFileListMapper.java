package com.oyr.webapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;

import org.springframework.jdbc.core.RowMapper;

import com.oyr.webapp.dto.BoardFileDto;

public class BoardFileListMapper implements RowMapper<BoardFileDto> {
	   @Override
	   public BoardFileDto mapRow(ResultSet rs, int count) throws SQLException {
	      BoardFileDto dto = new BoardFileDto();
	      dto.setBoardId(rs.getInt("board_id"));
	      dto.setFileId(rs.getInt("file_id"));
	      dto.setFileName(rs.getString("file_name"));
	      dto.setFileContentType(rs.getString("file_content_type"));
	      dto.setFileSize(rs.getInt("file_size"));
	      dto.setFileUrl(rs.getString("file_url"));
	      Calendar cal = new GregorianCalendar();
	      dto.setRegDt(rs.getTimestamp("reg_dt", cal));
	      return dto;
	   }   
	}