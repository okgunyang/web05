package com.kktshop.service;

import java.util.List;

import com.kktshop.dto.DatabankDTO;

public interface FileService {
	public void databankInsert(DatabankDTO databank) throws Exception;
	public List<DatabankDTO> databankList() throws Exception;
}
