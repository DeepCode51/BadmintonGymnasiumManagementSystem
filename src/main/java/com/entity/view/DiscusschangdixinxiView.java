package com.entity.view;

import com.entity.DiscusschangdixinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 场地信息评论表
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2023-02-12 09:43:31
 */
@TableName("discusschangdixinxi")
public class DiscusschangdixinxiView  extends DiscusschangdixinxiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public DiscusschangdixinxiView(){
	}
 
 	public DiscusschangdixinxiView(DiscusschangdixinxiEntity discusschangdixinxiEntity){
 	try {
			BeanUtils.copyProperties(this, discusschangdixinxiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
