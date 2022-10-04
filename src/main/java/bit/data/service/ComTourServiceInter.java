package bit.data.service;

import bit.data.dto.ComTourDto;

import java.util.Map;

public interface ComTourServiceInter {

    public void insertComTour(ComTourDto dto);
    public void updateComTour(ComTourDto dto);
    public void deleteComTour(int num);
    public int getMaxNum();
    public int getTotalCount(Map<String, String> map);
}
