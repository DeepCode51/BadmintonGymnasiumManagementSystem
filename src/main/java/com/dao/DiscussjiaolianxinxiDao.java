package com.dao;

import com.entity.DiscussjiaolianxinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.DiscussjiaolianxinxiVO;
import com.entity.view.DiscussjiaolianxinxiView;


/**
 * 教练信息评论表
 * 
 * @author 
 * @email 
 * @date 2023-02-12 09:43:32
 */
public interface DiscussjiaolianxinxiDao extends BaseMapper<DiscussjiaolianxinxiEntity> {
	
	List<DiscussjiaolianxinxiVO> selectListVO(@Param("ew") Wrapper<DiscussjiaolianxinxiEntity> wrapper);
	
	DiscussjiaolianxinxiVO selectVO(@Param("ew") Wrapper<DiscussjiaolianxinxiEntity> wrapper);
	
	List<DiscussjiaolianxinxiView> selectListView(@Param("ew") Wrapper<DiscussjiaolianxinxiEntity> wrapper);

	List<DiscussjiaolianxinxiView> selectListView(Pagination page,@Param("ew") Wrapper<DiscussjiaolianxinxiEntity> wrapper);
	
	DiscussjiaolianxinxiView selectView(@Param("ew") Wrapper<DiscussjiaolianxinxiEntity> wrapper);
	

}
