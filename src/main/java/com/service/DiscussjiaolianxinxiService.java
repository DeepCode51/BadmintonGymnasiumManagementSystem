package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.DiscussjiaolianxinxiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.DiscussjiaolianxinxiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.DiscussjiaolianxinxiView;


/**
 * 教练信息评论表
 *
 * @author 
 * @email 
 * @date 2023-02-12 09:43:32
 */
public interface DiscussjiaolianxinxiService extends IService<DiscussjiaolianxinxiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<DiscussjiaolianxinxiVO> selectListVO(Wrapper<DiscussjiaolianxinxiEntity> wrapper);
   	
   	DiscussjiaolianxinxiVO selectVO(@Param("ew") Wrapper<DiscussjiaolianxinxiEntity> wrapper);
   	
   	List<DiscussjiaolianxinxiView> selectListView(Wrapper<DiscussjiaolianxinxiEntity> wrapper);
   	
   	DiscussjiaolianxinxiView selectView(@Param("ew") Wrapper<DiscussjiaolianxinxiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DiscussjiaolianxinxiEntity> wrapper);
   	

}

