package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.JiaolianyuyueEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.JiaolianyuyueVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.JiaolianyuyueView;


/**
 * 教练预约
 *
 * @author 
 * @email 
 * @date 2023-02-12 09:43:31
 */
public interface JiaolianyuyueService extends IService<JiaolianyuyueEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<JiaolianyuyueVO> selectListVO(Wrapper<JiaolianyuyueEntity> wrapper);
   	
   	JiaolianyuyueVO selectVO(@Param("ew") Wrapper<JiaolianyuyueEntity> wrapper);
   	
   	List<JiaolianyuyueView> selectListView(Wrapper<JiaolianyuyueEntity> wrapper);
   	
   	JiaolianyuyueView selectView(@Param("ew") Wrapper<JiaolianyuyueEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<JiaolianyuyueEntity> wrapper);
   	

    List<Map<String, Object>> selectValue(Map<String, Object> params,Wrapper<JiaolianyuyueEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params,Wrapper<JiaolianyuyueEntity> wrapper);
    
    List<Map<String, Object>> selectGroup(Map<String, Object> params,Wrapper<JiaolianyuyueEntity> wrapper);



}

