package bit.data.service;

import bit.data.dao.UserDaoInter;
import bit.data.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService implements UserServiceInter {

    @Autowired
    UserDaoInter UserDao;

    @Override
    public int selectSearchId(String email_id) {
//        System.out.println(emailId);
        return UserDao.selectSearchId(email_id);
    }

    @Override
    public int selectSearchNick(String ur_nk) {
        return UserDao.selectSearchNick(ur_nk);
    }

    @Override
    public void insertUser(UserDto dto) {
        System.out.println("ser " + dto.getEmail_id());
        UserDao.insertUser(dto);
    }

    @Override
    public List<String> selectSubstrSi() {
        return UserDao.selectSubstrSi();
    }

    @Override
    public List<String> selectSubstrGu(String selGu) {
        return UserDao.selectSubstrGu(selGu);
    }

    @Override
    public UserDto selectDataById(int ur_id) {
//        System.out.println(ur_id);
        return UserDao.selectDataById(ur_id);
    }

    @Override
    public UserDto getDataById(String id) {
        return null;
    }

    @Override
    public int getIdPassCheck(String id, String pass) {
        return 0;
    }

    @Override
    public void deleteUser(int num) {

    }

    @Override
    public UserDto getDataByNum(int num) {
        return null;
    }

    @Override
    public void updateUser(UserDto dto) {

    }



    /* @Override
    public int getIdPassCheck(String id, String pass) {
        Map<String, String> map = new HashMap<>();
        map.put("loginid", id);
        map.put("loginpass", pass);

        return userDao.getIdPassCheck(map);
    }

    @Override
    public UserDto getDataById(String id) {
        return userDao.getDataById(id);
    }

    @Override
    public UserDto getDataByNum(int num) {
        return userDao.getDataByNum(num);
    }

    @Override
    public void updatePhoto(int num, String photo) {
        Map<String, Object> map = new HashMap<>();
        map.put("num", num);
        map.put("photo", photo);

        userDao.updatePhoto(map);
    }

    @Override
    public void updateuser(UserDto dto) {
        userDao.updateuser(dto);
    }

    @Override
    public void deleteuser(int num) {
        userDao.deleteuser(num);
        ;
    }

    @Override
    public int getTotalCount() {
        return userDao.getTotalCount();
    }

    @Override
    public List<UserDto> getAllusers() {
        return userDao.getAllusers();
    }

    @Override
    public void insertuser(UserDto dto) {
        userDao.insertuser(dto);
    }

    @Override
    public int getSearchId(String id) {
        return userDao.getSearchId(id);
    }

    @Override
    public String getName(String id) {
        return userDao.getName(id);
    }*/

}
