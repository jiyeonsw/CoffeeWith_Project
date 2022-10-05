package bit.data.dto;

import lombok.Data;

import java.util.List;

@Data
public class SearchResultDto {
    public CafeDto dto;
    public int totalCount;
    public int currentPage;
    public int startPage;
    public int endPage;
    public int no;
    public int totalPage;
    public List<CafeImgDto> img;
}
