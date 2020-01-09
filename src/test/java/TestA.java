import com.hniois.util.GetWeb;
import com.hniois.util.UuidUtil;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
@Controller
@RequestMapping("/file")
public class TestA {

    //图片上传方法
    @RequestMapping("/upload")
    @ResponseBody
    public String fileUpload(HttpServletRequest request,HttpServletResponse response)throws Exception{

        //创建一个返回信息对象
        JSONObject obj=new JSONObject();
        obj.put("state","ok");
        obj.put("msg","上传成功");
        //获取文件保存绝对路径
        String urlPath=request.getSession().getServletContext().getRealPath("/")+"Images/";
        //获取文件保存路径,文件保存的url,获取的是webroot下的根路径
        String savePath=request.getContextPath()+"Images/";
        //检查上传的文件是否为空
        if(!ServletFileUpload.isMultipartContent(request)){
            obj.put("msg","请选择文件");
            return obj.toString();
        }

        //创建以实际为名字的文件夹
        String ymd= new SimpleDateFormat("yyyyMMdd").format(new Date());
         urlPath+=ymd+"/";
         savePath+=ymd+"/";
        //判断文件夹是否存在,如果不存在则新建
        File uploadDir=new File(urlPath);
        if(!uploadDir.exists()){
            uploadDir.mkdirs();
        }
        //检查创建的文件夹权限
        if(!uploadDir.canWrite()){
            obj.put("msg","文件没有写权限");
        }

        //开始执行上传文件的操作
        //1.创建文件工程
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //2.创建appache核心文件解析器
        ServletFileUpload upload=new ServletFileUpload(factory);
        //3.设置解析器字符集
        upload.setHeaderEncoding("utf-8");
        //4.获取文件集合
        List<FileItem> list = upload.parseRequest(request);
        String[] names=new String[list.size()];
        String[] urls=new String[list.size()];
        for (FileItem fileItem:list) {
            int i=0;i++;
            //设置最大文件值
            long maxSize=1024*1024*2;
            if(fileItem.getSize()>maxSize){
                obj.put("msg","文件太大");
                return obj.toString();
            }
            String filename=fileItem.getName();
            String url_Path=savePath+filename;
            File file=new File(url_Path);
            FileOutputStream out=new FileOutputStream(file);
            InputStream in = fileItem.getInputStream();//读取文件字节流
            //将字节流写入输出位置
            IOUtils.copy(in,out);
            //文件上传完毕,关闭流
            in.close();
            out.close();
            fileItem.delete();
            names[i]=filename;
            urls[i]=url_Path;
        }
        obj.put("url",urls);
        obj.put("fileNames",names);
        return obj.toString();
    }

}
