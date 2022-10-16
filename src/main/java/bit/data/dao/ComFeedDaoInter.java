package bit.data.dao;

import bit.data.dto.ComFeedDto;

import java.util.List;
import java.util.Map;

public interface ComFeedDaoInter {
    public int selectMaxNum();
    public int selectTotalCount(Map<String, String> map);
    public ComFeedDto selectFeed(int fd_id);
    public List<ComFeedDto> searchFeedByTag(Map<String, String> map);
    public List<ComFeedDto> searchFeedByCtg(Map<String, String> map);
    public List<ComFeedDto> searchBestFeed();
    public void insertFeed(ComFeedDto dto);
    public void updateFeed(ComFeedDto dto);
    public void deleteFeed(int fd_id);
    public void updateLikes(int fd_id);
    public void insertPhoto(ComFeedDto dto);
    public List<String> selectPhoto(int fd_id);
    public void insertFeedLikes(Map<String,Integer> map);
    public void deleteFeedLikes(Map<String,Integer> map);
    public int selectTotalFeedLikes(int fd_id);
    public int selectFeedLikesByUrid(Map<String,Integer> map);
    public void updateFeedLikes(int fd_id);
    public int selectCafeByCfnm(Map<String,String> map);


}