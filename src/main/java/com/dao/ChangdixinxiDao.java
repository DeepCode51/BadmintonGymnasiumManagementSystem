package com.dao;

import com.entity.ChangdixinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.ChangdixinxiVO;
import com.entity.view.ChangdixinxiView;


/**
 * 场地信息
 * 
 * @author 
 * @email 
 * @date 2023-02-12 09:43:31
 */
public interface ChangdixinxiDao extends BaseMapper<ChangdixinxiEntity> {
	
	List<ChangdixinxiVO> selectListVO(@Param("ew") Wrapper<ChangdixinxiEntity> wrapper);
	
	ChangdixinxiVO selectVO(@Param("ew") Wrapper<ChangdixinxiEntity> wrapper);
	
	List<ChangdixinxiView> selectListView(@Param("ew") Wrapper<ChangdixinxiEntity> wrapper);

	List<ChangdixinxiView> selectListView(Pagination page,@Param("ew") Wrapper<ChangdixinxiEntity> wrapper);
	
	ChangdixinxiView selectView(@Param("ew") Wrapper<ChangdixinxiEntity> wrapper);
	

    List<Map<String, Object>> selectValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<ChangdixinxiEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<ChangdixinxiEntity> wrapper);
    
    List<Map<String, Object>> selectGroup(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<ChangdixinxiEntity> wrapper);



}
