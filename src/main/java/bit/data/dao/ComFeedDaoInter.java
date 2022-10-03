package bit.data.dao;

import bit.data.dto.ComFeedDto;

import java.util.List;
import java.util.Map;

public interface ComFeedDaoInter {
    public int selectMaxNum();
    public int selectTotalCount(Map<String, String> map);
    public ComFeedDto selectFeed(int num);
    public List<ComFeedDto> searchFeedByTag(Map<String, String> map);
    public void insertFeed(ComFeedDto dto);
    public void updateFeed(ComFeedDto dto);
    public void deleteFeed(int num);
    public void updateLikes(int num);
}