package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ShangpindingdanEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.ShangpindingdanVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.ShangpindingdanView;


/**
 * 商品订单
 *
 * @author 
 * @email 
 * @date 2023-02-12 09:43:31
 */
public interface ShangpindingdanService extends IService<ShangpindingdanEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<ShangpindingdanVO> selectListVO(Wrapper<ShangpindingdanEntity> wrapper);
   	
   	ShangpindingdanVO selectVO(@Param("ew") Wrapper<ShangpindingdanEntity> wrapper);
   	
   	List<ShangpindingdanView> selectListView(Wrapper<ShangpindingdanEntity> wrapper);
   	
   	ShangpindingdanView selectView(@Param("ew") Wrapper<ShangpindingdanEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<ShangpindingdanEntity> wrapper);
   	

}

