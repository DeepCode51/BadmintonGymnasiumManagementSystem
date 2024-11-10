package com.entity.model;

import com.entity.JiaolianyuyueEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;
 

/**
 * 教练预约
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 * @date 2023-02-12 09:43:31
 */
public class JiaolianyuyueModel  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 教练姓名
	 */
	
	private String jiaolianxingming;
		
	/**
	 * 年龄
	 */
	
	private String nianling;
		
	/**
	 * 教练性别
	 */
	
	private String jiaolianxingbie;
		
	/**
	 * 可约时间
	 */
	
	private String shijianduan;
		
	/**
	 * 预约名额
	 */
	
	private Integer minge;
		
	/**
	 * 申请日期
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date shenqingriqi;
		
	/**
	 * 申请备注
	 */
	
	private String shenqingbeizhu;
		
	/**
	 * 账号
	 */
	
	private String zhanghao;
		
	/**
	 * 姓名
	 */
	
	private String xingming;
		
	/**
	 * 手机号码
	 */
	
	private String shoujihaoma;
		
	/**
	 * 是否审核
	 */
	
	private String sfsh;
		
	/**
	 * 审核回复
	 */
	
	private String shhf;
				
	
	/**
	 * 设置：教练姓名
	 */
	 
	public void setJiaolianxingming(String jiaolianxingming) {
		this.jiaolianxingming = jiaolianxingming;
	}
	
	/**
	 * 获取：教练姓名
	 */
	public String getJiaolianxingming() {
		return jiaolianxingming;
	}
				
	
	/**
	 * 设置：年龄
	 */
	 
	public void setNianling(String nianling) {
		this.nianling = nianling;
	}
	
	/**
	 * 获取：年龄
	 */
	public String getNianling() {
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
	 * 设置：预约名额
	 */
	 
	public void setMinge(Integer minge) {
		this.minge = minge;
	}
	
	/**
	 * 获取：预约名额
	 */
	public Integer getMinge() {
		return minge;
	}
				
	
	/**
	 * 设置：申请日期
	 */
	 
	public void setShenqingriqi(Date shenqingriqi) {
		this.shenqingriqi = shenqingriqi;
	}
	
	/**
	 * 获取：申请日期
	 */
	public Date getShenqingriqi() {
		return shenqingriqi;
	}
				
	
	/**
	 * 设置：申请备注
	 */
	 
	public void setShenqingbeizhu(String shenqingbeizhu) {
		this.shenqingbeizhu = shenqingbeizhu;
	}
	
	/**
	 * 获取：申请备注
	 */
	public String getShenqingbeizhu() {
		return shenqingbeizhu;
	}
				
	
	/**
	 * 设置：账号
	 */
	 
	public void setZhanghao(String zhanghao) {
		this.zhanghao = zhanghao;
	}
	
	/**
	 * 获取：账号
	 */
	public String getZhanghao() {
		return zhanghao;
	}
				
	
	/**
	 * 设置：姓名
	 */
	 
	public void setXingming(String xingming) {
		this.xingming = xingming;
	}
	
	/**
	 * 获取：姓名
	 */
	public String getXingming() {
		return xingming;
	}
				
	
	/**
	 * 设置：手机号码
	 */
	 
	public void setShoujihaoma(String shoujihaoma) {
		this.shoujihaoma = shoujihaoma;
	}
	
	/**
	 * 获取：手机号码
	 */
	public String getShoujihaoma() {
		return shoujihaoma;
	}
				
	
	/**
	 * 设置：是否审核
	 */
	 
	public void setSfsh(String sfsh) {
		this.sfsh = sfsh;
	}
	
	/**
	 * 获取：是否审核
	 */
	public String getSfsh() {
		return sfsh;
	}
				
	
	/**
	 * 设置：审核回复
	 */
	 
	public void setShhf(String shhf) {
		this.shhf = shhf;
	}
	
	/**
	 * 获取：审核回复
	 */
	public String getShhf() {
		return shhf;
	}
			
}
