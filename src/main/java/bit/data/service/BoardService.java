package bit.data.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.data.dao.BoardDaoInter;
import bit.data.dto.BoardDto;

@Service
public class BoardService implements BoardServiceInter {
	
	@Autowired
	BoardDaoInter daoInter;
	
	
	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return daoInter.getMaxNum();
	}

	@Override
	public int getTotalCount(String searchColumn, String searchWord) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchcolumn", searchColumn);
		map.put("searchword", searchWord);
		
		return daoInter.getTotalCount(map);
	}

	@Override
	public List<BoardDto> getPagingList(String searchColumn, String searchWord, int startNum, int perPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchcolumn", searchColumn);
		map.put("searchword", searchWord);
		map.put("startnum", startNum);
		map.put("perpage", perPage);
		return daoInter.getPagingList(map);
	}

	@Override
	public void insertBoard(BoardDto dto) {
		//새글인지 답글인지 판단해서 로직을 짠다
		int num=dto.getNum();
		int regroup = dto.getRegroup();
		int restep = dto.getRestep();
		int relevel = dto.getRelevel();
		
		if(num==0) { //새글일경우
			
			regroup = this.getMaxNum()+1;//겹치지않을 목적으로 줌
			restep = 0;
			relevel = 0;
		} else { //답글일경우
			//같은 그룹중 전달받은 restep보다 큰 값들은 모두 일괄적으로 +1을 해준다
			this.updateRestep(regroup, restep);
			//그리고 나서 전달받은 값보다 1크게 db에 저장한다.
			restep++;
			relevel++;
		}
		//변경된 값들을 다시 dto에 넣는다
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		daoInter.insertBoard(dto);
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("regroup", regroup);
		map.put("restep", restep);
		daoInter.updateRestep(map);
	}

	@Override
	public void updateReadCount(int num) {
		daoInter.updateReadCount(num);
	}

	@Override
	public BoardDto getData(int num) {
		return daoInter.getData(num);
	}

	@Override
	public void updateBoard(BoardDto dto) {
		daoInter.updateBoard(dto);
	}

	@Override
	public void deleteBoard(int num) {
		daoInter.deleteBoard(num);
	}

	@Override
	public void likesUpdate(int num) {
		daoInter.likesUpdate(num);
	}

}
