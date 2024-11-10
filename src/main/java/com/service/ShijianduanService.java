package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ShijianduanEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.ShijianduanVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.ShijianduanView;


/**
 * 时间段
 *
 * @author 
 * @email 
 * @date 2023-02-12 09:43:31
 */
public interface ShijianduanService extends IService<ShijianduanEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<ShijianduanVO> selectListVO(Wrapper<ShijianduanEntity> wrapper);
   	
   	ShijianduanVO selectVO(@Param("ew") Wrapper<ShijianduanEntity> wrapper);
   	
   	List<ShijianduanView> selectListView(Wrapper<ShijianduanEntity> wrapper);
   	
   	ShijianduanView selectView(@Param("ew") Wrapper<ShijianduanEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<ShijianduanEntity> wrapper);
   	

}

