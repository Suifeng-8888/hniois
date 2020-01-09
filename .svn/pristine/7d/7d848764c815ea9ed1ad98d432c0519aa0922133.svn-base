package com.hniois.util;

import org.apache.commons.lang.StringUtils;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 爬取网页
 */
public class GetWeb {

    /**
     * 获取当前网页的code
     *
     * @param httpUrl
     *            网页地址
     * @return
     * @throws IOException
     */
    public static String getHtmlCode(String httpUrl) throws IOException {
        String content = ""; 		// 定义字符串content
        URL url = new URL(httpUrl); // 生成传入的URL的对象
        BufferedReader reader = new BufferedReader(new InputStreamReader(
                url.openStream(), "utf-8"));// 获得当前url的字节流（缓冲）
        String input;
        while ((input = reader.readLine()) != null) { // 当前行存在数据时
            content += input; 		// 将读取数据赋给content
        }
        reader.close(); 			// 关闭缓冲区
        return content;
    }


    /**
     * 检测网络资源是否存在　
     *
     * @param strUrl
     * @return
     */
    public static boolean isNetFileAvailable(String strUrl) {
        InputStream netFileInputStream = null;
        try {
            URL url = new URL(strUrl);
            URLConnection urlConn = url.openConnection();
            netFileInputStream = urlConn.getInputStream();
            if (null != netFileInputStream) {
                return true;
            } else {
                return false;
            }
        } catch (IOException e) {
            return false;
        } finally {
            try {
                if (netFileInputStream != null)
                    netFileInputStream.close();
            } catch (IOException e) {

            }
        }
    }


	/**
	 * 把网页中的所有图片的完整路径放到list里面
	 * 
	 * @param httpUrl
	 *            要爬的网页连接
	 * @throws IOException
	 */
	public static List<String> getImagePathList(String httpUrl)
			throws IOException {

		// 1.通过扩展名匹配网页图片的正则表达式
		// String searchImgReg =
		// "(?x)(src|SRC|background|BACKGROUND)=('|\")/?(([\\w-]+/)*([\\w-]+\\.(jpg|JPG|png|PNG|gif|GIF)))('|\")";
		// String searchImgReg2 =
		// "(?x)(src|SRC|background|BACKGROUND)=('|\")(http://([\\w-]+\\.)+[\\w-]+(:[0-9]+)*(/[\\w-]+)*(/[\\w-]+\\.(jpg|JPG|png|PNG|gif|GIF)))('|\")";
		// 2.通过img标签匹配网页图片的正则表达式
		String searchImgReg = "<(img|IMG)\\b[^>]*\\b(src|SRC|src2|SRC2)\\b\\s*=\\s*('|\")?([^'\"\n\r\f>]+(\\.jpg|\\.bmp|\\.eps|\\.gif|\\.mif|\\.miff|\\.png|\\.tif|\\.tiff|\\.svg|\\.wmf|\\.jpe|\\.jpeg|\\.dib|\\.ico|\\.tga|\\.cut|\\.pic)\\b)[^>]*>";
		List<String> imgList = new ArrayList<String>(); 	// 存放图片的list
		String content = null;
		content = getHtmlCode(httpUrl);						// 获得content
		Pattern pattern = Pattern.compile(searchImgReg); 	// 讲编译的正则表达式对象赋给pattern
		Matcher matcher = pattern.matcher(content); 		// 对字符串content执行正则表达式
		while (matcher.find()) {
			String quote = matcher.group(3);
			String imgsrc = (quote == null || quote.trim().length() == 0) ? matcher.group(4).split("\\s+")[0] : matcher.group(4);
			if (!imgsrc.startsWith("http://") && !imgsrc.startsWith("https://")) { 			// 检验地址是否http://
				String[] httpUrlarr = httpUrl.split("/");
				String wwwhost = httpUrlarr[0] + "//" + httpUrlarr[2]; //获取域名完整地址  http://www.xxx.com
				if(!isNetFileAvailable(wwwhost + "/" + imgsrc)){
					for(int i=3;i<httpUrlarr.length;i++){
						wwwhost = wwwhost + "/" + httpUrlarr[i];
						if(isNetFileAvailable(wwwhost + "/" + imgsrc)){
							imgsrc = wwwhost + "/" + imgsrc;
							break;
						}
					}
				}else{
					imgsrc = wwwhost + "/" + imgsrc;
				}
			}
			imgList.add(imgsrc);
		}
		return imgList;
	}


    /**
     * 下载图片 :
     *              无法加载css中的图片
     * @param savePath 保存路径  d:\image\
     * @param web_url  网页路径  http://www.shfda.org/
     */
    public static void downloads(String savePath,String web_url) throws Exception{
        if (StringUtils.isEmpty(savePath)){
            System.out.println("请输入保存路径");
            return ;
        }
        //解压文件名称
        String zipName = "get_Imgs.zip";
        //删除旧文件
        FileUtil.deleteFile(savePath + zipName);
        // 输出的文件流
        File sf=new File(savePath);
        if(!sf.exists()){
            sf.mkdirs();
        }
        OutputStream os = new FileOutputStream(sf.getPath() + "\\" + zipName);
        //解压zip OS
        ZipOutputStream zip_os = new ZipOutputStream(os);
        //获取图片 get_List
        List<String> get_list = getImagePathList(web_url);
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

