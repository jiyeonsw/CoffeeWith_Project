package bit.data.service;

import bit.data.dto.ComTourDto;

import java.util.List;
import java.util.Map;

public interface ComTourServiceInter {

    public void insertComTour(ComTourDto dto);
    public void updateComTour(ComTourDto dto);
    public void deleteComTour(int num);
    public int getMaxNum();
    public int getTotalCount(String searchcolumn, String searchword);
    public List<ComTourDto> getPagingList(String searchcolumn, String searchword);
    public ComTourDto getUserData(int num);
    public ComTourDto getData(int num);
    public void updatecrw(int tr_cmp,int tr_id);
    public int getCrwCount(int ur_id, int tr_id);
}
