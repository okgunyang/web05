package com.kktshop.service;

import java.util.List;

import com.kktshop.dto.SalesDTO;

public interface SalesService {
	public List<SalesDTO> salesList() throws Exception;
	public List<SalesDTO> salesList(String userid) throws Exception;
	public SalesDTO salesRead(int ono) throws Exception;
	public int salesCount(String userid) throws Exception;
	public void addSales(SalesDTO sales) throws Exception;
	public void addSales(SalesDTO sales, int bno) throws Exception;
	public void addShipping(SalesDTO sales) throws Exception;
	public void deletesales(SalesDTO sales) throws Exception;
	public void updateSales(SalesDTO sales) throws Exception;
}