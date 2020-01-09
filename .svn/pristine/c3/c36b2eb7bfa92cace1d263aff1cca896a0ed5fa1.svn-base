package com.hniois.web.sys;

import com.hniois.web.Message;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** app 文件上传
 * Create By javaMan
 * 2018/12/19  16:15
 */
@RestController
@RequestMapping(value = "/webService/file")
public class FileUploadWebAction {

    /**
     *  文件上传
     * @param request
     * @param response
     * @return
     */
    // TODO: 2018/12/20 token 登录验证 
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public Message upload(HttpServletRequest request, HttpServletResponse response){
        Message message = new Message();
        response.setContentType("text/html; charset=UTF-8");
        //文件保存目录路径
        String savePath = request.getRealPath("") + "/attached/";
        //文件保存目录URL
        String saveUrl  = request.getContextPath() + "attached/";
        //检查文件判断提交上来的数据是否是上传表单的数据
        if(!ServletFileUpload.isMultipartContent(request)){
            message.setCode(1);
            message.setMsg("请选择文件");
            return message;
        }
        //检查目录
        File uploadDir = new File(savePath);
        if(!uploadDir.isDirectory()) {
            uploadDir.mkdirs();
        }
        //检查目录写权限
        if(!uploadDir.canWrite()){
            message.setCode(1);
            message.setMsg("上传目录没有写权限");
            return message;
        }

        //创建文件夹
        savePath += "file/" ;
        saveUrl += "file/" ;
        File saveDirFile = new File(savePath);
        if (!saveDirFile.exists()) {
            saveDirFile.mkdirs();
        }
        String ymd = new SimpleDateFormat("yyyyMMdd").format(new Date());
        savePath += ymd + "/";
        saveUrl += ymd + "/";
        File dirFile = new File(savePath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }
        //使用Apache文件上传组件处理文件上传步骤：
        //1、创建一个DiskFileItemFactory工厂
        FileItemFactory factory = new DiskFileItemFactory();
        //2、创建一个文件上传解析器
        ServletFileUpload upload = new ServletFileUpload(factory);
        //解决上传文件名的中文乱码
        upload.setHeaderEncoding("UTF-8");
        try {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            List<MultipartFile> items = multipartRequest.getFiles("file");
            String url[] = new String[items.size()];
            String fileNames[] = new String[items.size()];
            int i = 0;
            //List items = upload.parseRequest(request);
            for (MultipartFile item : items) {
                if(!item.isEmpty()){
                    //最大文件大小
                    long maxSize = 2097152;//1024*1024*2
                    //检查文件大小
                    if (item.getSize() > maxSize) {
                        message.setCode(1);
                        message.setMsg("上传文件大小超过限制");
                        return message;
                    }

                    //检查扩展名
                    String fileName = item.getOriginalFilename();

                    try {
                        File uploadedFile = new File(savePath, fileName);
                        item.transferTo(uploadedFile);
                    } catch (Exception e) {
                        message.setCode(1);
                        message.setMsg("上传文件失败");
                        return message;
                    }
                    fileNames[i] = fileName;
                    url[i++] = saveUrl + fileName;

                }
            }
            message.setCode(0);
            message.setMsg("上传成功");
            Map<String,Object> map = new HashMap<String,Object>();
            map.put("fileName", fileNames);//   文件名
            map.put("url", url);// 文件路径
            message.setData(map);
            return message;

        }catch (Exception e){
            e.printStackTrace();
            message.setCode(1);
            message.setMsg("上传文件失败");
            return message;
        }
    }
}
