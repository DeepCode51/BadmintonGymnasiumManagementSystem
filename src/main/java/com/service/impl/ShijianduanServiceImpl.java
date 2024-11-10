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


import com.dao.ShijianduanDao;
import com.entity.ShijianduanEntity;
import com.service.ShijianduanService;
import com.entity.vo.ShijianduanVO;
import com.entity.view.ShijianduanView;

@Service("shijianduanService")
public class ShijianduanServiceImpl extends ServiceImpl<ShijianduanDao, ShijianduanEntity> implements ShijianduanService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ShijianduanEntity> page = this.selectPage(
                new Query<ShijianduanEntity>(params).getPage(),
                new EntityWrapper<ShijianduanEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<ShijianduanEntity> wrapper) {
		  Page<ShijianduanView> page =new Query<ShijianduanView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<ShijianduanVO> selectListVO(Wrapper<ShijianduanEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ShijianduanVO selectVO(Wrapper<ShijianduanEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<ShijianduanView> selectListView(Wrapper<ShijianduanEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public ShijianduanView selectView(Wrapper<ShijianduanEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
