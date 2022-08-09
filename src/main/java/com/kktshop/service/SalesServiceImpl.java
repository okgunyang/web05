package com.kktshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kktshop.dao.SalesDAO;
import com.kktshop.dto.SalesDTO;

@Service
public class SalesServiceImpl implements  SalesService{

	@Autowired
	SalesDAO salesDAO;
	
	@Override
	public List<SalesDTO> salesList() throws Exception {
		return salesDAO.salesList();
	}

	@Override
	public List<SalesDTO> salesList(String userid) throws Exception {
		return salesDAO.salesList(userid);
	}

	@Override
	public SalesDTO salesRead(int ono) throws Exception {
		return salesDAO.salesRead(ono);
	}

	@Override
	public int salesCount(String userid) throws Exception {
		return salesDAO.salesCount(userid);
	}

	@Override
	public void addSales(SalesDTO sales) throws Exception {
		salesDAO.addSales(sales);
	}

	@Override
	public void addSales(SalesDTO sales, int bno) throws Exception {
		salesDAO.addSales(sales, bno);
	}
	
	@Override
	public void addShipping(SalesDTO sales) throws Exception {
		salesDAO.addShipping(sales);
	}

	@Override
	public void deletesales(SalesDTO sales) throws Exception {
		salesDAO.deleteSales(sales);
	}

	@Override
	public void updateSales(SalesDTO sales) throws Exception {
		salesDAO.updateSales(sales);
	}
}
