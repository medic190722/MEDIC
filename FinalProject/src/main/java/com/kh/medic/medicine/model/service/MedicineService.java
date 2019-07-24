package com.kh.medic.medicine.model.service;

import java.util.List;
import java.util.Map;

import com.kh.medic.medicine.model.vo.MedicineVo;

public interface MedicineService {

	
	/**
	 * 게시글 목록 조회용 메소드
	 * @param cPage
	 * @param limit
	 * @return
	 */
	List<Map<String,String>> selectMedicineList(int cPage,int limit);
	
	/**
	 * 페이지처리를 위한 게시글 총 갯수
	 * @return
	 */
	int selectMedicineTotalContents();
	
	
	/**
	 * 게시글 추가 메소드
	 * @param medicine
	 * @return
	 */
	int insertMedicine(MedicineVo medicine);
	
	/**
	 * 게시글 내용 조회 메소드
	 * @param medCode
	 * @return
	 */
	MedicineVo selectOneMedicine(String medCode);
	
	/**
	 * 게시글 수정 메소드
	 * @param medicine
	 * @return
	 */
	int updateMedicine(MedicineVo medicine);
	
	/**
	 * 게시글 삭제 메소드
	 * @param medCode
	 * @return
	 */
	int deleteMedicine(String medCode);
	
	
	
	
	
	
}
