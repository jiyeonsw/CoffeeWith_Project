package bit.data.dao;

import bit.data.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao implements UserDaoInter {
    @Autowired
    SqlSession session;
    //namespace를 짧게 만들어 편의성을 줌.
    String ns = "bit.data.dao.UserDao.";

    @Override
    public int selectSearchId(String email_id) {
        System.out.println("email" + email_id);
        return session.selectOne(ns + "selectSearchId", email_id);
    }

    @Override
    public void insertUser(UserDto dto) {
        session.insert(ns + "insertUser", dto);

    }


	/*
	@Override
	public int getIdPassCheck(Map<String, String> map) {
		return session.selectOne(ns+"loginIdPassCheck", map);
	}

	@Override
	public UserDto getDataById(String id) {
		return session.selectOne(ns+"getDateById",id);
	}

	@Override
	public UserDto getDataByNum(int num) {
		return session.selectOne(ns+"getDateByNum",num);
	}

	@Override
	public void updatePhoto(Map<String, Object> map) {
		session.update(ns+"updatePhoto",map);
	}

	@Override
	public void updateuser(UserDto dto) {
		session.update(ns+"updateuser",dto);
	}

	@Override
	public void deleteuser(int num) {
		session.delete(ns+"deleteuser",num);
	}

	@Override
	public int getTotalCount() {
		//같은 id가 없을 경우 아래처럼 id만 작성
		//같은 id가 있을 경우 namespace.getTotalCount
		return session.selectOne(ns+"getTotalCount"); //bit.data.dao.userDao.getTotalCount
	}

	@Override
	public List<UserDto> getAllusers() {
		return session.selectList(ns+"getAllusers");
	}

	@Override
	public void insertuser(UserDto dto) {
		session.insert(ns+"insertuser",dto);
	}

	@Override
	public int getSearchId(String id) {
		return session.selectOne(ns+"getIdSearch",id);
	}
	
	@Override
	public String getName(String id) {
		return session.selectOne(ns+"getName",id);
	}*/

}
