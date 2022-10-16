package bit.data.service;

import bit.data.dao.ComFeedDaoInter;
import bit.data.dto.ComFeedDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ComFeedService implements ComFeedServiceInter{

    @Autowired
    ComFeedDaoInter daoInter;
    @Override
    public int selectMaxNum() {
        return daoInter.selectMaxNum();
    }

    @Override
    public int selectTotalCount(String searchColumn, String searchWord) {
        Map<String, String> map=new HashMap<>();
        map.put("searchcolumn",searchColumn);
        map.put("searchword",searchWord);
        return daoInter.selectTotalCount(map);
    }

    @Override
    public ComFeedDto selectFeed(int fd_id) {
        return daoInter.selectFeed(fd_id);
    }

    @Override
    public List<ComFeedDto> searchFeedByTag(String searchColumn, String searchWord) {
        Map<String, String> map=new HashMap<>();
        map.put("searchcolumn",searchColumn);
        map.put("searchword",searchWord);
        return daoInter.searchFeedByTag(map);
    }

    @Override
    public List<ComFeedDto> searchFeedByCtg(String cg_nm) {
        Map<String, String> map=new HashMap<>();
        map.put("cg_nm",cg_nm);
        return daoInter.searchFeedByCtg(map);
    }

    @Override
    public List<ComFeedDto> searchBestFeed() {
        return daoInter.searchBestFeed();
    }

    @Override
    public void insertFeed(ComFeedDto dto) {
        daoInter.insertFeed(dto);
    }

    @Override
    public void updateFeed(ComFeedDto dto) {
        daoInter.updateFeed(dto);
    }

    @Override
    public void deleteFeed(int fd_id) {
        daoInter.deleteFeed(fd_id);
    }

    @Override
    public void updateLikes(int fd_id) {
        daoInter.updateLikes(fd_id);
    }

    @Override
    public void insertPhoto(ComFeedDto dto) {
        daoInter.insertPhoto(dto);
    }

    @Override
    public List<String> selectPhoto(int fd_id) {
        return daoInter.selectPhoto(fd_id);
    }

    @Override
    public void insertFeedLikes(int lg_id, int fd_id) {
        Map<String,Integer> map=new HashMap<>();
        map.put("lg_id", lg_id);
        map.put("fd_id",fd_id);
        daoInter.insertFeedLikes(map);
    }

    @Override
    public void deleteFeedLikes(int lg_id, int fd_id) {
        Map<String,Integer> map=new HashMap<>();
        map.put("lg_id", lg_id);
        map.put("fd_id",fd_id);
        daoInter.deleteFeedLikes(map);
    }

    @Override
    public int selectTotalFeedLikes(int fd_id) {
        return daoInter.selectTotalFeedLikes(fd_id);
    }

    public int selectFeedLikesByUrid(int lg_id, int fd_id){
        Map<String,Integer> map=new HashMap<>();
        map.put("lg_id",lg_id);
        map.put("fd_id",fd_id);
        return daoInter.selectFeedLikesByUrid(map);
    }

    @Override
    public void updateFeedLikes(int fd_id) {
        daoInter.updateFeedLikes(fd_id);
    }

    @Override
    public int selectCafeByCfnm(String cf_nm) {
        Map<String,String> map=new HashMap<>();
        map.put("cf_nm",cf_nm);
        return daoInter.selectCafeByCfnm(map);
    }

}
