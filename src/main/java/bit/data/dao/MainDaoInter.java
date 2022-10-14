package bit.data.dao;

import bit.data.dto.ComFeedDto;
import bit.data.dto.ComTourDto;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface MainDaoInter {
    public List<ComTourDto> selectTr3List();
    public List<ComFeedDto> selectFd4list();
    public int selectTMcntbyTrid(int tr_id);
}
