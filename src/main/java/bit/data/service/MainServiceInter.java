package bit.data.service;

import bit.data.dto.ComFeedDto;
import bit.data.dto.ComTourDto;

import java.util.List;

public interface MainServiceInter {
    public List<ComTourDto> selectTr3List();
    public List<ComFeedDto> selectFd4list();
    public int selectTMcntbyTrid(int tr_id);
}
