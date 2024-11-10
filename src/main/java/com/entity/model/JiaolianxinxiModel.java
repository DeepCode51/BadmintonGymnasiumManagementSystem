package com.entity.model;

import com.entity.JiaolianxinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;
 

/**
 * 教练信息
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 * @date 2023-02-12 09:43:31
 */
public class JiaolianxinxiModel  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 年龄
	 */
	
	private Integer nianling;
		
	/**
	 * 教练性别
	 */
	
	private String jiaolianxingbie;
		
	/**
	 * 联系电话
	 */
	
	private String lianxidianhua;
		
	/**
	 * 教龄
	 */
	
	private Integer jiaoling;
		
	/**
	 * 教练头像
	 */
	
	private String jiaoliantouxiang;
		
	/**
	 * 可约时间
	 */
	
	private String shijianduan;
		
	/**
	 * 可约名额
	 */
	
	private Integer minge;
		
	/**
	 * 工作经历
	 */
	
	private String gongzuojingli;
		
	/**
	 * 个人特长
	 */
	
	private String gerentezhang;
				
	
	/**
	 * 设置：年龄
	 */
	 
	public void setNianling(Integer nianling) {
		this.nianling = nianling;
	}
	
	/**
	 * 获取：年龄
	 */
	public Integer getNianling() {
		return nianling;
	}
				
	
	/**
	 * 设置：教练性别
	 */
	 
	public void setJiaolianxingbie(String jiaolianxingbie) {
		this.jiaolianxingbie = jiaolianxingbie;
	}
	
	/**
	 * 获取：教练性别
	 */
	public String getJiaolianxingbie() {
		return jiaolianxingbie;
	}
				
	
	/**
	 * 设置：联系电话
	 */
	 
	public void setLianxidianhua(String lianxidianhua) {
		this.lianxidianhua = lianxidianhua;
	}
	
	/**
	 * 获取：联系电话
	 */
	public String getLianxidianhua() {
		return lianxidianhua;
	}
				
	
	/**
	 * 设置：教龄
	 */
	 
	public void setJiaoling(Integer jiaoling) {
		this.jiaoling = jiaoling;
	}
	
	/**
	 * 获取：教龄
	 */
	public Integer getJiaoling() {
		return jiaoling;
	}
				
	
	/**
	 * 设置：教练头像
	 */
	 
	public void setJiaoliantouxiang(String jiaoliantouxiang) {
		this.jiaoliantouxiang = jiaoliantouxiang;
	}
	
	/**
	 * 获取：教练头像
	 */
	public String getJiaoliantouxiang() {
		return jiaoliantouxiang;
	}
				
	
	/**
	 * 设置：可约时间
	 */
	 
	public void setShijianduan(String shijianduan) {
		this.shijianduan = shijianduan;
	}
	
	/**
	 * 获取：可约时间
	 */
	public String getShijianduan() {
		return shijianduan;
	}
				
	
	/**
	 * 设置：可约名额
	 */
	 
	public void setMinge(Integer minge) {
		this.minge = minge;
	}
	
	/**
	 * 获取：可约名额
	 */
	public Integer getMinge() {
		return minge;
	}
				
	
	/**
	 * 设置：工作经历
	 */
	 
	public void setGongzuojingli(String gongzuojingli) {
		this.gongzuojingli = gongzuojingli;
	}
	
	/**
	 * 获取：工作经历
	 */
	public String getGongzuojingli() {
		return gongzuojingli;
	}
				
	
	/**
	 * 设置：个人特长
	 */
	 
	public void setGerentezhang(String gerentezhang) {
		this.gerentezhang = gerentezhang;
	}
	
	/**
	 * 获取：个人特长
	 */
	public String getGerentezhang() {
		return gerentezhang;
	}
			
}
