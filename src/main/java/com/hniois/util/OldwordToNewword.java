package com.hniois.util;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.usermodel.*;
import org.openxmlformats.schemas.drawingml.x2006.wordprocessingDrawing.CTInline;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class OldwordToNewword {
  
    /** 
     * 根据指定的参数值、模板，生成 word 文档 
     * @param param 需要替换的变量 
     * @param template 模板 
     */  
    public static XWPFDocument generateWord(Map<String, Object> param, String template) {
        XWPFDocument doc = null;  
        try {  
            OPCPackage pack = POIXMLDocument.openPackage(template);
            doc = new XWPFDocument(pack);
            if (param != null && param.size() > 0) {  
                  
                //处理段落  
                List<XWPFParagraph> paragraphList = doc.getParagraphs();
                processParagraphs(paragraphList, param, doc);  
                  
                //处理表格  
                Iterator<XWPFTable> it = doc.getTablesIterator();
                while (it.hasNext()) {  
                    XWPFTable table = it.next();  
                    List<XWPFTableRow> rows = table.getRows();
                    for (XWPFTableRow row : rows) {  
                        List<XWPFTableCell> cells = row.getTableCells();
                        for (XWPFTableCell cell : cells) {  
                            List<XWPFParagraph> paragraphListTable =  cell.getParagraphs();  
                            processParagraphs(paragraphListTable, param, doc);  
                        }  
                    }  
                }  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return doc;  
    }  
    /** 
     * 处理段落 
     * @param paragraphList 
     * @throws FileNotFoundException
     * @throws InvalidFormatException
     */  
    public static void processParagraphs(List<XWPFParagraph> paragraphList,Map<String, Object> param,XWPFDocument doc) throws InvalidFormatException, FileNotFoundException{
        if(paragraphList != null && paragraphList.size() > 0){  
            for(XWPFParagraph paragraph:paragraphList){  
                List<XWPFRun> runs = paragraph.getRuns();  
                for (XWPFRun run : runs) {  
                    String text = run.getText(0);  
                    System.out.println("text=="+text);  
                    if(text != null){  
                        boolean isSetText = false;  
                        for (Map.Entry<String, Object> entry : param.entrySet()) {
                            String key = entry.getKey();  
                            if(text.indexOf(key) != -1){  
                                isSetText = true;  
                                Object value = entry.getValue();  
                                if (value instanceof String) {//文本替换  
                                    System.out.println("key=="+key);  
                                    text = text.replace(key, value.toString());  
                                }
                            }  
                        }  
                        if(isSetText){  
                            run.setText(text,0);  
                        }  
                    }  
                }  
            }  
        }  
    }  

    /** 
     * 将输入流中的数据写入字节数组 
     * @param in 
     * @return 
     */  
    public static byte[] inputStream2ByteArray(InputStream in, boolean isClose){
        byte[] byteArray = null;  
        try {  
            int total = in.available();  
            byteArray = new byte[total];  
            in.read(byteArray);  
        } catch (IOException e) {
            e.printStackTrace();  
        }finally{  
            if(isClose){  
                try {  
                    in.close();  
                } catch (Exception e2) {  
                    System.out.println("关闭流失败");  
                }  
            }  
        }  
        return byteArray;  
    }  
      

      
}  