package bit.data.dao;

import bit.data.dto.ComTourDto;

import java.util.List;
import java.util.Map;

public interface ComTourDaoInter {
    public void insertComTour(ComTourDto dto);
    public void updateComTour(ComTourDto dto);
    public void deleteComTour(int num);
    public int getMaxNum();
    public int getTotalCount(Map<String, String> map);
    public List<ComTourDto> getPagingList(Map<String,Object> map);
    public ComTourDto getUserData(int num);
    public ComTourDto getData(int num);
    public void updatecrw(Map<String,Integer> map);
    public int getCrwCount(Map<String, Integer> map);
}
