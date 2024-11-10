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


import com.dao.DiscussjiaolianxinxiDao;
import com.entity.DiscussjiaolianxinxiEntity;
import com.service.DiscussjiaolianxinxiService;
import com.entity.vo.DiscussjiaolianxinxiVO;
import com.entity.view.DiscussjiaolianxinxiView;

@Service("discussjiaolianxinxiService")
public class DiscussjiaolianxinxiServiceImpl extends ServiceImpl<DiscussjiaolianxinxiDao, DiscussjiaolianxinxiEntity> implements DiscussjiaolianxinxiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DiscussjiaolianxinxiEntity> page = this.selectPage(
                new Query<DiscussjiaolianxinxiEntity>(params).getPage(),
                new EntityWrapper<DiscussjiaolianxinxiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DiscussjiaolianxinxiEntity> wrapper) {
		  Page<DiscussjiaolianxinxiView> page =new Query<DiscussjiaolianxinxiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<DiscussjiaolianxinxiVO> selectListVO(Wrapper<DiscussjiaolianxinxiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public DiscussjiaolianxinxiVO selectVO(Wrapper<DiscussjiaolianxinxiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<DiscussjiaolianxinxiView> selectListView(Wrapper<DiscussjiaolianxinxiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DiscussjiaolianxinxiView selectView(Wrapper<DiscussjiaolianxinxiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
