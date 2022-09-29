package bit.data.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.cj.Session;

import bit.data.dto.BoardDto;

@Repository
public class BoardDao implements BoardDaoInter {
	@Autowired
	SqlSession session;	
	String ns = "bit.data.dao.BoardDao.";

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getMaxNum");//bit.data.dao.BoardDao.getMaxNum
	}

	@Override
	public int getTotalCount(Map<String, String> map) {
		return session.selectOne(ns+"getTotalCount",map);
	}

	@Override
	public List<BoardDto> getPagingList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList(ns+"getPagingList",map);
	}

	@Override
	public void insertBoard(BoardDto dto) {
		session.insert(ns+"insertBoard",dto);
	}

	@Override
	public void updateRestep(Map<String, Integer> map) {
		session.update(ns+"updateRestep",map);
	}

	@Override
	public void updateReadCount(int num) {
		session.update(ns+"updateReadCount",num);
	}

	@Override
	public BoardDto getData(int num) {
		
		return session.selectOne(ns+"selectByNum",num);
	}

	@Override
	public void updateBoard(BoardDto dto) {
		session.selectOne(ns+"updateBoard",dto);
	}

	@Override
	public void deleteBoard(int num) {
		session.selectOne(ns+"deleteBoard",num);
	}

	@Override
	public void likesUpdate(int num) {
		session.selectOne(ns+"likesUpdate",num);
	}
	
}
