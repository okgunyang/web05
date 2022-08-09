package com.kktshop.dao;

import java.util.List;

import com.kktshop.dto.NoticeDTO;
import com.kktshop.util.PageMaker;

public interface NoticeDAO {
	public List<NoticeDTO> noticeList() throws Exception;
	public List<NoticeDTO> noticePageList(PageMaker page) throws Exception;
	public NoticeDTO noticeRead(int seq) throws Exception;
	public int noticeCount() throws Exception;
	public void addNotice(NoticeDTO notice) throws Exception; 
	public void deleteNotice(NoticeDTO notice) throws Exception;
	public void updateNotice(NoticeDTO notice) throws Exception;
}