package com.controller;

import com.entity.ShiYan;
import com.entity.Syssb;
import com.server.ShiYanServer;
import com.server.SyssbServer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class SyssbController {
    @Resource
    private SyssbServer syssbServer;
    @Resource
    private ShiYanServer shiYanServer;

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

        return "admin/list_Syssb";
    }
}
