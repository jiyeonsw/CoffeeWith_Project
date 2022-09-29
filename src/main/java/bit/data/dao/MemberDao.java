package bit.data.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.MemberDto;

@Repository
public class MemberDao implements MemberDaoInter {
	@Autowired
	SqlSession session;
	//namespace를 짧게 만들어 편의성을 줌.
	String ns = "bit.data.dao.MemberDao.";
	
	@Override
	public int getIdPassCheck(Map<String, String> map) {
		return session.selectOne(ns+"loginIdPassCheck", map);
	}

	@Override
	public MemberDto getDataById(String id) {
		return session.selectOne(ns+"getDateById",id);
	}

	@Override
	public MemberDto getDataByNum(int num) {
		return session.selectOne(ns+"getDateByNum",num);
	}

	@Override
	public void updatePhoto(Map<String, Object> map) {
		session.update(ns+"updatePhoto",map);
	}

	@Override
	public void updateMember(MemberDto dto) {
		session.update(ns+"updateMember",dto);
	}

	@Override
	public void deleteMember(int num) {
		session.delete(ns+"deleteMember",num);
	}

	@Override
	public int getTotalCount() {
		//같은 id가 없을 경우 아래처럼 id만 작성
		//같은 id가 있을 경우 namespace.getTotalCount
		return session.selectOne(ns+"getTotalCount"); //bit.data.dao.MemberDao.getTotalCount
	}

	@Override
	public List<MemberDto> getAllMembers() {
		return session.selectList(ns+"getAllMembers");
	}

	@Override
	public void insertMember(MemberDto dto) {
		session.insert(ns+"insertMember",dto);
	}

	@Override
	public int getSearchId(String id) {
		return session.selectOne(ns+"getIdSearch",id);
	}
	
	@Override
	public String getName(String id) {
		return session.selectOne(ns+"getName",id);
	}

}
