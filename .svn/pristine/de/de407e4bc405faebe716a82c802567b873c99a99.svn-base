package com.hniois.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

/** 
 * 说明：反射工具
 */
public class ReflectHelper {
	/**
	 * 获取obj对象fieldName的Field
	 * @param obj
	 * @param fieldName
	 * @return
	 */
	public static Field getFieldByFieldName(Object obj, String fieldName) {
		for (Class<?> superClass = obj.getClass(); superClass != Object.class; superClass = superClass
				.getSuperclass()) {
			try {
				return superClass.getDeclaredField(fieldName);
			} catch (NoSuchFieldException e) {
			}
		}
		return null;
	}

	/**
	 * 获取obj对象fieldName的属性值
	 * @param obj
	 * @param fieldName
	 * @return
	 * @throws SecurityException
	 * @throws NoSuchFieldException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static Object getValueByFieldName(Object obj, String fieldName)
			throws SecurityException, NoSuchFieldException,
			IllegalArgumentException, IllegalAccessException {
		Field field = getFieldByFieldName(obj, fieldName);
		Object value = null;
		if(field!=null){
			if (field.isAccessible()) {
				value = field.get(obj);
			} else {
				field.setAccessible(true);
				value = field.get(obj);
				field.setAccessible(false);
			}
		}
		return value;
	}

	/**
	 * 设置obj对象fieldName的属性值
	 * @param obj
	 * @param fieldName
	 * @param value
	 * @throws SecurityException
	 * @throws NoSuchFieldException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static void setValueByFieldName(Object obj, String fieldName,
			Object value) throws SecurityException, NoSuchFieldException,
			IllegalArgumentException, IllegalAccessException {
		Field field = obj.getClass().getDeclaredField(fieldName);
		if (field.isAccessible()) {
			field.set(obj, value);
		} else {
			field.setAccessible(true);
			field.set(obj, value);
			field.setAccessible(false);
		}
	}

	/**
	 * map转化为bean
	 * @param map
	 * @param object
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 */
	public static Object mapToBean(Map<String,Object> map, Class<?> object) throws InstantiationException, IllegalAccessException {
		Object instance = object.newInstance();
		for(Map.Entry<String, Object> eachMap:map.entrySet()) {
			String property = eachMap.getKey();
			Object value = eachMap.getValue();

			String setMethod = "set"+property.substring(0,1).toUpperCase()+property.substring(1);
			Field field = getField(property,object);
			Class<?> fType = field.getType();
			value = convert(value,fType);

			System.out.println(value);
			try {
				object.getMethod(setMethod, fType).invoke(instance, value);
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		}

		return instance;
	}

	private static Object convert(Object value, Class<?> fType) {
		Object retVal = null;
		if (Long.class.getName().equals(fType.getName()) || long.class.getName().equals(fType.getName())) {
			retVal =  Long.parseLong(value.toString());

		}
		else if (Float.class.getName().equals(fType.getName()) || float.class.getName().equals(fType.getName())) {
			retVal =  Float.parseFloat(value.toString());

		}
		else if (Double.class.getName().equals(fType.getName()) || double.class.getName().equals(fType.getName())) {
			retVal =  Double.parseDouble(value.toString());

		}
		else if (Integer.class.getName().equals(fType.getName()) || int.class.getName().equals(fType.getName())) {
			retVal = Integer.parseInt(value.toString());

		}
		else {

			retVal = value;
		}
		return retVal;
	}
	public static Field getField(String property,Class<?> obj)
	{
		if (Object.class.getName().equals(obj.getName()))
		{
			return null;
		}
		Field[] field = obj.getDeclaredFields();
		for (Field fe:field) {

			if (fe.getName().equals(property))
			{

				return fe;
			}
		}
		Class<?> parent = obj.getSuperclass();
		if (parent != null)
		{

			return getField(property,parent);
		}
		return null;

	}
	//Bean到Map的转化
	public static Map beanToMap(Object object) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		Field[] field = object.getClass().getDeclaredFields();
		Map map = new HashMap();
		for (Field fi :field )
		{
			String property = fi.getName();
			String getMe  = "get"+property.substring(0, 1).toUpperCase()+property.substring(1);
			Object obj = object.getClass().getMethod(getMe).invoke(object);
			map.put(property,obj);

		}
		return map;

	}

}
