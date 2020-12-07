package com.kh.maison.member.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.kh.maison.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member mem);
	Member selectMemberOne(String id);
	int updateAuthKey(Map<String,String> map);
	int updateAuthStatus(String id);
	List<Member> findId(Member mem);

}
