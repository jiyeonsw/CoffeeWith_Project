package bit.data.service;

import java.util.List;

import bit.data.dto.UserDto;

public interface UserServiceInter {
	public int getTotalCount();
	public List<UserDto> getAllusers();
	public void insertuser(UserDto dto);
	public int getSearchId(String id);
	public String getName(String id);
	
	public int getIdPassCheck(String id, String pass);
	public UserDto getDataById(String id);
	public UserDto getDataByNum(int num);
	public void updatePhoto(int num, String photo);
	public void updateuser(UserDto dto);
	public void deleteuser(int num);
}
