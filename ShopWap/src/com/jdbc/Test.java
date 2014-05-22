package com.jdbc;

import java.sql.*;

import java.sql.Connection;

public class Test {
	public static void main(String args[]) {
		try {
			Connection conn = DBconnect.getConn();
			Statement st = conn.createStatement();
			String sql = " select * from test ";
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				System.out.print(rs.getInt(1));
				System.out.println(rs.getString(2));
			}
			rs.close();
			st.close();
			conn.close();
		} catch (Exception ee) {
			System.out.print(ee.getMessage());
		}

	}
}
