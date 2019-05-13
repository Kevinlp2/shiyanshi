package com.controller;

import com.dao.SbbfMapper;
import com.dao.SbbxMapper;
import com.entity.*;
import com.server.ShiYanServer;
import com.server.SyssbServer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class SyssbController {
    @Resource
    private SyssbServer syssbServer;
    @Resource
    private ShiYanServer shiYanServer;

    @Resource
    private SbbxMapper sbbxMapper;

    @Resource
    private SbbfMapper sbbfMapper;

    @RequestMapping("admin/doFindSyssb.do")
    public String doFindSyssb(ModelMap map, int id){
        HashMap<String, Object> objectHashMap = new HashMap<>();
        objectHashMap.put( "sid",id );

        List<Syssb> syssbList = syssbServer.getAll( objectHashMap );

        ArrayList<ShiYan> shiYans = new ArrayList<>();
        if(syssbList.size()>0){
            for (Syssb s:syssbList) {
                ShiYan shiYan = shiYanServer.getById( s.getSbid() );
                shiYans.add( shiYan );
            }
        }
        System.out.println(syssbList);

        map.put( "shebeis",shiYans );
        map.put( "syssbs",syssbList );
        map.put( "sysid",id );
        return "admin/list_Syssb";
    }

    //实验室设备申请维修跳转
    @RequestMapping("admin/SheBeiwx.do")
    public String sbbxsq(ModelMap map, int sysid,int sbid){
        HashMap<String, Object> objectHashMap = new HashMap<>();
        objectHashMap.put( "sid",sysid );
        objectHashMap.put( "sbid",sbid );
        List<Syssb> syssbList = syssbServer.getAll( objectHashMap );

        ShiYan sb=null;
        ShiYan sys=null;
        int number=0;
        if(syssbList.size()>0){
            for (Syssb s:syssbList) {
                sb = shiYanServer.getById( s.getSbid() );
                sys = shiYanServer.getById( s.getSid() );
                number=s.getSnum();
            }
        }
        map.put( "sys",sys );
        map.put( "sb",sb );
        map.put( "number",number );

        return "admin/add_sbbx";
    }

    //实验室设备申请报废跳转
    @RequestMapping("admin/SheBeibf.do")
    public String sbbfsq(ModelMap map, int sysid,int sbid){
        HashMap<String, Object> objectHashMap = new HashMap<>();
        objectHashMap.put( "sid",sysid );
        objectHashMap.put( "sbid",sbid );
        List<Syssb> syssbList = syssbServer.getAll( objectHashMap );

        ShiYan sb=null;
        ShiYan sys=null;
        int number=0;
        if(syssbList.size()>0){
            for (Syssb s:syssbList) {
                sb = shiYanServer.getById( s.getSbid() );
                sys = shiYanServer.getById( s.getSid() );
                number=s.getSnum();
            }
        }
        map.put( "sys",sys );
        map.put( "sb",sb );
        map.put( "number",number );

        return "admin/add_sbbf";
    }

    //	添加设备报修
    @RequestMapping("admin/addSbbx.do")
    public String addSbbx(HttpServletRequest request, Sbbx sbbx, HttpSession session){
        //获取当前登陆用户
        Sysuser u=(Sysuser)session.getAttribute("auser");
        //获取的前时间
        Timestamp time=new Timestamp(System.currentTimeMillis());
        if(u==null){
            return "admin/login";
        }else{
            HashMap<String, Object> objectHashMap = new HashMap<>();
            objectHashMap.put( "sid",sbbx.getSysid() );
            objectHashMap.put( "sbid",sbbx.getSbid() );
            List<Syssb> syssbList = syssbServer.getAll( objectHashMap );
            if(syssbList.get( 0 ).getSnum()<sbbx.getBxnum() ){
                return "admin/error";
            }else {
                sbbx.setUid( u.getUid() );
                sbbx.setBxtime(  time.toString().substring(0, 19) );
                sbbx.setBstatus( "待处理" );
                sbbxMapper.insertSelective( sbbx );

                Syssb syssb = syssbList.get( 0 );
                syssb.setSnum( syssb.getSnum()-sbbx.getBxnum() );
                syssbServer.update( syssb );
                return "success";
            }

        }

    }

    //	添加设备报废
    @RequestMapping("admin/addSbbf.do")
    public String addSbbf(HttpServletRequest request, Sbbf sbbf, HttpSession session){
        //获取当前登陆用户
        Sysuser u=(Sysuser)session.getAttribute("auser");
        //获取的前时间
        Timestamp time=new Timestamp(System.currentTimeMillis());
        if(u==null){
            return "admin/login";
        }else{
            HashMap<String, Object> objectHashMap = new HashMap<>();
            objectHashMap.put( "sid",sbbf.getSysid() );
            objectHashMap.put( "sbid",sbbf.getSbid() );
            List<Syssb> syssbList = syssbServer.getAll( objectHashMap );
            if(syssbList.get( 0 ).getSnum()<sbbf.getBfsnum() ){
                return "admin/error";
            }else {
                sbbf.setUid( u.getUid() );
                sbbf.setBftime(  time.toString().substring(0, 19) );
                sbbf.setStatus( "待处理" );
                sbbfMapper.insertSelective( sbbf );


                Syssb syssb = syssbList.get( 0 );
                syssb.setSnum( syssb.getSnum()-sbbf.getBfsnum() );
                syssbServer.update( syssb );
                return "success";
            }

        }

    }
}
