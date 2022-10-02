package bit.data.service;

import bit.data.dto.ComFeedDto;

import java.util.List;
import java.util.Map;

public interface ComFeedServiceInter {
    public int selectMaxNum();
    public int selectTotalCount(Map<String, String> map);
    public ComFeedDto selectFeed(int num);
    public List<ComFeedDto> searchFeed(Map<String, String> map);
    public void insertFeed(ComFeedDto dto);
    public void updateFeed(ComFeedDto dto);
    public void deleteFeed(int num);
    public void updateLikes(int num);
}
