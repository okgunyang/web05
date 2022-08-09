package com.kktshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kktshop.dao.MemberDAO;
import com.kktshop.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public List<MemberDTO> memberList() throws Exception {
		return memberDAO.memberList();
	}

	@Override
	public int memberCount() throws Exception {
		return memberDAO.memberCount();
	}

	@Override
	public MemberDTO getMember(String id) throws Exception {
		return memberDAO.getMember(id);
	}

	@Override
	public void joinMember(MemberDTO member) throws Exception {
		memberDAO.joinMember(member);
	}

	@Override
	public MemberDTO loginMember(MemberDTO member) throws Exception {
		System.out.println("Service login id : "+member.getId());
		return memberDAO.loginMember(member);
	}

	@Override
	public void deleteMember(MemberDTO member) throws Exception {
		memberDAO.deleteMember(member);
	}

	@Override
	public int checkExistMember(String id) throws Exception {
		return memberDAO.checkExistMember(id);
	}

	@Override
	public void updateMember(MemberDTO member) throws Exception {
		memberDAO.updateMember(member);
	}

	@Override
	public boolean loginMemberTest(MemberDTO member) throws Exception {
		if(member.getId().equals("admin") && member.getPwd().equals("1234")) {
			return true;	
		} else {
			return false;
		}
	}	
}
