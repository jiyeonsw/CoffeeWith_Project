package bit.data.service;

import bit.data.dto.UserDto;

import java.util.List;

public interface UserServiceInter {

    public List<String> selectSubstrSi();

    public List<String> selectSubstrGu(String selGu);

    public int selectSearchId(String email_id);

    public int selectSearchNick(String ur_nk);

    public int getIdPassCheck(String email_id, String ur_pw);

    public void insertUser(UserDto dto);

    public void updateUserData(UserDto dto);

    public void updateUser(UserDto dto);

    public void updateUserPass(String new_pass, int login_id);

    public String selectUserPass(int ur_id);

    public UserDto getDataById(String email_id);

    public UserDto selectDataById(int ur_id);

    public UserDto selectEmailId(String email_id);

    public UserDto getDataByNum(int num);

    public void deleteUser(int num);
}
