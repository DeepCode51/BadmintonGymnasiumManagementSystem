package com.entity.view;

import com.entity.JiaolianyuyueEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 教练预约
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2023-02-12 09:43:31
 */
@TableName("jiaolianyuyue")
public class JiaolianyuyueView  extends JiaolianyuyueEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public JiaolianyuyueView(){
	}
 
 	public JiaolianyuyueView(JiaolianyuyueEntity jiaolianyuyueEntity){
 	try {
			BeanUtils.copyProperties(this, jiaolianyuyueEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
