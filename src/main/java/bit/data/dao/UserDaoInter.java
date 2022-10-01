package bit.data.dao;

import bit.data.dto.UserDto;

import java.util.List;

public interface UserDaoInter {
    public int selectSearchId(String emaiId);

    public void insertUser(UserDto dto);

    public List<String> selectSubstrSi();

/*    public int getTotalCount();

    public List<UserDto> getAllusers();

    public void insertuser(UserDto dto);

    public int getSearchId(String id);

    public String getName(String id);

    public int getIdPassCheck(Map<String, String> map);

    public UserDto getDataById(String id);

    public UserDto getDataByNum(int num);

    public void updatePhoto(Map<String, Object> map);

    public void updateuser(UserDto dto);

    public void deleteuser(int num);*/
}
