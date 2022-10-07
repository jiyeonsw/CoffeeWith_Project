package bit.data.service;

import bit.data.dto.UserDto;

import java.util.List;

public interface UserServiceInter {

    public int selectSearchId(String email_id);

    public int selectSearchNick(String ur_nk);

    public void insertUser(UserDto dto);

    public List<String> selectSubstrSi();

    public List<String> selectSubstrGu(String selGu);

    public UserDto selectDataById(int ur_id);


    UserDto getDataById(String id);

    int getIdPassCheck(String id, String pass);

    void deleteUser(int num);

    UserDto getDataByNum(int num);

    void updateUser(UserDto dto);
}
