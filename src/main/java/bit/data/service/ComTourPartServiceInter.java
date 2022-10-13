package bit.data.service;

import bit.data.dto.ComTourPartDto;

public interface ComTourPartServiceInter {
    public void insertPart(ComTourPartDto dto);
    public void updatePart(ComTourPartDto dto);
    public void deletePart(int num);
    public ComTourPartDto getTotalCount(int num);
    public ComTourPartDto getData(int num);
}
