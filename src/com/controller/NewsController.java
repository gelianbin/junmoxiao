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

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.House;
import com.entity.News;
import com.entity.Sysuser;
import com.server.BtypeServer;
import com.server.HouseServer;
import com.server.NewsServer;
import com.server.SysuserServier;
import com.util.PageBean;

@Controller
public class NewsController {
	@Resource
	private NewsServer newsService;
	@Resource
	private SysuserServier userService;
	@Resource
	private HouseServer houseService;
	@Resource
	private BtypeServer btypeService;
	
	
	   /*通用方法*/
    public void comMethod(ModelMap map) {
        Map<String, Object> tttmap = new HashMap<>();
        Map<String, Object> tttmap2 = new HashMap<>();
        Map<String, Object> tttmap3 = new HashMap<>();
        tttmap.put("btype", "地区");
        tttmap2.put("btype", "菜品");
        tttmap3.put("btype", "类别");
        map.put("dlist", btypeService.getAll(tttmap));
        map.put("clist", btypeService.getAll(tttmap2));
        map.put("tlist", btypeService.getAll(tttmap3));
        map.put("ttlist", btypeService.getAll(null));
    }
	

	// 首页显示内容
	@RequestMapping("index.do")
	public String index(ModelMap map) {
		Map<String, Object> pmap = new HashMap<String, Object>();
		Map<String, Object> jzmap = new HashMap<String, Object>();
		Map<String, Object> nmap = new HashMap<String, Object>();
		Map<String, Object> nmap2 = new HashMap<String, Object>();
		pmap.put("pageno", 0);
		pmap.put("pageSize", 4);
		/* pmap.put("btype", "周边旅游"); */
		jzmap.put("pageno", 0);
		jzmap.put("pageSize", 10);
		
		nmap2.put("pageno", 0);
		nmap2.put("pageSize", 10);
		/* nmap2.put("btype", "周边旅游"); */

		/* jzmap.put("shstatus", "通过审核"); */
		nmap.put("pageno", 0);
		nmap.put("pageSize", 9);
		
		List<News> list = newsService.getByPage(pmap);
		List<News> nlist2 = newsService.getByPage(nmap2);

		List<House> clist = houseService.getByPage(jzmap);
		List<House> nlist = houseService.getByPage(nmap);
		List<House> jzlist = houseService.getAll(null);
		
		map.put("nlist", list);
		map.put("nlist2", nlist2);
		map.put("hlist", clist);
		map.put("jlist", jzlist);
		map.put("nblist", nlist);
		comMethod(map);
		
		return "index2";
	}

	@RequestMapping("showNews.do")
	public String showNews(ModelMap map, int id) {
		map.put("news", newsService.getById(id));
		comMethod(map);
		
		map.put("ulist", userService.getAll(null));
		return "newsx";
	}

	@RequestMapping("admin/doAddNews.do")
	public String doAddNews(ModelMap map) {
		map.put("tlist", newsService.getAll(null));
		return "admin/news_add";
	}

	@RequestMapping("admin/addNews.do")
	public String addNews(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, News news, String img, HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("auser");
		if (user == null) {
			return "admin/login";
		} else {
			img = fileUpload(file, request, img);
			if (img != null) {
				news.setImg(img);
			} else {
				news.setImg("zanwu.jpg");
			}
			Timestamp time = new Timestamp(System.currentTimeMillis());
			news.setPubtime(time.toString().substring(0, 19));
			news.setIsdel("1");
			news.setUid(user.getUid());
			newsService.add(news);
			return "redirect:newsList.do";
		}
	}

	@RequestMapping("admin/doUpdateNews.do")
	public String doUpdateNews(ModelMap map, int id) {
		map.put("news", newsService.getById(id));
		return "admin/news_update";
	}

	
	@RequestMapping("admin/lookNews.do")
	public String lookNews(ModelMap map, int id) {
		map.put("news", newsService.getById(id));
		return "admin/news_look";
	}
	@RequestMapping("admin/doUpdateNews2.do")
	public String doUpdateNews2(ModelMap map, int id) {
		map.put("news", newsService.getById(id));
		return "admin/update_news2";
	}

	@RequestMapping("admin/updateNews.do")
	public String updateNews(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, News news, String img) {
		Timestamp time = new Timestamp(System.currentTimeMillis());
		news.setPubtime(time.toString().substring(0, 19));
		img = fileUpload(file, request, img);
		news.setImg(img);
		newsService.update(news);
		return "redirect:newsList.do";
	}

	@RequestMapping("admin/updateNews2.do")
	public String updateNews2(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, News news, String img) {
		img = fileUpload(file, request, img);
		if (img != null) {
			news.setImg(img);
		} else {
		}
		newsService.update(news);
		return "redirect:newsList2.do";
	}

	// 分页
	@RequestMapping("fnewsList.do")
	public String newsList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		Map<String, Object> nmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
//		pmap.put("btype", "周边旅游");
//		nmap.put("btype", "周边旅游");
		int total = newsService.getCount(nmap);
		System.out.println("total===" + total);
		pageBean.setTotal(total);
		List<News> list = newsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		comMethod(map);
		
		return "news_list";
	}

	// 分页 ---前台搜索 查找周边旅游的标题
	@RequestMapping("searchNews.do")
	public String searchNews(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, News news) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		Map<String, Object> nmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		if (news.getName() != null && !news.getName().equals("")) {
			pmap.put("name", news.getName());
			nmap.put("name", news.getName());
		} else {
			pmap.put("name", null);
			nmap.put("name", null);
		}
		System.out.println("name===" + news.getName());
//		pmap.put("btype", "周边旅游");
//		nmap.put("btype", "周边旅游");
		int total = newsService.getCount(nmap);
		System.out.println("total===" + total);
		pageBean.setTotal(total);
		List<News> list = newsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		comMethod(map);
		return "news_list";
	}

	// 分页查询
	@RequestMapping("admin/newsList.do")
	public String goodList(@RequestParam(value = "page", required = false) String page, ModelMap map,
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
			Map<String, Object> nmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			pmap.put("btype", null);
			nmap.put("btype", null);
			int total = newsService.getCount(nmap);
			System.out.println("total===" + total);
			pageBean.setTotal(total);
			List<News> list = newsService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			session.setAttribute("p", 1);
			return "admin/news_list";

		}
	}

	// 分页模糊查询
	@RequestMapping("admin/vagueNewsList.do")
	public String vagueNewsList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		int total = newsService.getCount(null);
		pageBean.setTotal(total);
		List<News> list = newsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		return "admin/list_news";
	}

	@RequestMapping("admin/deleteNews.do")
	public String deleteNews(int id) {
		newsService.delete(id);
		return "redirect:newsList.do";
	}

	// 文件上传
	public String fileUpload(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, String img) {
		if(file == null) {
			return "";
		}
		String path = request.getSession().getServletContext().getRealPath("upload");
		System.out.println("path===" + path);
		System.out.println("file===" + file);
		String fileName = file.getOriginalFilename();
		System.out.println("fileName===" + fileName);
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
			img = null;
		}

		return img;

	}
}
