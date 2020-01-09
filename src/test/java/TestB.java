import com.hniois.util.DateUtil;
import com.hniois.util.Tools;
import org.junit.Test;
import org.junit.platform.commons.util.StringUtils;

import java.util.Date;
import java.util.Random;

public class TestB {

    public String getQRcode(String num) {
        //判断当前字符串是否是9位数,不是的话前面补0
        switch(num.length()){
            case 2:num="0000000"+num;
                break;
            case 3:num="000000"+num;
                break;
            case 4:num="00000"+num;
                break;
            case 5:num="0000"+num;
                break;
            case 6:num="000"+num;
                break;
            case 7:num="00"+num;
                break;
            case 8:num="0"+num;
                break;
            default:num=num;
                break;
        }
        return num;
    }

    @Test
    public void test(){
         String str="1,0,2,3,";
         String code=str.substring(0,str.length()-1);
        String[] arr= code.split(",");
        System.out.println(arr.toString());
    }

    public String getNew(String str) {
        String newStr=null;
        for(int i=1;i<str.length();){
            String first=String.valueOf(str.charAt(0));
            if(first.equals("0")){
               str= str.substring(1);
            }else{
                break;
            }
            newStr=str;
        }
        return newStr;
    }

    public String getNesStr(String st, String str){
        String old=st+",";
        if(old.equals(str)){
            return "";
        }else{
            return str.replace(old,"");
        }

    }


    @Test
    public void getRandomNum(){
        int i=22;
        //获取[10,100)之间的整数
        String st=String.valueOf((int)(Math.random()*90+10));
        String str=st+i;
        String newSt= this.getQRcode(str);
        System.out.println(str);
        System.out.println(newSt);
    }
}
