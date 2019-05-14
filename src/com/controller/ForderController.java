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

import com.dao.SbbfMapper;
import com.dao.SbbxMapper;
import com.dto.SbbfDto;
import com.dto.SbbxDto;
import com.entity.*;
import com.server.SyssbServer;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.server.ForderServer;
import com.server.ShiYanServer;
import com.server.SysuserServier;
import com.util.PageBean;

@Controller
public class ForderController {
	@Resource
	private ForderServer orderService;
	@Resource
	private SysuserServier userService;
	@Resource
	private ShiYanServer shiYanService;
	@Resource
	private SyssbServer syssbServer;
	@Resource
	private SbbxMapper sbbxMapper;
	@Resource
	private SbbfMapper sbbfMapper;

//	文件上传
	public String fileUpload(@RequestParam(value="file",required=false)MultipartFile file,
			HttpServletRequest request,String img){
		String path=request.getSession().getServletContext().getRealPath("upload");
		System.out.println("path==="+path);
		System.out.println("file==="+file);
		String fileName=file.getOriginalFilename();
		System.out.println("fileName==="+fileName);
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
			img=null;	
		}
		return img;
		
	}
	/*实验室*/
//	分页查询
	@RequestMapping("admin/shiYanShiForderList.do")
	public String shiYanShiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		Sysuser u=(Sysuser)session.getAttribute("auser");
		if(u==null){
			return "admin/login";
		}else{
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		Map<String, Object> cmap=new HashMap<String,Object>();
		/*Map<String, Object> smap=new HashMap<String,Object>();*/
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		if(u.getUtype().equals("实验室管理员")){
			pmap.put("uid",null);
			cmap.put("uid",null);
		}else{
			pmap.put("uid",u.getUid());
			cmap.put("uid",u.getUid());
		}
		pmap.put("ftype","实验室");
		cmap.put("ftype","实验室");
		/*smap.put("stime", "实验室");*/
		int total=orderService.getCount(cmap);
		pageBean.setTotal(total);
		List<Forder> list=orderService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("ulist", userService.getAll(null));
		map.put("slist", shiYanService.getAll(null));
		session.setAttribute("p", 1);
		return "admin/list_order_shiYanShi";
		}
	}
	
//		归还
		@RequestMapping("admin/guiHuan.do")
		public String guiHuan(HttpServletRequest request,Forder yp,ModelMap map,HttpSession session,int id){
			Sysuser u=(Sysuser)session.getAttribute("auser");
			Timestamp time=new Timestamp(System.currentTimeMillis());
			if(u==null){
				return "admin/login";
			}else{
				Forder syso=orderService.getById(id);
				syso.setEtime( time.toString().substring(0, 19) );
				syso.setIsdel("0");
				syso.setKid(id);
				orderService.update(syso);
				ShiYan sy=shiYanService.getById(syso.getFid());
				sy.setMstatus("空闲中");
				sy.setId(syso.getFid());
				shiYanService.update(sy);
				/*map.put("etime", "实验室");
				map.put("fid", syso.getFid());
				List<Forder> list=orderService.getByPage(map);
				for(Forder o:list){
					if(!o.getKid().equals(id)){
						Forder fo=orderService.getById(o.getKid());
						fo.setStatus("审核失败");
						fo.setKid(id);
						orderService.update(fo);
					}
				}*/
				return "success";
			}

		}
//	申请通过
	@RequestMapping("admin/tongGuoSYS.do")
	public String tongGuoSYS(HttpServletRequest request,Forder yp,ModelMap map,HttpSession session,int id){
		Sysuser u=(Sysuser)session.getAttribute("auser");
		/*Timestamp time=new Timestamp(System.currentTimeMillis());*/
		
		if(u==null){
			return "admin/login";
		}else{
			Forder syso=orderService.getById(id);
			
			System.out.println(syso);
			
			syso.setStatus("审核通过");
			syso.setKid(id);
			orderService.update(syso);
			ShiYan sy=shiYanService.getById(syso.getFid());
			sy.setMstatus("已预订");
			sy.setId(syso.getFid());
			shiYanService.update(sy);
			map.put("ftype", "实验室");
			map.put("fid", syso.getFid());
			List<Forder> list=orderService.getByPage(map);
			for(Forder o:list){
				if(!o.getKid().equals(id)){
					Forder fo=orderService.getById(o.getKid());
					fo.setStatus("审核失败");
					fo.setKid(id);
					orderService.update(fo);
				}
			}
			return "success";
		}

	}
//	申请不通过
	@RequestMapping("admin/buTongGuoSYS.do")
	public String buTongGuoSYS(HttpServletRequest request,Forder yp,HttpSession session,int id){
		Sysuser u=(Sysuser)session.getAttribute("auser");
		//Timestamp time=new Timestamp(System.currentTimeMillis());
		if(u==null){
			return "admin/login";
		}else{
			Forder f=orderService.getById(id);
			f.setStatus("审核失败");
			f.setKid(id);
			orderService.update(f);
			return "success";
		}

	}
//	申请
	@RequestMapping("admin/shenQin.do")
	public String addForder(HttpServletRequest request,Forder yp,HttpSession session,int id){
		//获取当前用户信息
		Sysuser u=(Sysuser)session.getAttribute("auser");
		//获取当前时间
		Timestamp time=new Timestamp(System.currentTimeMillis());
		if(u==null){
			return "admin/login";
		}else{
			yp.setUid(u.getUid());
			yp.setStatus("待审核");
			yp.setIsdel("1");
			yp.setFid(id);
			yp.setFtype("实验室");
			yp.setPubtime(time.toString().substring(0, 19));
			yp.setStime(time.toString().substring(0, 19));
			orderService.add(yp);
			return "success";
		}

	}
	
   /*设备管理*/
//	分页查询
	@RequestMapping("admin/sheBeiForderList.do")
	public String sheBeiForderList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		Sysuser u=(Sysuser)session.getAttribute("auser");
		if(u==null){
			return "admin/login";
		}else{
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		Map<String, Object> cmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		if(u.getUtype().equals("实验设备管理员")){
			pmap.put("uid",null);
			cmap.put("uid",null);
		}else{
			pmap.put("uid",u.getUid());
			cmap.put("uid",u.getUid());
		}
		pmap.put("ftype","设备");
		cmap.put("ftype","设备");
		int total=orderService.getCount(cmap);
		pageBean.setTotal(total);
		List<Forder> list=orderService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("ulist", userService.getAll(null));
		map.put("slist", shiYanService.getAll(null));
		session.setAttribute("p", 1);
		return "admin/list_order_sheBei";
		}
	}

	/*设备报修管理*/
	@RequestMapping("admin/sbbxList.do")
	public String sbbxList(ModelMap map,HttpSession session){
		Sysuser u=(Sysuser)session.getAttribute("auser");
		//获取的前时间
		Timestamp time=new Timestamp(System.currentTimeMillis());
		if(u==null){
			return "admin/login";
		}else{
			List<Sbbx> sbbxList = sbbxMapper.getAll();
			ArrayList<SbbxDto> sbbxDtolist = new ArrayList<>();
			for (Sbbx s:sbbxList) {
				SbbxDto sbbxDto = new SbbxDto();
				BeanUtils.copyProperties( s,sbbxDto );
				sbbxDto.setSbname( shiYanService.getById( s.getSbid() ).getName());
				sbbxDto.setSysname( shiYanService.getById( s.getSysid() ).getName() );
				sbbxDto.setUname( userService.getById( s.getUid() ).getUname());
				if(s.getCluid()!=null){
					sbbxDto.setCluname( userService.getById( s.getCluid() ).getUname() );
				}
				sbbxDtolist.add( sbbxDto );
			}

			map.put("sbbxdtolist", sbbxDtolist);
			return "admin/list_sbbx";
		}
	}

	//	设备报修管理中完成维修操作
	@RequestMapping("admin/sbwcwx.do")
	public String sbwcwx(HttpSession session,int id){
		//获取当前登陆用户
		Sysuser u=(Sysuser)session.getAttribute("auser");
		//获取的前时间
		Timestamp time=new Timestamp(System.currentTimeMillis());
		if(u==null) {
			return "admin/login";
		}else {
			//修改报修表数据状态
			Sbbx sbbx = sbbxMapper.selectByPrimaryKey( id );
			sbbx.setBstatus( "完成维修" );
			sbbx.setCluid( u.getUid() );
			sbbx.setCltime( time.toString().substring(0, 19) );
			sbbxMapper.updateByPrimaryKeySelective( sbbx );
			//修改sys_sb表数据
			HashMap<String, Object> syssb = new HashMap<>();
			syssb.put( "sysid",sbbx.getSysid() );
			syssb.put( "sbid",sbbx.getSbid() );

			List<Syssb> syssbs = syssbServer.getByPage( syssb );
			Syssb syssb1=null;
			if(syssbs.size()>0){
				 syssb1 = syssbs.get( 0 );
			}
			syssb1.setSnum( syssb1.getSnum()+sbbx.getBxnum() );
			syssbServer.update( syssb1 );

			return "success";
		}
	}

	//	设备报修管理中报废操作
	@RequestMapping("admin/baofei.do")
	public String baofei(HttpSession session,int id){
		//获取当前登陆用户
		Sysuser u=(Sysuser)session.getAttribute("auser");
		//获取的前时间
		Timestamp time=new Timestamp(System.currentTimeMillis());
		if(u==null) {
			return "admin/login";
		}else {
			//修改报修表数据状态
			Sbbx sbbx = sbbxMapper.selectByPrimaryKey( id );
			sbbx.setBstatus( "直接报废" );
			sbbx.setCluid( u.getUid() );
			sbbx.setCltime( time.toString().substring(0, 19) );
			sbbxMapper.updateByPrimaryKeySelective( sbbx );
			//将报废数据添加到报废表中
			Sbbf sbbf = new Sbbf();
			sbbf.setStatus( "直接报废" );
			sbbf.setBftime( time.toString().substring( 0,19 ) );
			sbbf.setUid( u.getUid() );
			sbbf.setBfsnum( sbbx.getBxnum() );
			sbbf.setBfyy( sbbx.getBxyy() );
			sbbf.setSysid( sbbx.getSysid() );
			sbbf.setSbid( sbbx.getSbid() );
			sbbf.setCltime( time.toString().substring( 0,19 ) );
			sbbf.setCluid( u.getUid() );
			sbbfMapper.insertSelective( sbbf );
			return "success";
		}
	}
	/*设备报废管理*/
	@RequestMapping("admin/sbbfList.do")
	public String sbbfList(ModelMap map,HttpSession session){
		Sysuser u=(Sysuser)session.getAttribute("auser");
		if(u==null){
			return "admin/login";
		}else{
			List<Sbbf> sbbfList = sbbfMapper.getAll();
			ArrayList<SbbfDto> sbbfDtolist = new ArrayList<>();
			for (Sbbf s:sbbfList) {
				SbbfDto sbbfDto = new SbbfDto();
				BeanUtils.copyProperties( s,sbbfDto );
				sbbfDto.setSbname( shiYanService.getById( s.getSbid() ).getName());
				sbbfDto.setSysname( shiYanService.getById( s.getSysid() ).getName() );
				sbbfDto.setUname( userService.getById( s.getUid() ).getUname());
				if(s.getCluid()!=null){
					sbbfDto.setCluname( userService.getById( s.getCluid() ).getUname() );
				}
				sbbfDtolist.add( sbbfDto );
			}

			map.put("sbbfdtolist", sbbfDtolist);
			return "admin/list_sbbf";
		}
	}

	@RequestMapping("admin/qrbaofei.do")
	public String qrbaofei(HttpSession session,int id){
		//获取当前登陆用户
		Sysuser u=(Sysuser)session.getAttribute("auser");
		//获取的前时间
		Timestamp time=new Timestamp(System.currentTimeMillis());
		if(u==null) {
			return "admin/login";
		}else {
			Sbbf sbbf = sbbfMapper.selectByPrimaryKey( id );
			sbbf.setCluid( u.getUid() );
			sbbf.setCltime( time.toString().substring( 0,19 ) );
			sbbf.setStatus( "确认报废" );

			sbbfMapper.updateByPrimaryKeySelective( sbbf );
			return "success";
		}
	}
	
//	添加设备申请
	@RequestMapping("admin/addForderSheBei.do")
	public String addForderSheBei(HttpServletRequest request,Forder yp,HttpSession session){
		//获取当前登陆用户
		Sysuser u=(Sysuser)session.getAttribute("auser");
		//获取的前时间
		Timestamp time=new Timestamp(System.currentTimeMillis());
		if(u==null){
			return "admin/login";
		}else{
			ShiYan syy=shiYanService.getById(yp.getFid());
			if(syy.getSnum()<yp.getSnum()){
				return "admin/error";
			}else{
				syy.setId(yp.getFid());
				shiYanService.update(syy);
				String sid = request.getParameter( "sid" );
				System.out.println(sid);
				yp.setUid(u.getUid());
				yp.setSid( Integer.parseInt(sid) );
				yp.setStatus("待审核");
				yp.setIsdel("1");
				yp.setFtype("设备");
				yp.setPubtime(time.toString().substring(0, 19));
				yp.setStime(time.toString().substring(0, 19));
				orderService.add(yp);
				return "success";
			}
			
		}

	}
	
//	申请不通过
	@RequestMapping("admin/buTongGuoShenBei.do")
	public String buTongGuoShenBei(HttpServletRequest request,Forder yp,HttpSession session,int id){
		Sysuser u=(Sysuser)session.getAttribute("auser");
		
		if(u==null){
			return "admin/login";
		}else{
			Forder f=orderService.getById(id);
			f.setStatus("审核失败");
			f.setKid(id);
			
			orderService.update(f);
			return "success";
		}
	}
	
//	申请通过
	@RequestMapping("admin/tongGuoShenBei.do")
	public String tongGuoShenBei(HttpServletRequest request,Forder yp,HttpSession session,int id){
		Sysuser u=(Sysuser)session.getAttribute("auser");
		Timestamp time=new Timestamp(System.currentTimeMillis());
		if(u==null){
			return "admin/login";
		}else{
			Forder f=orderService.getById(id);
			ShiYan syy=shiYanService.getById(f.getFid());
			syy.setSnum(syy.getSnum()-f.getSnum());
			shiYanService.update(syy);
			f.setStatus("审核成功");
			f.setKid(id);
			orderService.update(f);


			Syssb syssb = new Syssb();
			syssb.setSid( f.getSid() );
			syssb.setSbid( f.getFid() );

			syssb.setTime( time.toString().substring(0, 19) );

			Map<String, Object> hashMap = new HashMap<>();
			hashMap.put( "sid", f.getSid());
			hashMap.put( "sbid",f.getFid());
			List<Syssb> syssbList = syssbServer.getAll( hashMap );

			if(syssbList.size()>0){
				syssb.setSnum( syssbList.get(0).getSnum()+ f.getSnum());
				syssb.setId( syssbList.get(0).getId() );
				syssbServer.update( syssb );
			}else {
				syssb.setSnum( f.getSnum() );
				syssbServer.add( syssb );
			}
			return "success";
		}
	}
	
	/*耗材*/
//	分页查询
	@RequestMapping("admin/haoCaiForderList.do")
	public String haoCaiForderList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		Sysuser u=(Sysuser)session.getAttribute("auser");
		if(u==null){
			return "admin/login";
		}else{
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		Map<String, Object> cmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		if(u.getUtype().equals("实验设备管理员")){
			pmap.put("uid",null);
			cmap.put("uid",null);
		}else{
			pmap.put("uid",u.getUid());
			cmap.put("uid",u.getUid());
		}
		pmap.put("ftype","耗材");
		cmap.put("ftype","耗材");
		int total=orderService.getCount(cmap);
		pageBean.setTotal(total);
		List<Forder> list=orderService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("ulist", userService.getAll(null));
		map.put("slist", shiYanService.getAll(null));
		session.setAttribute("p", 1);
		return "admin/list_order_haoCai";
		}
	}	
//	申请耗材
	@RequestMapping("admin/addForderHaoCai.do")
	public String addForderHaoCai(HttpServletRequest request,Forder yp,HttpSession session){
		Sysuser u=(Sysuser)session.getAttribute("auser");
		Timestamp time=new Timestamp(System.currentTimeMillis());
		if(u==null){
			return "admin/login";
		}else{
			ShiYan syy=shiYanService.getById(yp.getFid());
			if(syy.getSnum()<yp.getSnum()){
				return "admin/error";
			}else{
				//syy.setSnum(syy.getSnum()-yp.getSnum());
				syy.setId(yp.getFid());
				shiYanService.update(syy);
				yp.setUid(u.getUid());
				yp.setStatus("待审核");
				yp.setIsdel("1");
				yp.setFtype("耗材");
				yp.setPubtime(time.toString().substring(0, 19));
				orderService.add(yp);
				return "success";
			}
		}

	}
	
//	申请不通过
	@RequestMapping("admin/buTongGuoHaoCai.do")
	public String buTongGuoHaoCai(HttpServletRequest request,Forder yp,HttpSession session,int id){
		Sysuser u=(Sysuser)session.getAttribute("auser");
		if(u==null){
			return "admin/login";
		}else{
			Forder f=orderService.getById(id);
			f.setStatus("审核失败");
			f.setKid(id);
			orderService.update(f);
			return "success";
		}
	}
	
//	申请通过
	@RequestMapping("admin/tongGuoHaoCai.do")
	public String tongGuoHaoCai(HttpServletRequest request,Forder yp,HttpSession session,int id){
		Sysuser u=(Sysuser)session.getAttribute("auser");
		if(u==null){
			return "admin/login";
		}else{
			Forder f=orderService.getById(id);
			ShiYan syy=shiYanService.getById(f.getFid());
			syy.setSnum(syy.getSnum()-f.getSnum());

			shiYanService.update(syy);
			f.setStatus("审核成功");
			f.setKid(id);
			orderService.update(f);
			return "success";
		}
	}
	
//	查询统计
	@RequestMapping("admin/forderTongJiList.do")
	public String forderTongJiList(ModelMap map,HttpSession session,Forder order,String etime1,String stime1){
		System.out.println("stime1==="+stime1);
		System.out.println("etime1==="+etime1);
		System.out.println("etime==="+order.getStime());
		Map<String, Object> pmap=new HashMap<String,Object>();
		if(order.getStime()!=null&&!order.getStime().equals("")){
			pmap.put("etime",order.getStime());
		}
		pmap.put("stime1",stime1);
		pmap.put("etime1",etime1);
        List<TongJi> list=orderService.getTongJi(pmap);	
        System.out.println("list===="+list);
        for(TongJi tj:list){
        	System.out.println("name==="+tj.getName()+"amount==="+tj.getAmount());
        }
		map.put("list", list);
		map.put("etime1", etime1);
		map.put("stime1", stime1);
		session.setAttribute("p", 1);
		return "admin/list_order_tongji";
	}	
	

	@RequestMapping("admin/deleteForder.do")
	public String deleteForder(int id){
		orderService.delete(id);
		return "success";
	}
}
