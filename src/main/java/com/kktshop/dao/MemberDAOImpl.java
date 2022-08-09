package com.kktshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kktshop.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> memberList() throws Exception {
		return sqlSession.selectList("member.memberList");
	}

	@Override
	public int memberCount() throws Exception {
		return sqlSession.selectOne("member.memberCount");
	}
	
	@Override
	public MemberDTO getMember(String id) throws Exception {
		return sqlSession.selectOne("member.getMember");
	}

	@Override
	public void joinMember(MemberDTO member) throws Exception {
		sqlSession.insert("member.joinMember", member);
	}

	@Override
	public MemberDTO loginMember(MemberDTO member) throws Exception {
		System.out.println("DAO login id : "+member.getId());
		return sqlSession.selectOne("member.loginMember", member);
	}

	@Override
	public void deleteMember(MemberDTO member) throws Exception {
		String id = member.getId();
		sqlSession.delete("member.deleteMember", id);
	}

	
	
	@Override
	public void updateMember(MemberDTO member) throws Exception {
		sqlSession.update("member.updateMember", member);
	}

	@Override
	public int checkExistMember(String id) throws Exception {
		return sqlSession.selectOne("member.checkExistMember", id);
	}	
}
