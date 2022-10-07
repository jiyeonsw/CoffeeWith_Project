package bit.data.service;

import bit.data.dao.UserDaoInter;
import bit.data.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService implements UserServiceInter {

    @Autowired
    UserDaoInter userDao;

    @Override
    public int selectSearchId(String email_id) {
//        System.out.println(emailId);
        return userDao.selectSearchId(email_id);
    }

    @Override
    public int selectSearchNick(String ur_nk) {
        return userDao.selectSearchNick(ur_nk);
    }

    @Override
    public void insertUser(UserDto dto) {
        System.out.println("ser " + dto.getEmail_id());
        userDao.insertUser(dto);
    }

    @Override
    public List<String> selectSubstrSi() {
        return userDao.selectSubstrSi();
    }

    @Override
    public List<String> selectSubstrGu(String selGu) {
        return userDao.selectSubstrGu(selGu);
    }

    @Override
    public UserDto selectDataById(int ur_id) {
//        System.out.println(ur_id);
        return userDao.selectDataById(ur_id);
    }

    @Override
    public UserDto getDataById(String id) {
        return null;
    }

    @Override
    public int getIdPassCheck(String email_id, String ur_pw){
        Map<String,String> map=new HashMap<>();
        map.put("email_id",email_id);
        map.put("ur_pw",ur_pw);
        return userDao.getIdPassCheck(map);
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


}
