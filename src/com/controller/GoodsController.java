package com.controller;

import java.io.File;


import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.server.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.entity.Goods;
import com.entity.Sysuser;
import com.util.PageBean;

@Controller
public class GoodsController {
	@Resource
	private GoodsServer goodsService;
    @Resource
    private BtypeServer typeService;
	@Resource
	private ForderServer orderService;
	@Resource
	private SysuserServier userService;
	@Resource
	private RecordServier recordService;


	 /*通用方法*/
    public void comMethod(ModelMap map) {
        Map<String, Object> tttmap = new HashMap<>();
        Map<String, Object> tttmap2 = new HashMap<>();
        Map<String, Object> tttmap3 = new HashMap<>();
        tttmap.put("btype", "地区");
        tttmap2.put("btype", "菜品");
        tttmap3.put("btype", "类别");
        map.put("dlist", typeService.getAll(tttmap));
        map.put("clist", typeService.getAll(tttmap2));
        map.put("tlist", typeService.getAll(tttmap3));
        map.put("ttlist", typeService.getAll(null));
        
        map.put("ulist", userService.getAll(null));
    }

	@RequestMapping("admin/doAddGoods.do")
	public String doAddGoods(ModelMap map) {
		/*通用方法*/
		comMethod(map);
		return "admin/goods_add";
	}

	
	@RequestMapping("admin/addGoods.do")
	public String addGoods(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, Goods Goods, String img, HttpSession session) {
		System.out.println("ddddd");
		Sysuser u = (Sysuser) session.getAttribute("auser");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "admin/login";
		} else {
			img = fileUpload(file, request, img);
			Goods.setImg(img);
			Timestamp time = new Timestamp(System.currentTimeMillis());
			Goods.setPubtime(time.toString().substring(0, 19));
			Goods.setIsdel("1");
			Goods.setBtype("菜品");
			Goods.setUid(u.getUid() + "");
			goodsService.add(Goods);
			return "admin/success";
		}
	}

	@RequestMapping("admin/addGoods_jf.do")
	public String addGoods_jf(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, Goods Goods, String img, HttpSession session) {
		System.out.println("ddddd");
		Sysuser u = (Sysuser) session.getAttribute("auser");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "admin/login";
		} else {
			img = fileUpload(file, request, img);
			Goods.setImg(img);
			Timestamp time = new Timestamp(System.currentTimeMillis());
			Goods.setPubtime(time.toString().substring(0, 19));
			Goods.setIsdel("1");
			Goods.setBtype("礼品");
            Goods.setUid(u.getUid() + "");
			goodsService.add(Goods);
			return "admin/success";
		}
	}

	@RequestMapping("admin/doUpdateGoods.do")
	public String doUpdateGoods(ModelMap map, int id) {
		map.put("jz", goodsService.getById(id));
		/*通用方法*/
		comMethod(map);
		return "admin/goods_update";
	}

	@RequestMapping("admin/doUpdateGoods_jf.do")
	public String doUpdateGoods_jf(ModelMap map, int id) {
		map.put("jz", goodsService.getById(id));
		return "admin/goods_update_jf";
	}

	// 显示一类商品
	@RequestMapping("showGoodsType.do")
	public String showGoodsType(ModelMap map, int fid) {
		Map<String, Object> tmap0 = new HashMap<>();
		tmap0.put("fid", fid);
		map.put("list", goodsService.getAll(tmap0));
		map.put("tlist", typeService.getAll(null));
		map.put("ulist", userService.getAll(null));
		/*通用方法*/
		comMethod(map);
		return "goodslist";
	}

	@RequestMapping("admin/updateGoods.do")
	public String updateGoods(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, Goods Goods, String img) {
		img = fileUpload(file, request, img);
		if(img!="zanwu.jpg") {
			Goods.setImg(img);
		}
		goodsService.update(Goods);
		return "admin/success";
	}

	@RequestMapping("admin/updateGoods_jf.do")
	public String updateGoods_jf(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, Goods Goods, String img) {
		img = fileUpload(file, request, img);
		if(img!="zanwu.jpg") {
			Goods.setImg(img);
		}
		goodsService.update(Goods);
		return "admin/success";
	}

	// 商品详情
	@RequestMapping("showGoodsx.do")
	public String showGoods(ModelMap map, int id) {
		System.out.println("id ====" + id);
		map.put("jz", goodsService.getById(id));
		Map<String, Object> omap = new HashMap<String, Object>();
		omap.put("fid", id);
		omap.put("status", "评价");
		map.put("ulist", userService.getAll(null));
		map.put("list", orderService.getAll(omap));
		System.out.println("order ====" + orderService.getAll(omap).size());
		/*通用方法*/
		comMethod(map);
		return "goodsx";
	}

	// 商品详情
	@RequestMapping("showGoodsx_jf.do")
	public String showGoodsx_jf(ModelMap map, int id) {
		System.out.println("id ====" + id);
		map.put("jz", goodsService.getById(id));
		/*通用方法*/
		comMethod(map);
		return "goodsx_jf";
	}



	// 分页查询
	@RequestMapping("admin/GoodsList.do")
	public String jianList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {

		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		Map<String, Object> cmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		pmap.put("btype", "菜品");
		cmap.put("btype", "菜品");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		
		/*通用方法*/
		comMethod(map);
		
		return "admin/goods_list";
	}

	// 分页查询
	@RequestMapping("admin/GoodsList_jf.do")
	public String GoodsList_jf(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {

		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		Map<String, Object> cmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		pmap.put("btype", "礼品");
		cmap.put("btype", "礼品");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		/*通用方法*/
		comMethod(map);
		return "admin/goods_list_jf";
	}

	// 分页模糊查询
	@RequestMapping("admin/vagueGoodsList.do")
	public String vagueGoodsList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {

		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());

		Map<String, Object> cmap = new HashMap<String, Object>();
		if (cd.getName() != null && !cd.getName().equals("")) {
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		}
		if (cd.getFid() != null && !cd.getFid().equals("")) {
			cmap.put("fid", cd.getFid());
			pmap.put("fid", cd.getFid());
		}
		pmap.put("btype", "菜品");
		cmap.put("btype", "菜品");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		/*通用方法*/
		comMethod(map);
		return "admin/goods_list";
	}

	// 分页模糊查询
	@RequestMapping("admin/vagueGoodsList_jf.do")
	public String vagueGoodsList_jf(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {

		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());

		Map<String, Object> cmap = new HashMap<String, Object>();
		if (cd.getName() != null && !cd.getName().equals("")) {
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		}
		if (cd.getFid() != null && !cd.getFid().equals("")) {
			cmap.put("fid", cd.getFid());
			pmap.put("fid", cd.getFid());
		}
		pmap.put("btype", "礼品");
		cmap.put("btype", "礼品");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		/*通用方法*/
		comMethod(map);
		return "admin/goods_list_jf";
	}

	// 分页模糊查询
	@RequestMapping("showGoods.do")
	public String showGoods(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());

		Map<String, Object> cmap = new HashMap<String, Object>();
		System.out.println("name===" + cd.getName());
		if (cd.getName() != null && !cd.getName().equals("")) {
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		}
		if (cd.getFid() != null && !cd.getFid().equals("")) {
			cmap.put("fid", cd.getFid());
			pmap.put("fid", cd.getFid());
		}
		pmap.put("btype", "菜品");
		cmap.put("btype", "菜品");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		/*通用方法*/
		comMethod(map);
		return "goods_List";
	}

	// 分页查询---最火10种商品
	@RequestMapping("showGoods_hot.do")
	public String showGoods_hot(ModelMap map, HttpSession session, Goods goods) {
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", 0);
		pmap.put("pageSize", 10);
		pmap.put("btype", "菜品");
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("list", list);
		session.setAttribute("p", 10);
		/*通用方法*/
		comMethod(map);
		return "goods_List_hot";
	}

	// 分页模糊查询
	@RequestMapping("showGoods2.do")
	public String showGoods2(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());

		Map<String, Object> cmap = new HashMap<String, Object>();
		System.out.println("name===" + cd.getName());
		pmap.put("btype", "菜品");
		cmap.put("btype", "菜品");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 3);
		/*通用方法*/
		comMethod(map);
		return "goods_List";
	}
	
	@RequestMapping("goodsList_jf.do")
	public String goodsList_jf(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());

		Map<String, Object> cmap = new HashMap<String, Object>();
		System.out.println("name===" + cd.getName());
		pmap.put("btype", "礼品");
		cmap.put("btype", "礼品");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 4);
		/*通用方法*/
		comMethod(map);
		return "goods_list_jf";
	}
	@RequestMapping("showGoods3.do")
	public String showGoods3(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());

		Map<String, Object> cmap = new HashMap<String, Object>();
		System.out.println("name===" + cd.getName());
		cmap.put("isshow", "推荐");
		pmap.put("isshow", "推荐");
		pmap.put("btype", "菜品");
		cmap.put("btype", "菜品");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 4);
		/*通用方法*/
		comMethod(map);
		return "goods_List";
	}

	// 分页模糊查询
	@RequestMapping("searchGoods.do")
	public String SelectGoods(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());

		Map<String, Object> cmap = new HashMap<String, Object>();
		System.out.println("name===" + cd.getName());
		if (cd.getName() != null && !cd.getName().equals("")) {
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		} 
		if (cd.getFid() != null && !cd.getFid().equals("")) {
			cmap.put("fid", cd.getFid());
			pmap.put("fid", cd.getFid());
		}
		pmap.put("btype", "菜品");
		cmap.put("btype", "菜品");
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 5);
		/*通用方法*/
		comMethod(map);
		return "goods_List";
	}
	
	// 分页模糊查询
		@RequestMapping("searchGoods_jf.do")
		public String searchGoods_jf(@RequestParam(value = "page", required = false) String page, ModelMap map,
				HttpSession session, Goods cd) {
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());

			Map<String, Object> cmap = new HashMap<String, Object>();
			System.out.println("name===" + cd.getName());
			if (cd.getName() != null && !cd.getName().equals("")) {
				cmap.put("name", cd.getName());
				pmap.put("name", cd.getName());
			}
			if (cd.getFid() != null && !cd.getFid().equals("")) {
				cmap.put("fid", cd.getFid());
				pmap.put("fid", cd.getFid());
			}
			pmap.put("btype", "礼品");
			cmap.put("btype", "礼品");
			int total = goodsService.getCount(cmap);
			pageBean.setTotal(total);
			List<Goods> list = goodsService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			session.setAttribute("p", 5);
			/*通用方法*/
			comMethod(map);
			return "goods_list_jf";
		}
	
	@RequestMapping("admin/deleteGoods.do")
	public String deleteGoods(int id) {
		goodsService.delete(id);
		return "admin/success";
	}
	
	
	// 文件上传
		public String fileUpload(@RequestParam(value = "file", required = false) MultipartFile file,
				HttpServletRequest request, String img) {
			String path = request.getSession().getServletContext().getRealPath("upload");
			String fileName = file.getOriginalFilename();
			File targetFile = new File(path, fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			try {
				file.transferTo(targetFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			String pa = request.getContextPath() + "/upload/" + fileName;
			System.out.println("path===" + pa);
			if (fileName != null && !fileName.equals("")) {
				img = fileName;
			} else {
				img = "zanwu.jpg";
			}
			return img;

		}

}
