package com.kktshop.dao;

import java.util.List;

import com.kktshop.dto.MemberDTO;

public interface MemberDAO {
	public List<MemberDTO> memberList() throws Exception;
	public int memberCount() throws Exception;
	public MemberDTO getMember(String id) throws Exception;
	public void joinMember(MemberDTO member) throws Exception;
	public MemberDTO loginMember(MemberDTO member) throws Exception;
	public void deleteMember(MemberDTO member) throws Exception;
	public int checkExistMember(String id) throws Exception;
	public void updateMember(MemberDTO member) throws Exception;
}