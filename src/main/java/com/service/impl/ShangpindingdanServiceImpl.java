package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.ShangpindingdanDao;
import com.entity.ShangpindingdanEntity;
import com.service.ShangpindingdanService;
import com.entity.vo.ShangpindingdanVO;
import com.entity.view.ShangpindingdanView;

@Service("shangpindingdanService")
public class ShangpindingdanServiceImpl extends ServiceImpl<ShangpindingdanDao, ShangpindingdanEntity> implements ShangpindingdanService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ShangpindingdanEntity> page = this.selectPage(
                new Query<ShangpindingdanEntity>(params).getPage(),
                new EntityWrapper<ShangpindingdanEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<ShangpindingdanEntity> wrapper) {
		  Page<ShangpindingdanView> page =new Query<ShangpindingdanView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<ShangpindingdanVO> selectListVO(Wrapper<ShangpindingdanEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ShangpindingdanVO selectVO(Wrapper<ShangpindingdanEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<ShangpindingdanView> selectListView(Wrapper<ShangpindingdanEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public ShangpindingdanView selectView(Wrapper<ShangpindingdanEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
