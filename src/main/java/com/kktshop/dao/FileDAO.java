package com.kktshop.dao;

import java.util.List;

import com.kktshop.dto.DatabankDTO;

public interface FileDAO {
	public void databankInsert(DatabankDTO databank) throws Exception;
	public List<DatabankDTO> databankList() throws Exception;
}