package com.server.impl;

import com.dao.SyssbMapper;
import com.entity.Syssb;
import com.server.SyssbServer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class SyssbServerImpl implements SyssbServer {
    @Resource
    private SyssbMapper dao;
    @Override
    public int add(Syssb po) {
        return dao.add( po );
    }

    @Override
    public int update(Syssb po) {
        return dao.update( po );
    }

    @Override
    public int delete(int id) {
        return dao.delete( id );
    }

    @Override
    public List<Syssb> getAll(Map<String, Object> map) {
        return dao.getAll( map );
    }

    @Override
    public List<Syssb> getByPage(Map<String, Object> map) {
        return dao.getByPage( map );
    }
}
