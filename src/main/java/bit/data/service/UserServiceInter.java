package bit.data.service;

import bit.data.dto.UserDto;

import java.util.List;

public interface UserServiceInter {

    public int selectSearchId(String emailId);

    public void insertUser(UserDto dto);

    public List<String> selectSubstrSi();

	/*public int getTotalCount();
	public List<UserDto> getAllusers();

	public int getSearchId(String id);
	public String getName(String id);
	
	public int getIdPassCheck(String id, String pass);
	public UserDto getDataById(String id);
	public UserDto getDataByNum(int num);
	public void updatePhoto(int num, String photo);
	public void updateuser(UserDto dto);
	public void deleteuser(int num);*/
}
