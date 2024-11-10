package com.entity.view;

import com.entity.JiaolianxinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 教练信息
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2023-02-12 09:43:31
 */
@TableName("jiaolianxinxi")
public class JiaolianxinxiView  extends JiaolianxinxiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public JiaolianxinxiView(){
	}
 
 	public JiaolianxinxiView(JiaolianxinxiEntity jiaolianxinxiEntity){
 	try {
			BeanUtils.copyProperties(this, jiaolianxinxiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
