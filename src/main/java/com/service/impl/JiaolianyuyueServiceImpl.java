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


import com.dao.JiaolianyuyueDao;
import com.entity.JiaolianyuyueEntity;
import com.service.JiaolianyuyueService;
import com.entity.vo.JiaolianyuyueVO;
import com.entity.view.JiaolianyuyueView;

@Service("jiaolianyuyueService")
public class JiaolianyuyueServiceImpl extends ServiceImpl<JiaolianyuyueDao, JiaolianyuyueEntity> implements JiaolianyuyueService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<JiaolianyuyueEntity> page = this.selectPage(
                new Query<JiaolianyuyueEntity>(params).getPage(),
                new EntityWrapper<JiaolianyuyueEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<JiaolianyuyueEntity> wrapper) {
		  Page<JiaolianyuyueView> page =new Query<JiaolianyuyueView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<JiaolianyuyueVO> selectListVO(Wrapper<JiaolianyuyueEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public JiaolianyuyueVO selectVO(Wrapper<JiaolianyuyueEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<JiaolianyuyueView> selectListView(Wrapper<JiaolianyuyueEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public JiaolianyuyueView selectView(Wrapper<JiaolianyuyueEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, Wrapper<JiaolianyuyueEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, Wrapper<JiaolianyuyueEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }
    
    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, Wrapper<JiaolianyuyueEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }




}
