package com.controller;

import java.io.File;


import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.entity.Syssb;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Forder;
import com.entity.ShiYan;
import com.entity.Sysuser;
import com.server.ShiYanServer;
import com.server.SysuserServier;
import com.server.ForderServer;
import com.server.impl.ForderServerImpi;
import com.util.PageBean;

@Controller
public class ShiYanController {
	@Resource
	private ShiYanServer ShiYanService;
	@Resource
	private ForderServer orderService;
	@Resource
	private SysuserServier userService;
	
	
//	文件上传
	public String fileUpload(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,String img){
		String path=request.getSession().getServletContext().getRealPath("upload");
		String fileName=file.getOriginalFilename();
		File targetFile=new File(path,fileName);
		if(!targetFile.exists()){
			targetFile.mkdirs();
		}
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String pa=request.getContextPath()+"/upload/"+fileName;
		System.out.println("path==="+pa);
		if(fileName!=null&&!fileName.equals("")){
			img=fileName;
		}else{
			img="zanwu.jpg";	
		}
		return img;
		
	}
//	实验室管理
	@RequestMapping("admin/addShiYan.do")
	public String addShiYan(ModelMap map,ShiYan shiYan,HttpServletRequest request){
		Timestamp time=new Timestamp(System.currentTimeMillis());
		shiYan.setFtype("实验室");
		shiYan.setMstatus("空闲中");
		shiYan.setIsdel("1");
		shiYan.setPubtime(time.toString().substring(0, 19));
		ShiYanService.add(shiYan);
		return "redirect:ShiYanList.do";
	}
	@RequestMapping("admin/doUpdateShiYan.do")
	public String doUpdateShiYan(ModelMap map,int id){
		map.put("sy", ShiYanService.getById(id));
		return "admin/update_ShiYan";
	}
	@RequestMapping("admin/updateShiYan.do")
	public String updateShiYan(	HttpServletRequest request,ShiYan ShiYan){
		ShiYanService.update(ShiYan);
		return "redirect:ShiYanList.do";
	}
//	分页查询
	@RequestMapping("admin/ShiYanList.do")
	public String shiYanList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){	
		Sysuser u=(Sysuser)session.getAttribute("auser");
		session.removeAttribute("forders");
		if(u==null){
			return "admin/login";
		}else{
			if(page==null||page.equals("")){
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap=new HashMap<String,Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			Map<String, Object> cmap=new HashMap<String, Object>();
			pmap.put("name", null);
			cmap.put("name", null);
			cmap.put("ftype", "实验室");
			pmap.put("ftype", "实验室");
			int total=ShiYanService.getCount(cmap);
			pageBean.setTotal(total);
			List<ShiYan> list=ShiYanService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			session.setAttribute("p", 1);
			
			if(u.getUtype().equals("老师")){
				Map<String,Object> uidMap = new HashMap<String, Object>();
				uidMap.put("uid", u.getUid());
				uidMap.put("isdel", 1);
			
			
				List<Forder> list2 = orderService.getAll(uidMap);
				
				System.out.println(list2);
				
				if(list2.size() != 0){
					session.setAttribute("forders", list2);
				}
				
			}
			
			return "admin/list_ShiYan";
		}
	}
//   分页模糊查询
	@RequestMapping("admin/vagueShiYanList.do")
	public String vagueShiYanList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,ShiYan cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap=new HashMap<String,Object>();
       if(cd.getName()!=null&&!cd.getName().equals("")){
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		}
        cmap.put("ftype", "实验室");
		pmap.put("ftype", "实验室");
		int total=ShiYanService.getCount(cmap);
		pageBean.setTotal(total);
		List<ShiYan> list=ShiYanService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		return "admin/list_ShiYan";
	}
	@RequestMapping("admin/deleteShiYan.do")
	public String deleteShiYan(int id){
		ShiYanService.delete(id);
		return "redirect:ShiYanList.do";
	}
	
	
	
//	设备管理
	@RequestMapping("admin/addSheBei.do")
	public String addSheBei(ModelMap map,ShiYan shiYan,HttpServletRequest request){
		Timestamp time=new Timestamp(System.currentTimeMillis());
		shiYan.setFtype("设备");
		shiYan.setMstatus("充足");
		shiYan.setIsdel("1");
		shiYan.setPubtime(time.toString().substring(0, 19));
		ShiYanService.add(shiYan);
		return "redirect:SheBeiList.do";
	}
	@RequestMapping("admin/doUpdateSheBei.do")
	public String doUpdateSheBei(ModelMap map,int id){
		map.put("sy", ShiYanService.getById(id));
		return "admin/update_SheBei";
	}
	
//	处理申请设备
		@RequestMapping("admin/doAddForderSheBei.do")
	public String doAddForderSheBei(ModelMap map,int id){
		Map<String,Object> ftypeMap = new HashMap<>();
		ftypeMap.put("ftype", "实验室");
		ftypeMap.put("isdel", 1);
		List<ShiYan> list = ShiYanService.getAll(ftypeMap);

		System.out.println(list);
		map.put("sy", ShiYanService.getById(id));
		map.put("ftypes",list );
		return "admin/add_order_sheBei";
	}
		

//	分页查询
	@RequestMapping("admin/SheBeiList.do")
	public String sheBeiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap=new HashMap<String, Object>();
		cmap.put("ftype", "设备");
		pmap.put("ftype", "设备");
		int total=ShiYanService.getCount(cmap);
		pageBean.setTotal(total);
		List<ShiYan> list=ShiYanService.getByPage(pmap);
		for (ShiYan shebei : list) {
			if(shebei.getSnum()==0){
				shebei.setMstatus("暂无库存");
				ShiYanService.update(shebei);
			}
		}
		List<ShiYan> list2=ShiYanService.getByPage(pmap);
	
		map.put("page", pageBean);
		map.put("list", list2);
		session.setAttribute("p", 1);
		return "admin/list_SheBei";
	}
//   分页模糊查询
	@RequestMapping("admin/vagueSheBeiList.do")
	public String vagueSheBeiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,ShiYan cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap=new HashMap<String,Object>();
       if(cd.getName()!=null&&!cd.getName().equals("")){
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		}
        cmap.put("ftype", "设备");
		pmap.put("ftype", "设备");
		int total=ShiYanService.getCount(cmap);
		pageBean.setTotal(total);
		List<ShiYan> list=ShiYanService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		return "admin/list_SheBei";
	}
	@RequestMapping("admin/deleteSheBei.do")
	public String deleteSheBei(int id){
		ShiYanService.delete(id);
		return "redirect:SheBeiList.do";
	}
	
	
	
//	耗材管理
	@RequestMapping("admin/addHaoCai.do")
	public String addHaoCai(ModelMap map,ShiYan shiYan,HttpServletRequest request){
		Timestamp time=new Timestamp(System.currentTimeMillis());
		shiYan.setFtype("耗材");
		shiYan.setMstatus("充足");
		shiYan.setIsdel("1");
		shiYan.setPubtime(time.toString().substring(0, 19));
		ShiYanService.add(shiYan);
		return "redirect:HaoCaiList.do";
	}
	@RequestMapping("admin/doUpdateHaoCai.do")
	public String doUpdateHaoCai(ModelMap map,int id){
		map.put("sy", ShiYanService.getById(id));
		return "admin/update_HaoCai";
	}
	@RequestMapping("admin/updateHaoCai.do")
	public String updateHaoCai(HttpServletRequest request,ShiYan ShiYan){
		ShiYanService.update(ShiYan);
		return "redirect:HaoCaiList.do";
	}
//	分页查询
	@RequestMapping("admin/HaoCaiList.do")
	public String haoCaiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap=new HashMap<String, Object>();
		pmap.put("ftype", null);
		cmap.put("name", null);
		cmap.put("ftype", "耗材");
		pmap.put("ftype", "耗材");
		int total=ShiYanService.getCount(cmap);
		pageBean.setTotal(total);
		List<ShiYan> list=ShiYanService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "admin/list_HaoCai";
	}
//   分页模糊查询
	@RequestMapping("admin/vagueHaoCaiList.do")
	public String vagueHaoCaiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,ShiYan cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap=new HashMap<String,Object>();
       if(cd.getName()!=null&&!cd.getName().equals("")){
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		}
        cmap.put("ftype", "耗材");
		pmap.put("ftype", "耗材");
		int total=ShiYanService.getCount(cmap);
		pageBean.setTotal(total);
		List<ShiYan> list=ShiYanService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		return "admin/list_HaoCai";
	}
	@RequestMapping("admin/deleteHaoCai.do")
	public String deleteHaoCai(int id){
		ShiYanService.delete(id);
		return "redirect:HaoCaiList.do";
	}



}
