package bit.data.service;

import bit.data.dto.ComFeedDto;

import java.util.List;
import java.util.Map;

public class ComFeedService implements ComFeedServiceInter{
    @Override
    public int selectMaxNum() {
        return 0;
    }

    @Override
    public int selectTotalCount(Map<String, String> map) {
        return 0;
    }

    @Override
    public ComFeedDto selectFeed(int num) {
        return null;
    }

    @Override
    public List<ComFeedDto> searchFeed(Map<String, String> map) {
        return null;
    }

    @Override
    public void insertFeed(ComFeedDto dto) {

    }

    @Override
    public void updateFeed(ComFeedDto dto) {

    }

    @Override
    public void deleteFeed(int num) {

    }

    @Override
    public void updateLikes(int num) {

    }
}
