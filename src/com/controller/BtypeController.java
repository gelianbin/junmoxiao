package com.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.entity.Btype;
import com.server.BtypeServer;
import com.util.PageBean;

import net.sf.json.JSONObject;

@Controller
public class BtypeController {
	@Resource
	private BtypeServer BtypeService;
	

	/**
	 * ===房间类别===
	 * @param Btype
	 * @param response
	 */
	@RequestMapping("admin/addBtype.do")
	public void addBtype(Btype Btype,HttpServletResponse response){
		   Map<String, Object> map=new HashMap<String, Object>();
		   map.put("name", Btype.getName());
		   System.out.println("uname==="+BtypeService.checkUname(map));
		   JSONObject obj=new JSONObject();
		   if(BtypeService.checkUname(map)!=null){
				 obj.put("info", "ok");
			   }else{
				   Btype addr=new Btype();
				   addr.setName(Btype.getName());
				   addr.setBtype("类别");
				   BtypeService.add(addr);
				   obj.put("info", "可以用！");
				  
			   }
		   response.setContentType("text/html;charset=utf-8");
		   PrintWriter out=null;
		   try {
			out=response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
		   
	}
	@RequestMapping("admin/doUpdateBtype.do")
	public String doUpdateBtype(ModelMap map,int id){
		map.put("Btype", BtypeService.getById(id));
		return "admin/type_update";
	}
	
	@RequestMapping("admin/updateBtype.do")
	public void updateBtype(Btype Btype,HttpServletResponse response){
		   Map<String, Object> map=new HashMap<String, Object>();
		   map.put("name", Btype.getName());
		   System.out.println("uname==="+BtypeService.checkUname(map));
		   JSONObject obj=new JSONObject();
		   if(BtypeService.checkUname(map)!=null){
				 obj.put("info", "ok");
			   }else{
				   Btype addr=new Btype();
				   addr.setName(Btype.getName());
				   addr.setBtype("类别");
				   addr.setId(Btype.getId());
				   BtypeService.update(addr);
				   obj.put("info", "可以用！");
				  
			   }
		   response.setContentType("text/html;charset=utf-8");
		   PrintWriter out=null;
		   try {
			out=response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
		   
	}
//	分页查询
	@RequestMapping("admin/fBtypeList.do")
	public String fBtypeList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		Map<String, Object> tmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		tmap.put("btype", "类别");
		pmap.put("btype", "类别");
		int total=BtypeService.getCount(tmap);
		pageBean.setTotal(total);
		List<Btype> list=BtypeService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "admin/type_list";
	}

	@RequestMapping("admin/deleteBtype.do")
	public String deleteBtype(int id){
		BtypeService.delete(id);
		return "redirect:fBtypeList.do";
	}
	
	
	/**
	 * ===地区管理===
	 * @param Btype
	 * @param response
	 */
	
	
	
	@RequestMapping("admin/addBtype_dq.do")
	public void addBtype_dq(Btype Btype,HttpServletResponse response){
		   Map<String, Object> map=new HashMap<String, Object>();
		   map.put("name", Btype.getName());
		   System.out.println("uname==="+BtypeService.checkUname(map));
		   JSONObject obj=new JSONObject();
		   if(BtypeService.checkUname(map)!=null){
				 obj.put("info", "ok");
			   }else{
				   Btype addr=new Btype();
				   addr.setName(Btype.getName());
				   addr.setBtype("地区");
				   BtypeService.add(addr);
				   obj.put("info", "可以用！");
				  
			   }
		   response.setContentType("text/html;charset=utf-8");
		   PrintWriter out=null;
		   try {
			out=response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
		   
	}
	@RequestMapping("admin/doUpdateBtype_dq.do")
	public String doUpdateBtype_dq(ModelMap map,int id){
		map.put("Btype", BtypeService.getById(id));
		return "admin/type_update_dq";
	}
	
	@RequestMapping("admin/updateBtype_dq.do")
	public void updateBtype_dq(Btype Btype,HttpServletResponse response){
		   Map<String, Object> map=new HashMap<String, Object>();
		   map.put("name", Btype.getName());
		   System.out.println("uname==="+BtypeService.checkUname(map));
		   JSONObject obj=new JSONObject();
		   if(BtypeService.checkUname(map)!=null){
				 obj.put("info", "ok");
			   }else{
				   Btype addr=new Btype();
				   addr.setName(Btype.getName());
				   addr.setBtype("地区");
				   addr.setId(Btype.getId());
				   BtypeService.update(addr);
				   obj.put("info", "可以用！");
				  
			   }
		   response.setContentType("text/html;charset=utf-8");
		   PrintWriter out=null;
		   try {
			out=response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
		   
	}
//	分页查询
	@RequestMapping("admin/fBtypeList_dq.do")
	public String fBtypeList_dq(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		Map<String, Object> tmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		pmap.put("btype", "地区");
		tmap.put("btype", "地区");
		int total=BtypeService.getCount(tmap);
		pageBean.setTotal(total);
		List<Btype> list=BtypeService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "admin/type_list_dq";
	}

	@RequestMapping("admin/deleteBtype_dq.do")
	public String deleteBtype_dq(int id){
		BtypeService.delete(id);
		return "redirect:fBtypeList_dq.do";
	}


    /**
     * ===菜品管理===
     * @param
     */
    @RequestMapping("admin/addFtype.do")
    public void addFtype(Btype Ftype,HttpServletResponse response){
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("name", Ftype.getName());
        map.put("btype", "菜品");
        System.out.println("uname==="+ Ftype.getName());
        System.out.println("uname==="+BtypeService.checkUname(map));
        JSONObject obj=new JSONObject();
        if(BtypeService.checkUname(map)!=null){
            obj.put("info", "ok");
        }else{
            Btype type=new Btype();
            type.setName(Ftype.getName());
            type.setBtype("菜品");
            BtypeService.add(type);
            obj.put("info", "用户名可以用！");

        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=null;
        try {
            out=response.getWriter();
            out.print(obj);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            out.close();
        }

    }

    @RequestMapping("admin/updateType.do")
    public void updateType(Btype Ftype,HttpServletResponse response){
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("name", Ftype.getName());
        map.put("btype", "菜品");
        System.out.println("uname==="+BtypeService.checkUname(map));
        JSONObject obj=new JSONObject();
        if(BtypeService.checkUname(map)!=null&&
                !BtypeService.checkUname(map).getName().equals(Ftype.getName())){
            obj.put("info", "ok");
        }else{
            Btype Ftype1=BtypeService.getById(Ftype.getId());
            Ftype1.setName(Ftype.getName());
            BtypeService.update(Ftype1);
            obj.put("info", "可以用！");

        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=null;
        try {
            out=response.getWriter();
            out.print(obj);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            out.close();
        }

    }
    @RequestMapping("admin/doUpdateFtype.do")
    public String doUpdateFtype(ModelMap map,int id){
        map.put("type", BtypeService.getById(id));
        return "admin/type_update_cp";
    }

    //	分页查询
    @RequestMapping("admin/fFtypeList.do")
    public String fFtypeList(@RequestParam(value="page",required=false)String page,
                           ModelMap map,HttpSession session){
        if(page==null||page.equals("")){
            page="1";
        }
        PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
        Map<String, Object> pmap=new HashMap<String,Object>();
        Map<String, Object> cmap=new HashMap<String,Object>();
        pmap.put("pageno", pageBean.getStart());
        pmap.put("pageSize", pageBean.getPageSize());
        pmap.put("btype", "菜品");
        cmap.put("btype", "菜品");
        int total=BtypeService.getCount(cmap);
        pageBean.setTotal(total);
        List<Btype> list=BtypeService.getByPage(pmap);
        map.put("page", pageBean);
        map.put("list", list);
        session.setAttribute("p", 1);
        return "admin/type_list_cp";
    }
    //   分页模糊查询
    @RequestMapping("admin/vagueFtypeList.do")
    public String vagueFtypeList(@RequestParam(value="page",required=false)String page,
                                 ModelMap map,HttpSession session){
        if(page==null||page.equals("")){
            page="1";
        }
        PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
        Map<String, Object> pmap=new HashMap<String,Object>();
        Map<String, Object> cmap=new HashMap<String,Object>();
        pmap.put("pageno", pageBean.getStart());
        pmap.put("pageSize", pageBean.getPageSize());
        pmap.put("btype", "菜品");
        cmap.put("btype", "菜品");
        int total=BtypeService.getCount(cmap);
        pageBean.setTotal(total);
        List<Btype> list=BtypeService.getByPage(pmap);
        map.put("page", pageBean);
        map.put("list", list);
        session.setAttribute("p", 2);
        return "admin/type_list_cp";
    }
    @RequestMapping("admin/deleteFtype.do")
    public String deleteFtype(int id){
        BtypeService.delete(id);
        return "redirect:fFtypeList.do";
    }
}
