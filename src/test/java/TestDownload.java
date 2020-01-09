import com.hniois.util.DateUtil;
import com.hniois.util.GetWeb;
import com.hniois.util.UuidUtil;
import org.apache.commons.lang.StringUtils;
import org.junit.Test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 测试
 *
 * */
public class TestDownload {

    @Test
    public void TestDowloads() throws Exception{
        GetWeb.downloads("d:\\image\\","http://www.shfda.org/");
    }

    /**
     * 下载图片 :
     *              无法加载css中的图片
     * @param savePath 保存路径
     * @param web_url  网页路径
     */
    public void downloads(String savePath,String web_url) throws Exception{
        if (StringUtils.isEmpty(savePath)){
            System.out.println("请输入保存路径");
            return ;
        }
        if (StringUtils.isEmpty(savePath)){
            System.out.println("请输入保存路径");
            return ;
        }
        //解压文件名称
        String zipName = "get_Imgs.zip";
        zipName = URLEncoder.encode(zipName,"UTF-8");
        // 输出的文件流
        File sf=new File(savePath);
        if(!sf.exists()){
            sf.mkdirs();
        }
        OutputStream os = new FileOutputStream(sf.getPath() + "\\" + zipName);
        //解压zip OS
        ZipOutputStream zip_os = new ZipOutputStream(os);
        //获取图片 get_List
        List<String> get_list = GetWeb.getImagePathList(web_url);
        //去重 list
        List<String> list = new ArrayList();
        for(int i=0;i<get_list.size();i++){
            if(!list.contains(get_list.get(i))){
                list.add(get_list.get(i));
            }
        }
        //图片信息缓存
        String img_split[] = null;
        String imgName = "";
        for (int i=0;i<list.size();i++){
            img_split = list.get(i).split("/");
            imgName = img_split[img_split.length-1];
            System.out.println("下载图片-"+i+" : "+imgName);
            //生成输入流
            URL url = new URL(list.get(i));
            zip_os.putNextEntry(new ZipEntry(imgName));
            InputStream fis = url.openConnection().getInputStream();
            //读取图片
            int r = 0;
            byte[] buffer = new byte[1024];
            while ((r = fis.read(buffer)) != -1) {
                zip_os.write(buffer, 0, r);
            }
            fis.close();
        }
        //关闭连接
        zip_os.flush();
        zip_os.close();
    }

}
