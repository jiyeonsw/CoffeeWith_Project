package bit.data.service;

import bit.data.dao.UserDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserServiceInter {

    @Autowired
    UserDaoInter userDao;

    @Override
    public int selectSearchId(String email_id) {
        System.out.println(email_id);
        return userDao.selectSearchId(email_id);
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
