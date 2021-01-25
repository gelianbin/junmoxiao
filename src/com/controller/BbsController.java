package com.controller;

import java.sql.Timestamp;
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

import com.entity.BbsWithBLOBs;
import com.entity.Sysuser;
import com.server.BbsServer;
import com.server.SysuserServier;
import com.util.PageBean;

@Controller
public class BbsController {
	@Resource
	private BbsServer bbsService;
	@Resource
	private SysuserServier userService;

	@RequestMapping("addBbsFore.do")
	public String addBbsFore(BbsWithBLOBs bbs, HttpServletResponse response, HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			Timestamp time = new Timestamp(System.currentTimeMillis());
			bbs.setPubtime(time.toString().substring(0, 19));
			bbs.setUid(user.getUid());
			bbs.setBtype("投诉反馈");
			bbs.setStatus("待回复");
			bbsService.add(bbs);
			return "redirect:myBbsList.do";
		}

	}
	
	@RequestMapping("myBbsList.do")
	public String myBbsList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			Map<String, Object> bmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			pmap.put("btype", "投诉反馈");
			bmap.put("btype", "投诉反馈");
			pmap.put("uid", user.getUid());
			bmap.put("uid", user.getUid());
			int total = bbsService.getCount(bmap);
			pageBean.setTotal(total);
			List<BbsWithBLOBs> list = bbsService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("ulist", userService.getAll(null));
			session.setAttribute("p", 1);
			return "myBbsList";
		}

	}

	@RequestMapping("deleteBbsFore.do")
	public String deleteBbsFore(ModelMap map,int id) {
		 bbsService.delete(id);
		return "redirect:myBbsList.do";
	}
	
	/**
	 * 
	===订餐===
	 * @return
	 */
	
	@RequestMapping("addBbsFore_dc.do")
	public String addBbsFore_dc(BbsWithBLOBs bbs, HttpServletResponse response, HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			Timestamp time = new Timestamp(System.currentTimeMillis());
			bbs.setPubtime(time.toString().substring(0, 19));
			bbs.setUid(user.getUid());
			bbs.setBtype("订餐");
			bbs.setStatus("待处理");
			bbsService.add(bbs);
			return "redirect:myBbsList_dc.do";
		}

	}
	
	@RequestMapping("myBbsList_dc.do")
	public String myBbsList_dc(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			Map<String, Object> bmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			pmap.put("btype", "订餐");
			bmap.put("btype", "订餐");
			pmap.put("uid", user.getUid());
			bmap.put("uid", user.getUid());
			int total = bbsService.getCount(bmap);
			pageBean.setTotal(total);
			List<BbsWithBLOBs> list = bbsService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("ulist", userService.getAll(null));
			session.setAttribute("p", 1);
			return "myBbsList_dc";
		}

	}

	@RequestMapping("deleteBbsFore_dc.do")
	public String deleteBbsFore_dc(ModelMap map,int id) {
		 bbsService.delete(id);
		return "redirect:myBbsList_dc.do";
	}
	
	/**
	 * 
===投诉反馈===
	 *
	 */
	
	
	
	// 分页查询---投诉反馈
	@RequestMapping("admin/bbsList.do")
	public String bbsList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("auser");
		if (user == null) {
			return "admin/login";
		} else {
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			Map<String, Object> bmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			pmap.put("btype", "投诉反馈");
			bmap.put("btype", "投诉反馈");
			int total = bbsService.getCount(bmap);
			pageBean.setTotal(total);
			List<BbsWithBLOBs> list = bbsService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("ulist", userService.getAll(null));
			session.setAttribute("p", 1);
			return "admin/bbs_list";
		}

	}

	
	

	
	@RequestMapping("admin/doUpdateBbs.do")
	public String doUpdateBbs(int id, ModelMap map) {
		BbsWithBLOBs bbs = bbsService.getById(id);
		map.put("bbs", bbs);
		return "admin/bbs_update";
	}

	@RequestMapping("admin/updateBbs.do")
	public String updateBbs_sb(BbsWithBLOBs bbs, ModelMap map) {
		bbs.setStatus("已回复");
		bbsService.update(bbs);
		return "redirect:bbsList.do";
	}
	

	@RequestMapping("admin/deleteBbs.do")
	public String deleteBbs(int id) {
		bbsService.delete(id);
		return "admin/success";
	}
	
	
	
	
	// 分页查询---订餐
		@RequestMapping("admin/bbsList_dc.do")
		public String bbsList_dc(@RequestParam(value = "page", required = false) String page, ModelMap map,
				HttpSession session) {
			Sysuser user = (Sysuser) session.getAttribute("auser");
			if (user == null) {
				return "admin/login";
			} else {
				if (page == null || page.equals("")) {
					page = "1";
				}
				PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
				Map<String, Object> pmap = new HashMap<String, Object>();
				Map<String, Object> bmap = new HashMap<String, Object>();
				pmap.put("pageno", pageBean.getStart());
				pmap.put("pageSize", pageBean.getPageSize());
				pmap.put("btype", "订餐");
				bmap.put("btype", "订餐");
				int total = bbsService.getCount(bmap);
				pageBean.setTotal(total);
				List<BbsWithBLOBs> list = bbsService.getByPage(pmap);
				map.put("page", pageBean);
				map.put("list", list);
				map.put("ulist", userService.getAll(null));
				session.setAttribute("p", 1);
				return "admin/bbs_list_dc";
			}

		}

		
		

		
		@RequestMapping("admin/doUpdateBbs_dc.do")
		public String doUpdateBbs_dc(int id, ModelMap map) {
			BbsWithBLOBs bbs = bbsService.getById(id);
			map.put("bbs", bbs);
			return "admin/bbs_update_dc";
		}

		@RequestMapping("admin/updateBbs_dc.do")
		public String updateBbs_dc(BbsWithBLOBs bbs, ModelMap map) {
			bbs.setStatus("已处理");
			bbsService.update(bbs);
			return "redirect:bbsList_dc.do";
		}

	


	
}
