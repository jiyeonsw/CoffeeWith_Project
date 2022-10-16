package bit.data.service;


import bit.data.dto.ComTourPartDto;

import java.util.List;

public interface ComTourPartServiceInter {
    public void insertPart(ComTourPartDto dto);
    public void updatePart(ComTourPartDto dto);
    public void deletePart(int num);
    public int getTotalCount(int num);
    public ComTourPartDto getData(int num);
    public List<ComTourPartDto> getAllPartList(int tr_id);
}
