package com.controller;

import java.io.File;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.SysLog;
import com.server.SysLogServier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Sysuser;
import com.server.BtypeServer;
import com.server.SysuserServier;
import com.util.PageBean;
import net.sf.json.JSONObject;

@Controller
public class SysuserController {
	@Resource
	private SysuserServier userService;
	@Resource
	private BtypeServer btypeService;
    @Resource
    private SysLogServier sysLogService;

	@RequestMapping("flogin.do")
	public String login() {
		return "login";
	}

	// 处理用户充值
	@RequestMapping("doAddChongZhi.do")
	public String doAddChongZhi(ModelMap map, HttpSession session, Sysuser user) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		if (u == null) {
			return "login";
		} else {
		    map.put("user",userService.getById(u.getUid()));
			return "updateMoney";
		}
	}

	// 用户充值chongZhi.do
	@RequestMapping("chongZhi.do")
	public String chongZhi(ModelMap map, HttpSession session, Sysuser user) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		if (u == null) {
			return "login";
		} else {
			Sysuser uu = userService.getById(u.getUid());
			if (uu.getMoney()==null){
			    uu.setMoney(user.getMoney());
            }else {
                uu.setMoney(user.getMoney() + uu.getMoney());
            }
			uu.setUid(u.getUid());
			userService.update(uu);
			map.put("user", userService.getById(u.getUid()));
			return "redirect:showUserInfo2.do";
		}
	}
	
	//积分兑换
	@RequestMapping("duiHuan.do")
	public String duiHuan(ModelMap map, HttpSession session, Sysuser user) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		if (u == null) {
			return "login";
		} else {
			Sysuser uu = userService.getById(u.getUid());
			double jf = uu.getScope();
			
			if (uu.getMoney()==null){
			    uu.setMoney(jf/100);
				uu.setScope(jf%100);
            }else {
                uu.setMoney(uu.getMoney()+jf/100);
    			uu.setScope(jf%100);
            }
			userService.update(uu);
			map.put("user", userService.getById(u.getUid()));
			return "redirect:showUserInfo2.do";
		}
	}

	// 验证码是否正确
	@RequestMapping("admin/checkCode.do")
	public void checkCode(String code, HttpSession session, HttpServletResponse response) {
		System.out.println("code===" + code);
		JSONObject obj = new JSONObject();
		String imgcode = (String) session.getAttribute("autoCode");
		System.out.println("imgcode===" + imgcode);
		if (code.equalsIgnoreCase(imgcode)) {
			obj.put("res", "ok");
		} else {
			obj.put("res", "ng");
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	// 验证密保问题
	@RequestMapping("checkMiBao.do")
	public void checkMiBao(Sysuser user, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uname", user.getUname());
		System.out.println("uname===" + user.getUname());
		System.out.println("uname222===" + userService.checkUname(map));
		JSONObject obj = new JSONObject();
		if (userService.checkUname(map) != null) {
			Sysuser u = userService.checkUname(map);
			obj.put("info", "ok");
			obj.put("answer", u.getMbanswer());
			obj.put("question", u.getQuestion());
			obj.put("pwd", u.getPwd());
		} else {
			obj.put("info", "ng");

		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	// 验证码是否正确---前台的验证码
	@RequestMapping("checkCodeF.do")
	public void checkCodeF(String code, HttpSession session, HttpServletResponse response) {
		System.out.println("code===" + code);
		JSONObject obj = new JSONObject();
		String imgcode = (String) session.getAttribute("autoCode");
		System.out.println("imgcode===" + imgcode);
		if (code.equalsIgnoreCase(imgcode)) {
			obj.put("res", "ok");
		} else {
			obj.put("res", "ng");
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	// 处理修改个人信息
	@RequestMapping("admin/showUserInfo.do")
	public String showUserInfo(ModelMap map, HttpSession session) {
		if (session.getAttribute("auser") == null) {
			return "redirect:login.do";
		}
		Sysuser u = (Sysuser) session.getAttribute("auser");
		map.put("user", userService.getById(u.getUid()));
		return "admin/update_user_persion";
	}

	@RequestMapping("showUserInfo2.do")
	public String showUserInfo2(ModelMap map, HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		if (u == null) {
			return "redirect:login.do";
		}
		map.put("user", userService.getById(u.getUid()));
		map.put("tlist", btypeService.getAll(null));
		return "update_user_persion";
	}

	// 保存更新后的内容
	@RequestMapping("admin/updatePersionUser.do")
	public String updateUserInfo(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, ModelMap map, HttpSession session, Sysuser user) {
		img = fileUpload(file, request, img);
		if (img.equals("avatar.png")) {
			user.setImg("avatar.png");
		} else if (img == null || img.equals("")) {
			user.setImg("avatar.png");
		} else {
			user.setImg(img);
		}
		userService.update(user);
		map.put("user", userService.getById(user.getUid()));
		session.setAttribute("suc", "cc");
		return "redirect:showUserInfo.do";
	}

	@RequestMapping("updatePersionUser.do")
	public String updateUserInfo2(@RequestParam(value = "file", required = false) MultipartFile file, String img,
			HttpServletRequest request, ModelMap map, HttpSession session, Sysuser user) {
		img = fileUpload(file, request, img);
		user.setImg(img);
		userService.update(user);
		map.put("user", userService.getById(user.getUid()));
		session.setAttribute("suc", "cc");
		return "redirect:showUserInfo2.do";
	}

	// 前台登录
	@RequestMapping("login.do")
	public String checkAdminLogin(Sysuser user, HttpSession session) {
		Map<String, Object> u = new HashMap<String, Object>();
		System.out.println("name===" + user.getUname());
		u.put("uname", user.getUname());
		u.put("pwd", user.getPwd());
		u.put("utype", "会员");
		user = userService.adminLogin(u);
		if (user != null) {

			session.setAttribute("user", user);
			System.out.println("user=" + user);
			session.removeAttribute("suc");

            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            SysLog sysLog = new SysLog();
            sysLog.setBtype("前台登录");
            sysLog.setPubtime(timestamp.toString().substring(0,19));
            sysLog.setUid(user.getUid());
            sysLogService.add(sysLog);

			return "redirect:index.do";
		} else {
			session.setAttribute("suc", "登录失败！用户名或密码错误！");
			return "login";
		}

	}

	// 前台忘记密码
	@RequestMapping("forPwd.do")
	public String forPwd(Sysuser user, ModelMap map) {
		Map<String, Object> umap = new HashMap<String, Object>();
		umap.put("uname", user.getUname());
		Sysuser u = userService.checkUname(umap);
		if (u == null || u.equals("")) {
			return "error_uname";
		} else {
			map.put("user", u);
			return "fore_losspwd";
		}

	}

	@RequestMapping("admin/login.do")
	public String aLogin(ModelMap map) {
		map.put("tlist", btypeService.getAll(null));
		return "admin/login";
	}

	// 后台登录
	@RequestMapping("admin/alogin.do")
	public String checkLogin(Sysuser user, HttpSession session) {
		Map<String, Object> u = new HashMap<String, Object>();
		System.out.println("name===" + user.getUname());
		System.out.println("pwd===" + user.getPwd());
		System.out.println("utype===" + user.getUtype());
		u.put("uname", user.getUname());
		u.put("utype", user.getUtype());
		u.put("pwd", user.getPwd());
		user = userService.adminLogin(u);
		if (user != null) {
			session.setAttribute("auser", user);
			System.out.println("auser=" + user);

            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            SysLog sysLog = new SysLog();
            sysLog.setBtype("后台登录");
            sysLog.setPubtime(timestamp.toString().substring(0,19));
            sysLog.setUid(user.getUid());
            sysLogService.add(sysLog);
			return "admin/index2";
		} else {

			return "admin/login";
		}
	}

	// 后台注销登录
	@RequestMapping("admin/loginout.do")
	public String adminLoginOut(HttpSession session, ModelMap map) {

	    Sysuser sysuser = (Sysuser) session.getAttribute("auser");
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        SysLog sysLog = new SysLog();
        sysLog.setBtype("后台注销");
        sysLog.setPubtime(timestamp.toString().substring(0,19));
        sysLog.setUid(sysuser.getUid());
        sysLogService.add(sysLog);

		session.removeAttribute("auser");
		map.put("tlist", btypeService.getAll(null));


		return "redirect:login.do";
	}

	// 前台注销登录
	@RequestMapping("loginout.do")
	public String loginOut(HttpSession session) {
        Sysuser sysuser = (Sysuser) session.getAttribute("user");
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        SysLog sysLog = new SysLog();
        sysLog.setBtype("前台注销");
        sysLog.setPubtime(timestamp.toString().substring(0,19));
        sysLog.setUid(sysuser.getUid());
        sysLogService.add(sysLog);

		session.removeAttribute("user");
		session.removeAttribute("p");
		return "login";
	}

	// 验证用户名是否存在
	@RequestMapping("admin/checkUname.do")
	public void checkUname(Sysuser user, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();
		map.put("uname", user.getUname());
		System.out.println("uname===" + user.getUname());
		System.out.println("uname222===" + userService.checkUname(map));
		JSONObject obj = new JSONObject();
		if (userService.checkUname(map) != null) {

			obj.put("info", "ng");
		} else {
			obj.put("info", "用户名可以用！");

		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	@RequestMapping("checkmibao.do")
	public void checkMB(Sysuser user, HttpServletResponse response, HttpSession session) {
		JSONObject obj = new JSONObject();
		Sysuser u = userService.getById(user.getUid());
		String q = u.getQuestion();
		if (u == null || u.equals("")) {
			obj.put("info", "ng");
		} else {
			if (q.equals(user.getQuestion())) {
				obj.put("info", u.getPwd());
			} else {
				obj.put("info", "ng");
			}
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}

	}

	// 验证用户名是否存在
	@RequestMapping("checkUname.do")
	public void checkReg(Sysuser user, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();
		map.put("uname", user.getUname());
		System.out.println("uname===" + user.getUname());
		System.out.println("uname222===" + userService.checkUname(map));
		JSONObject obj = new JSONObject();
		if (userService.checkUname(map) != null) {
			System.out.println("uname233333333333===");
			obj.put("info", "ng");
		} else {
			System.out.println("uname255555555555555===");
			obj.put("info", "用户名可以用！");

		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	@RequestMapping("checkPass.do")
	public void checkPass(Sysuser user, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();
		map.put("uname", user.getUname());
		System.out.println("uname===" + user.getUname());
		System.out.println("uname222===" + userService.checkUname(map));
		JSONObject obj = new JSONObject();
		if (userService.checkUname(map) != null) {
			obj.put("info", userService.checkUname(map).getPwd());
		} else {
			obj.put("info", "ng");

		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	@RequestMapping("reg.do")
	public String reg(Sysuser user, HttpSession session) {
		user.setIsdel("1");
		user.setUtype("会员");
		user.setVtype("普通用户");
		user.setMoney(0.0);
		Timestamp time = new Timestamp(System.currentTimeMillis());
		user.setPubtime(time.toString().substring(0, 19));
		userService.add(user);
		return "login";
	}

	// 普通管理员用户注册
	@RequestMapping("admin/addReg.do")
	public String addReg(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request,
			Sysuser user, HttpSession session, String img) {
		user.setIsdel("1");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		user.setPubtime(time.toString().substring(0, 19));
		user.setStatus("待审核");
		img = fileUpload(file, request, img);
		if (img != null) {
			user.setImg(img);
		} else {
			user.setImg("zanwu.jpg");
		}
		user.setScope(0.0);
		userService.add(user);
		return "admin/login";
	}

	// 保存普通管理员信息的修改
	@RequestMapping("admin/updateUser_qy.do")
	public String updateUser_qy(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, Sysuser user, HttpSession session, String img) {
		Timestamp time = new Timestamp(System.currentTimeMillis());
		user.setPubtime(time.toString().substring(0, 19));
		img = fileUpload(file, request, img);
		if (img != null) {
			user.setImg(img);
		} else {
			user.setImg("zanwu.jpg");
		}
		userService.update(user);
		return "redirect:userList_qy.do";
	}

	// 添加普通管理员用户信息
	@RequestMapping("admin/addUser_qy.do")
	public String addUser_qy(Sysuser user, HttpSession session) {
		System.out.println("===添加普通管理员用户信息====");
		user.setIsdel("1");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		user.setPubtime(time.toString().substring(0, 19));
		user.setStatus("待审核");
		user.setScope(0.0);
		user.setUtype("普通管理员");
		userService.add(user);
		return "redirect:userList_qy.do";
	}

	// 添加用户
	@RequestMapping("admin/addUser.do")
	public String addUser(Sysuser user, HttpSession session) {
		user.setIsdel("1");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		user.setPubtime(time.toString());
		userService.add(user);
		return "redirect:userList.do";
	}

	// 高级管理员注册
	@RequestMapping("admin/addUser2.do")
	public String addUser2(Sysuser user, HttpSession session) {
		user.setIsdel("1");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		user.setPubtime(time.toString());
		userService.add(user);
		return "admin/login";
	}

	// 处理更新用户的信息
	@RequestMapping("admin/doUpdateUser.do")
	public String doUpdateUser(ModelMap map, int id) {
		System.out.println("id==" + id);
		map.put("user", userService.getById(id));
		return "admin/update_user";
	}

	@RequestMapping("admin/doUpdateUser_qy.do")
	public String doUpdateUser_qy(ModelMap map, int id) {
		System.out.println("id==" + id);
		map.put("user", userService.getById(id));
		Map<String, Object>  tmap = new HashMap<>();
		tmap.put("btype", "地区");
	    map.put("tlist", btypeService.getAll(tmap));
		return "admin/user_update_qy";
	}

	// 更新用户的信息
	@RequestMapping("admin/updateUser.do")
	public String updateUser(Sysuser user) {
		userService.update(user);
		return "redirect:userList.do";
	}

	// 普通管理员信息审核通过
	@RequestMapping("admin/user_shenHe_tongGuo.do")
	public String user_shenHe_tongGuo(Sysuser user, int id) {
		user = userService.getById(id);
		user.setStatus("通过审核");
		userService.update(user);
		return "redirect:userList_qy.do";
	}

	// 普通管理员信息审核不通过
	@RequestMapping("admin/user_shenHe_buTongGuo.do")
	public String user_shenHe_buTongGuo(Sysuser user, int id) {
		user = userService.getById(id);
		user.setStatus("审核失败");
		userService.update(user);
		return "redirect:userList_qy.do";
	}

	// 查看普通管理员的信息
	@RequestMapping("admin/user_detail.do")
	public String user_detail(ModelMap map, Sysuser user, int id) {
		user = userService.getById(id);
		map.put("user", user);
		return "admin/user_detail";
	}

	// 查询所有用户的信息
	@RequestMapping("admin/userList.do")
	public String userList(@RequestParam(value = "page", required = false) String page, HttpSession session,
			ModelMap map) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap = new HashMap<String, Object>();
		pmap.put("utype", "会员");
		cmap.put("utype", "会员");
		int total = userService.getCount(cmap);
		pageBean.setTotal(total);
		List<Sysuser> list = userService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "admin/user_list";
	}

	// 模糊查询并分页
	@RequestMapping("admin/userListQuery.do")
	public String useListQuery(@RequestParam(value = "page", required = false) String page, HttpSession session,
			ModelMap map, Sysuser user) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		pmap.put("uname", user.getUname());
		Map<String, Object> cmap = new HashMap<>();
		pmap.put("utype", "会员");
		cmap.put("utype", "会员");
		int total = userService.getCount(pmap);
		pageBean.setTotal(total);
		List<Sysuser> list = userService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		return "admin/user_list";
	}

	// 查询所有普通管理员的信息
	@RequestMapping("admin/userList_qy.do")
	public String userList_qy(@RequestParam(value = "page", required = false) String page, HttpSession session,
			ModelMap map) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap = new HashMap<String, Object>();
		pmap.put("utype", "普通管理员");
		cmap.put("utype", "普通管理员");
		int total = userService.getCount(cmap);
		pageBean.setTotal(total);
		List<Sysuser> list = userService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		Map<String, Object>  tmap = new HashMap<>();
		tmap.put("btype", "地区");
	    map.put("tlist", btypeService.getAll(tmap));

		return "admin/user_list_qy";
	}

	// 模糊查询并分页--普通管理员信息
	@RequestMapping("admin/userList_qyQuery.do")
	public String userList_qyQuery(@RequestParam(value = "page", required = false) String page, HttpSession session,
			ModelMap map, Sysuser user) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		pmap.put("uname", user.getUname());
		Map<String, Object> cmap = new HashMap<>();
		pmap.put("utype", "普通管理员");
		cmap.put("utype", "普通管理员");
		if (user.getStatus() != null && !user.getStatus().equals("")) {
			pmap.put("status", user.getStatus());
			cmap.put("status", user.getStatus());
		}
		if (user.getUname() != null && !user.getUname().equals("")) {
			pmap.put("uname", user.getUname());
			cmap.put("uname", user.getUname());
		} 
		if (user.getQname() != null && !user.getQname().equals("")) {
			pmap.put("qname", user.getQname());
			cmap.put("qname", user.getQname());
		} 
		if (user.getTname() != null && !user.getTname().equals("")) {
			pmap.put("tname", user.getTname());
			cmap.put("tname", user.getTname());
		}
		int total = userService.getCount(cmap);
		pageBean.setTotal(total);
		List<Sysuser> list = userService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		Map<String, Object>  tmap = new HashMap<>();
		tmap.put("btype", "地区");
	    map.put("tlist", btypeService.getAll(tmap));
		return "admin/user_list_qy";
	}

	@RequestMapping("admin/deleteUser.do")
	public String deleteUser(int id) {
		userService.delete(id);
		return "redirect:userList.do";
	}

	@RequestMapping("admin/deleteUser_qy.do")
	public String deleteUser_qy(int id) {
		Sysuser user = userService.getById(id);
		user.setIsdel("0");
		userService.update(user);
		return "redirect:userList_qy.do";
	}
	@RequestMapping("admin/deleteUser_hf.do")
	public String deleteUser_hf(int id) {
		Sysuser user = userService.getById(id);
		user.setIsdel("1");
		userService.update(user);
		return "redirect:userList_qy.do";
	}

	

	// 文件上传
	public String fileUpload(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, String img) {
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
			img = "avatar.png";
		}

		return img;

	}
}
