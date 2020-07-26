package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connect.DBConnect;
import model.VietNam;

public class VietNamDAO {

	public VietNamDAO() {

	}

	public List<VietNam> selectVietNam() {
		Connection conn = DBConnect.getConnection();
		List<VietNam> listV = new ArrayList<>();
		try {
			String sql = "select * from vietnam";
			PreparedStatement st = conn.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int cases = rs.getInt("cases");
				int active = rs.getInt("active");
				int deaths = rs.getInt("deaths");
				int recovered = rs.getInt("recovered");

				listV.add(new VietNam(id, name, cases, active, deaths, recovered));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return listV;
	}

}
