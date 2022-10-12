package bit.data.dao;

import bit.data.dto.UserDto;

import java.util.List;
import java.util.Map;

public interface UserDaoInter {
    public int getTotalCount();

    public List<UserDto> getAllUser();

    public void insertUsers(UserDto dto);

    public int selectSearchId(String email_id);

    public int selectSearchNick(String ur_nk);

    public void insertUser(UserDto dto);

    public List<String> selectSubstrSi();

    public List<String> selectSubstrGu(String selGu);

    public UserDto selectDataById(int ur_id);

    public int getIdPassCheck(Map<String,String> map);

    public UserDto selectEmailId(String id);

    public String selectUserPass(int ur_id);

    public void updateUserPass(Map map);

    public void updateUserData(UserDto dto);
}

