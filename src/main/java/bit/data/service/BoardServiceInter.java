package bit.data.service;

import java.util.List;

import bit.data.dto.BoardDto;

public interface BoardServiceInter {
	public int getMaxNum();
	public int getTotalCount(String searchColumn,String searchWord);
	public List<BoardDto> getPagingList(String searchColumn,String searchWord, int startNum, int perPage);
	public void insertBoard(BoardDto dto);
	public void updateRestep(int regroup, int restep);
	public void updateReadCount(int num);
	public BoardDto getData(int num);
	public void updateBoard(BoardDto dto);
	public void deleteBoard(int num);
	public void likesUpdate(int num);
}
