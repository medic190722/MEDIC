package com.kh.medic.common.typeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class StringArrayPhoneTypeHandler implements TypeHandler<String[]>{
	//TypeHandler : 문자나 숫자가 들어왔을 때 Parsing처리 담당
	
		@Override
		public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
			
			if(parameter != null) {
				ps.setString(i, String.join("-",parameter));			
			} else {
				ps.setString(i, "NULL");
			}
			
		}

		@Override
		public String[] getResult(ResultSet rs, String columnName) throws SQLException {
			String str = rs.getString(columnName);
			String[] result = str.split(", ");
			return result;
		}

		@Override
		public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
			String str = rs.getString(columnIndex);
			String[] result = str.split(", ");
			return result;
		}

		@Override
		public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
			String str = cs.getString(columnIndex);
			String[] result = str.split(", ");
			return result;
		}
}
