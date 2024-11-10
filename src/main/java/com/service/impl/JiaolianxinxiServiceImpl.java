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


import com.dao.JiaolianxinxiDao;
import com.entity.JiaolianxinxiEntity;
import com.service.JiaolianxinxiService;
import com.entity.vo.JiaolianxinxiVO;
import com.entity.view.JiaolianxinxiView;

@Service("jiaolianxinxiService")
public class JiaolianxinxiServiceImpl extends ServiceImpl<JiaolianxinxiDao, JiaolianxinxiEntity> implements JiaolianxinxiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<JiaolianxinxiEntity> page = this.selectPage(
                new Query<JiaolianxinxiEntity>(params).getPage(),
                new EntityWrapper<JiaolianxinxiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<JiaolianxinxiEntity> wrapper) {
		  Page<JiaolianxinxiView> page =new Query<JiaolianxinxiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<JiaolianxinxiVO> selectListVO(Wrapper<JiaolianxinxiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public JiaolianxinxiVO selectVO(Wrapper<JiaolianxinxiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<JiaolianxinxiView> selectListView(Wrapper<JiaolianxinxiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public JiaolianxinxiView selectView(Wrapper<JiaolianxinxiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
