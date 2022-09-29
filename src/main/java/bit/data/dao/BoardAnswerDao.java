package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.BoardAnswerDto;
@Repository
public class BoardAnswerDao implements BoardAnswerDaoInter {

	@Autowired
	SqlSession session;
	
	String ns = "bit.data.dao.BoardAnswerDao.";
	
	@Override
	public List<BoardAnswerDto> getAllAnswerList(int num) {
		
		return session.selectList(ns+"selectAllDatas",num);
	}

	@Override
	public void insertAnswer(BoardAnswerDto dto) {
		session.insert(ns+"insertAnswer",dto);
	}

	@Override
	public BoardAnswerDto getAnswer(int idx) {
		return session.selectOne(ns+"selectAnswerByIdx",idx);
	}

	@Override
	public void deleteAnswer(int idx) {
		session.delete(ns+"deleteByIdx",idx);
	}
}
