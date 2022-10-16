package bit.data.service;

import bit.data.dto.ComFeedDto;

import java.util.List;

public interface ComFeedServiceInter {
    public int selectMaxNum();
    public int selectTotalCount(String searchColumn, String searchWord);
    public ComFeedDto selectFeed(int fd_id);
    public List<ComFeedDto> searchFeedByTag(String searchColumn, String searchWord);
    public List<ComFeedDto> searchFeedByCtg(String cg_nm);
    public List<ComFeedDto> searchBestFeed();
    public void insertFeed(ComFeedDto dto);
    public void updateFeed(ComFeedDto dto);
    public void deleteFeed(int fd_id);
    public void updateLikes(int fd_id);
    public void insertPhoto(ComFeedDto dto);
    public List<String> selectPhoto(int fd_id);
    public void insertFeedLikes(int lg_id, int cf_id);
    public void deleteFeedLikes(int lg_id, int cf_id);
    public int selectTotalFeedLikes(int fd_id);
    public int selectFeedLikesByUrid(int lg_id, int fd_id);
    public void updateFeedLikes(int fd_id);
    public int selectCafeByCfnm(String cf_nm);

}
