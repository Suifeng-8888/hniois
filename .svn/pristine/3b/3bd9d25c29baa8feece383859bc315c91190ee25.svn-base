package com.hniois.util;

import jxl.Workbook;
import jxl.write.*;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.*;

/**
 * @author YK 生成Execl
 */
public class ExeclUtil {

	/**
	 * 将List<Map>格式的数据集转换为execl
	 * @param title execl sheet的名字
	 * @param file 生成execl后存放的路径
	 * @param list 
	 * 作者：杨凯
	 */
	public static void list2Execl(String title, File file, List<Map> list) {
		try {
			WritableWorkbook book = Workbook.createWorkbook(file);
			WritableSheet sheet = book.createSheet(title, 0);
			
			if (list == null || list.size() == 0) {
				throw new RuntimeException("传入的list为null或空");
			}
			Map keyMap = list.get(0);
			
			Iterator iterator = keyMap.keySet().iterator();
			String[] keys = new String[keyMap.keySet().size()];
			int i=0;
			while (iterator.hasNext()) {
				String key = ConvertUtil.obj2Str(iterator.next());
				Label cell = new Label(i,0,key);
				sheet.addCell(cell);
				keys[i] = key;
				i++;
			}
			int rowIndex = 1;
			int columnIndex = 0;
			for (Map map : list) {
				for (String key : keys) {
					Label cell = new Label(columnIndex,rowIndex,ConvertUtil.obj2Str(map.get(key)));
					sheet.addCell(cell);
					columnIndex ++ ;
				}
				columnIndex = 0;
				rowIndex ++ ;
			}
			book.write();
			book.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	/**
	 * 将List<Map>格式的数据集转换为execl
	 * @param title execl sheet的名字
	 * @param list 
	 * 作者：jxl
	 */
	public static ByteArrayOutputStream list2Execl(String title, List<Map> list) {
		try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			
			WritableWorkbook book = Workbook.createWorkbook(baos);
			WritableSheet sheet = book.createSheet(title, 0);
			
			if (list == null || list.size() == 0) {
				throw new RuntimeException("传入的list为null或空");
			}
			Map keyMap = list.get(0);
			
			
			WritableFont wfont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD, false, jxl.format.UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK); 
			WritableCellFormat titleFormat = new WritableCellFormat(wfont); 
			
			Iterator iterator = keyMap.keySet().iterator();
			String[] keys = new String[keyMap.keySet().size()];
			int i=0;
			while (iterator.hasNext()) {
				String key = ConvertUtil.obj2Str(iterator.next());
				Label cell = new Label(i,0,key,titleFormat);
				sheet.addCell(cell);
				keys[i] = key;
				i++;
			}
			int rowIndex = 1;
			int columnIndex = 0;
			
			
			
			
			for (Map map : list) {
				for (String key : keys) {
					Label cell = new Label(columnIndex,rowIndex,ConvertUtil.obj2Str(map.get(key)));
					sheet.addCell(cell);
					columnIndex ++ ;
				}
				columnIndex = 0;
				rowIndex ++ ;
			}
			book.write();
			book.close();
			return baos;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static void main(String[] args) {
		List<Map> list = new ArrayList<Map>();
		
		Map map1 = new HashMap();
		map1.put("name", "江小磊");
		map1.put("age", "20");
		
		Map map2 = new HashMap();
		map2.put("name", "江小磊1");
		map2.put("age", "21");
		
		list.add(map1);
		list.add(map2);
		
		list2Execl("test",new File("D:/Chenghao/bb.xls"),list);
	}
}

