package com.kh.medic.medicine.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.medic.medicine.model.vo.MedicineVo;

@Repository
public class MedicineDaoImpl implements MedicineDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Map<String, String>> selectMedicineList(int cPage, int limit) {

		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("medicine.selectMedicineList",null,rows);
	}
	
	@Override
	public List<Map<String, String>> selectMedicineListSearch(int cPage, int limit,String medName) {

		RowBounds rows=new RowBounds((cPage-1)*limit,limit);
		return sqlSession.selectList("medicine.selectMedicineListSearch",medName,rows);
	}

	@Override
	public int selectMedicineTotalContents() {

		return sqlSession.selectOne("medicine.selectMedicineTotalContents");
	}

	@Override
	public int insertMedicine(MedicineVo medicine) {

		return sqlSession.insert("medicine.insertMedicine",medicine);
	}

	@Override
	public MedicineVo selectOneMedicine(String medCode) {

		return sqlSession.selectOne("medicine.selectOneMedicine",medCode);
	}

	@Override
	public int updateMedicine(MedicineVo medicine) {

		return sqlSession.update("medicine.updateMedicine",medicine);
	}

	@Override
	public int deleteMedicine(String medCode) {

		return sqlSession.delete("medicine.deleteMedicine",medCode);
	}

}
