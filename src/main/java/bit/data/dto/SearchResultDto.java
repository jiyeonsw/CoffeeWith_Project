package bit.data.dto;

import lombok.Data;

@Data
public class SearchResultDto {
    private int cf_id;
    private String cf_nm;
    private int cm_cnt;
    private int ck_cnt;
    public int totalCount;
    public int currentPage;
    public int startPage;
    public int endPage;
    public int no;
    public int totalPage;
    public String img;
}
