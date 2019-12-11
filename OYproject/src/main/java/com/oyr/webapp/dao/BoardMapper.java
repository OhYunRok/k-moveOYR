package com.oyr.webapp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.oyr.webapp.dto.BoardDto;

public class BoardMapper implements RowMapper<BoardDto>  {

	@Override
	public BoardDto mapRow(ResultSet rs, int count) throws SQLException {
		   BoardDto dto = new BoardDto();
		      dto.setBoardId(rs.getInt("board_id"));
		      dto.setUserSeq(rs.getString("user_seq"));
		      dto.setUserName(rs.getString("user_name"));
		      dto.setTitle(rs.getString("title"));
		      dto.setContent(rs.getString("content"));
		      dto.setRegDt(rs.getDate("reg_dt"));
		      dto.setReadCount(rs.getInt("read_count"));
		      							//this argument == Mysql row name !!!
		      //System.out.println("dto.getRegDt :" + dto.getRegDt());
		      return dto;
	}

}
