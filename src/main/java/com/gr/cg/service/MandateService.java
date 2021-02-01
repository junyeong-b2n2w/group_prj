package com.gr.cg.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.gr.cg.dto.MandateVO;

public interface MandateService {
	List<Map<String, Object>> getMdtList(String id) throws SQLException;
	
	void setUnset(List<String> unset) throws SQLException;
	
	void setMandate(MandateVO mdt) throws SQLException;
	
	void setActvyn() throws SQLException;
	
	void turnOnMandate() throws SQLException;
	
	void turnOffMandate() throws SQLException;
}
