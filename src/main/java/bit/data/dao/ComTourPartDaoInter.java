package bit.data.dao;


import bit.data.dto.ComTourPartDto;

public interface ComTourPartDaoInter {
    public void insertPart(ComTourPartDto dto);
    public void updatePart(ComTourPartDto dto);
    public void deletePart(int num);
    public ComTourPartDto getTotalCount(int num);
    public ComTourPartDto getData(int num);
}
