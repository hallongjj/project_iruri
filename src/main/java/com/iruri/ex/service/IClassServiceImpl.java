package com.iruri.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iruri.ex.mapper.IClassMapper;
import com.iruri.ex.vo.IClassVO;
import com.iruri.ex.vo.IUserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class IClassServiceImpl implements IClassService {
    
    @Autowired
    private IClassMapper iClassMapper;
    // 모든
    @Override
    public List<IClassVO> classList(int userId) {
        List<IClassVO> vo = iClassMapper.selectAll(userId);
        if(vo == null) {
            return null;
        }
        return vo;
    }
    

    // 현재 운영중인 클래스 조회
    @Override
    public List<IClassVO> classCurrentList(int userId) {
        List<IClassVO> vo = iClassMapper.selectAllCurrent(userId);
        if(vo == null) {
            return null;
        }
        return vo;
    }
    
    
    // 현재 종료된 클래스 조회
    @Override
    public List<IClassVO> classEndList(int userId) {
        List<IClassVO> vo = iClassMapper.selectAllEnd(userId);
        if(vo == null) {
            return null;
        }

    @Override
    public int classcount(int userId) {

        int vo = iClassMapper.classcount(userId);

        return vo;
    }

    @Override
    public void insertChallenge(IClassVO iClassVO) {
        log.info("insertChallenge");
        
        iClassMapper.insertChallenge(iClassVO);
        
    }



}
