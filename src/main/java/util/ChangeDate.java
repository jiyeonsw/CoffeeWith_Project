package util;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ChangeDate {
    public static Date getS_Date(String date){
        //날짜 형식
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //시작 날짜 추출
        String str = date.substring(0,10);
        Date s_date = null;
        try {
            s_date = simpleDateFormat.parse(str);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        return s_date;
    }

    public static Date getE_Date(String date){
        //날짜 형식
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        //시작 날짜 추출
        String str = date.substring(13, 23);
        Date e_date = null;
        try {
            e_date = simpleDateFormat.parse(str);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        return e_date;
    }

}
