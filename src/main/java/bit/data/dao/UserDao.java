package bit.data.dao;

import bit.data.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDao implements UserDaoInter {
    @Autowired
    SqlSession session;
    String ns = "bit.data.dao.UserDao.";

    @Override
    public int selectSearchId(String email_id) {
//        System.out.println("Dao_email: " + email_id);
        return session.selectOne(ns + "selectSearchId", email_id);
    }

    @Override
    public int selectSearchNick(String ur_nk) {
//        System.out.println("Dao_ur_nk: " + ur_nk);
        return session.selectOne(ns + "selectSearchNick", ur_nk);
    }

    @Override
    public void insertUser(UserDto dto) {
        System.out.println("Dao : " + dto.getEmail_id());
        System.out.println("Dao : " + dto.getUr_nk());
        System.out.println("Dao : " + dto.getUr_nm());
        System.out.println("Dao : " + dto.getLoc_si());
        session.insert(ns + "insertUser", dto);

    }

    @Override
    public List<String> selectSubstrSi() {
        return session.selectList(ns + "selectSubstrSi");
    }

    @Override
    public List<String> selectSubstrGu(String selGu) {
        return session.selectList(ns + "selectSubstrGu", selGu);
    }

    @Override
    public UserDto selectDataById(int ur_id) {
//        System.out.println("DAO:" + ur_id);
        return session.selectOne(ns + "selectDataById", ur_id);
    }
}
