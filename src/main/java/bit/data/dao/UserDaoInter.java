package bit.data.dao;

import bit.data.dto.UserDto;

import java.util.List;

public interface UserDaoInter {
    int getTotalCount();

    List<UserDto> getAllUser();

    void insertUsers(UserDto dto);

    public int selectSearchId(String email_id);

    public int selectSearchNick(String ur_nk);

    public void insertUser(UserDto dto);

    public List<String> selectSubstrSi();

    public List<String> selectSubstrGu(String selGu);

    public UserDto selectDataById(int ur_id);

}

