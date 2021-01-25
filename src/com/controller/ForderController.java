package com.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFHeader;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Forder;
import com.entity.Goods;
import com.entity.House;
import com.entity.Sysuser;
import com.entity.TongJi;
import com.server.BtypeServer;
import com.server.ForderServer;
import com.server.GoodsServer;
import com.server.HouseServer;
import com.server.SysuserServier;
import com.util.Info;
import com.util.PageBean;

import net.sf.json.JSONObject;

@Controller
public class ForderController {
	@Resource
	private ForderServer forderService;
	@Resource
	private HouseServer houseService;
	@Resource
	private BtypeServer btypeService;
	@Resource
	private SysuserServier sysuserService;
	@Resource
	private GoodsServer goodsService;

	public void comMethod(ModelMap map, String btype) {
		Map<String, Object> tttmap = new HashMap<>();
		tttmap.put("btype", btype);
		if (btype.equals("地区")) {
			map.put("dlist", btypeService.getAll(tttmap));
		} else {
			map.put("tlist", btypeService.getAll(tttmap));
		}
		map.put("ttlist", btypeService.getAll(null));
	}

	/**
	 * 添加订单信息并验证
	 *
	 * @param forder
	 * @param session
	 * @return
	 */

	@RequestMapping("addForder.do")
	public String addForder(Forder forder, HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		session.setAttribute("fid", forder.getFid());
		String stime = forder.getStime();
		String etime = forder.getEtime();
		if (u == null) {
			return "login";
		} else {
			// 验证选择的时间是否正确
			String str = Info.compare_datezq(time.toString(), stime);
			String str2 = Info.compare_datezq(stime, etime);
			if (str.equals("big")) {
				return "error_time1";
			} else if (str2.equals("big")) {
				return "error_time2";
			} else {

				forder.setUid(u.getUid());
				forder.setPubtime(time.toString().substring(0, 19));
				forder.setStatus("待支付");
				forder.setIsdel("购物车");
				if (forder.getBtype().equals("1")) {
					House house = houseService.getById(forder.getFid());
					int num = Info.dayToday(forder.getStime(), forder.getEtime());
					forder.setDay(num + "");
					Double zprice = house.getPrice() * num;
					forder.setZprice(zprice);
					house.setId(forder.getFid());
					house.setFjnum(house.getFjnum() - 1);
					if (house.getFjnum() <= 0) {
						house.setStatus("已预订");
					}
					forder.setTid(house.getBid());
					forder.setQid(house.getUid());
					if (house.getOnum() != null) {
						house.setOnum(house.getOnum() + 1);
					} else {
						house.setOnum(1);
					}
					houseService.update(house);
				} else {
					Goods goods = goodsService.getById(forder.getFid());
					forder.setDay(1 + "");
					forder.setZprice(goods.getPrice());
					if (goods.getXnum() == null) {
						goods.setXnum(1);
					} else {
						goods.setXnum(goods.getXnum() + 1);
					}
					forder.setDay(1 + "");
					goodsService.update(goods);
				}
				forder.setOno(Info.getID());

				forderService.add(forder);
				if (forder.getBtype().equals("1")) {
					return "redirect:forderList.do";
				} else {
					return "redirect:forderList_cp.do";
				}
			}
		}
	}

	// 分页查询----评价
	@RequestMapping("myOrderList_pj.do")
	public String myOrderList_pj(@RequestParam(value = "page", required = false) String page, ModelMap map,
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
			Map<String, Object> cmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			cmap.put("status", "评价");
			pmap.put("status", "评价");
			cmap.put("isdel", "订单");
			pmap.put("isdel", "订单");
			cmap.put("uid", user.getUid());
			pmap.put("uid", user.getUid());
			int total = forderService.getCount(cmap);
			pageBean.setTotal(total);
			List<Forder> list = forderService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("hlist", houseService.getAll(null));
			map.put("glist", goodsService.getAll(null));
			comMethod(map, "地区");
			comMethod(map, "类别");
			map.put("ulist", sysuserService.getAll(null));
			session.setAttribute("p", 1);
			return "order_list_pj";
		}
	}

	// 用户处理评价
	@RequestMapping("doUserOrderPj.do")
	public String doUserOrderPj(ModelMap map, int id) {
		Forder forder = forderService.getById(id);
		if (forder.getBtype().equals("1")) {
			House house = houseService.getById(forder.getFid());
			map.put("house", house);
		} else {
			Goods goods = goodsService.getById(forder.getFid());
			map.put("house", goods);
		}

		map.put("order", forder);

		return "order_pj";
	}

	// 处理修改评价
	@RequestMapping("doUpdatePj.do")
	public String doUpdatePj(ModelMap map, int id) {
		Forder forder = forderService.getById(id);
		House house = houseService.getById(forder.getFid());
		map.put("order", forder);
		map.put("house", house);
		return "order_update_pj";
	}

	// 用户保存更新评价
	@RequestMapping("updateUserOrderPj.do")
	public String updateUserOrderPj(ModelMap map, Forder order) {
		Forder forder = forderService.getById(order.getId());
		Sysuser user = sysuserService.getById(forder.getQid());
		Double scope = 0.0;
		Timestamp time = new Timestamp(System.currentTimeMillis());
		order.setPjtime(time.toString().substring(0, 19));
		forderService.update(order);
		Map<String, Object> pmap = new HashMap<>();
		pmap.put("qid", forder.getQid());
		pmap.put("status", "已评价");
		List<Forder> flist = forderService.getAll(pmap);
		int count = forderService.getCount(pmap);
		Double sum = 0.0;
		for (Forder o : flist) {
			sum += Double.parseDouble(o.getScope());
		}
		scope = sum / count;
		user.setScope(scope);
		sysuserService.update(user);
		return "redirect:myOrderList_pj.do";
	}

	// 用户处理评价
	@RequestMapping("addUserOrderPj.do")
	public String addUserOrderPj(ModelMap map, Forder order) {
		Timestamp time = new Timestamp(System.currentTimeMillis());
		order.setPjtime(time.toString().substring(0, 19));
		order.setStatus("已评价");
		forderService.update(order);
		return "redirect:myOrderList_pj.do";
	}

	// 退房tuiFang
	@RequestMapping("tuiFang0.do")
	public String tuiFang0(ModelMap map, int id) {
		Forder forder = forderService.getById(id);
		forder.setStatus("待确认退房");
		forderService.update(forder);
		comMethod(map, "地区");
		comMethod(map, "类别");
		return "redirect:myOrderList.do";
	}

	// 用户支付订单
	@RequestMapping("order_zhiFu.do")
	public String order_zhiFu(ModelMap map, int id, HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			Forder forder = forderService.getById(id);
			user = sysuserService.getById(user.getUid());
			if (user.getMoney() == null) {
				return "redirect:doAddChongZhi.do";
			} else if (user.getMoney() < forder.getZprice()) {
				return "redirect:doAddChongZhi.do";
			} else {
				forder.setStatus("已支付，待确认");
				user.setMoney(user.getMoney() - forder.getZprice());
				forder.setIsdel("订单");
				forderService.update(forder);
				comMethod(map, "地区");
				comMethod(map, "类别");
				return "redirect:myOrderList.do";
			}
		}
	}

	@RequestMapping("order_zhiFu_all.do")
	public String order_zhiFu_all(ModelMap map, HttpSession session, Forder forder1) {
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {

			Map<String, Object> tmap = new HashMap<>();
			tmap.put("uid", user.getUid());
			tmap.put("isdel", "购物车");
			tmap.put("btype", "1");
			List<Forder> flist = forderService.getAll(tmap);
			double zprice = 0.0;
			for (Forder forder : flist) {
				zprice += forder.getZprice();
			}
			zprice = forder1.getZprice();
			user = sysuserService.getById(user.getUid());
			int dnum = 0;
			if (user.getMoney() == null) {
				return "redirect:doAddChongZhi.do";
			} else if (user.getMoney() < zprice) {
				return "redirect:doAddChongZhi.do";
			} else {
				if (flist.size() > 0) {
					for (Forder forder : flist) {
						forder.setStatus("已支付，待确认");
						forder.setIsdel("订单");
						forderService.update(forder);
					}
				}
				dnum = flist.size();
				user.setMoney(user.getMoney() - zprice);
				if (user.getScope() == null) {
					user.setScope(zprice);
				} else {
					user.setScope(user.getScope() + zprice);

				}
				if (user.getDnum() == null) {
					user.setDnum(dnum);
				} else {
					user.setDnum(user.getDnum() + dnum);
				}
				sysuserService.update(user);
				user = sysuserService.getById(user.getUid());
				if (user.getDnum() > 50) {
					user.setVtype("VIP5");
				} else if (40 < user.getDnum() && user.getDnum() <= 50) {
					user.setVtype("VIP4");
				} else if (30 < user.getDnum() && user.getDnum() <= 40) {
					user.setVtype("VIP3");
				} else if (20 < user.getDnum() && user.getDnum() <= 30) {
					user.setVtype("VIP2");
				} else if (10 < user.getDnum() && user.getDnum() <= 20) {
					user.setVtype("VIP1");
				} else {
					user.setVtype("普通用户");
				}
				sysuserService.update(user);
				comMethod(map, "地区");
				comMethod(map, "类别");
				return "redirect:myOrderList.do";

			}

		}
	}
	/* 通用计算 */

	public void commdOrder() {
		Timestamp time = new Timestamp(System.currentTimeMillis());
		Map<String, Object> fmap = new HashMap<>();
		Map<String, Object> fmap2 = new HashMap<>();
		fmap.put("status", "成功订单");
		fmap.put("isdel", "订单");
		fmap.put("btype", "1");
		fmap2.put("isdel", "订单");
		fmap2.put("status", "已住");
        fmap2.put("btype", "1");
		List<Forder> flist = forderService.getAll(fmap);
		List<Forder> flist2 = forderService.getAll(fmap2);
		for (Forder ff : flist) {
			String ctime = Info.compare_datezq(time.toString(), ff.getStime());
			if (ctime.equals("den") || ctime.equals("big")) {
				ff.setStatus("已住");
				ff.setId(ff.getId());
				forderService.update(ff);
			}
		}
		for (Forder ff : flist2) {
			String ctime = Info.compare_datezq(time.toString(), ff.getEtime());
			if (ctime.equals("big")) {
				ff.setStatus("待退房");
				ff.setId(ff.getId());
				House h = houseService.getById(ff.getFid());
				h.setStatus("可用房间");
				h.setId(ff.getFid());
				// houseService.update(h);
				forderService.update(ff);
			}
		}
	}

	// 购物车
	@RequestMapping("forderList.do")
	public String forderList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");

		if (u == null) {
			return "login";
		} else {
			Map<String, Object> pmap = new HashMap<String, Object>();
			pmap.put("isdel", "购物车");
			pmap.put("uid", u.getUid());
			pmap.put("btype", "1");
			List<Forder> list = forderService.getAll(pmap);
			map.put("list", list);
			map.put("hlist", houseService.getAll(null));
			map.put("glist", goodsService.getAll(null));
			comMethod(map, "地区");
			comMethod(map, "类别");
			map.put("user", sysuserService.getById(u.getUid()));
			map.put("ulist", sysuserService.getAll(null));
			session.setAttribute("p", 1);
			return "order_list";
		}
	}

	// 用户取消订单
	@RequestMapping("order_quXiao.do")
	public String order_quXiao(ModelMap map, int id, HttpSession session) {
		Forder forder = forderService.getById(id);
		Sysuser sysuser = sysuserService.getById(forder.getUid());
		House house = houseService.getById(forder.getFid());
		house.setFjnum(house.getFjnum() + 1);
		if (house.getStatus().equals("已预定")) {
			house.setStatus("可用房间");
		}
		sysuser.setDnum(sysuser.getDnum() - 1);
		houseService.update(house);
		sysuserService.update(sysuser);
		forder.setStatus("已取消");
		forderService.update(forder);
		return "redirect:myOrderList.do";
	}

	/* 用户取消预定 */
	@RequestMapping("order_quXiao2.do")
	public String order_quXiao2(ModelMap map, int id, HttpSession session) {
		Forder forder = forderService.getById(id);
		Timestamp time = new Timestamp(System.currentTimeMillis());
		Sysuser sysuser = sysuserService.getById(forder.getUid());
		int day = Info.dayToday(time.toString(), forder.getStime());
		System.out.println("day==" + day);
		if (day > 15) {
			if (sysuser.getMoney() == null) {
				sysuser.setMoney(forder.getZprice());
			} else {
				sysuser.setMoney(sysuser.getMoney() + forder.getZprice());
			}

		} else if (10 < day && day <= 15) {
			if (sysuser.getMoney() == null) {
				sysuser.setMoney(forder.getZprice() * 0.98);
			} else {
				sysuser.setMoney(sysuser.getMoney() + forder.getZprice() * 0.98);
			}
		} else if (5 < day && day <= 10) {
			if (sysuser.getMoney() == null) {
				sysuser.setMoney(forder.getZprice() * 0.95);
			} else {
				sysuser.setMoney(sysuser.getMoney() + forder.getZprice() * 0.95);
			}
		} else if (0 <= day && day <= 5) {
			if (sysuser.getMoney() == null) {
				sysuser.setMoney(forder.getZprice() * 0.90);
			} else {
				sysuser.setMoney(sysuser.getMoney() + forder.getZprice() * 0.90);
			}
		}
		House house = houseService.getById(forder.getFid());
		house.setFjnum(house.getFjnum() + 1);
		if (house.getFjnum() > 0) {
			house.setStatus("可用房间");
		}
		sysuser.setDnum(sysuser.getDnum() - 1);
		sysuser.setScope(sysuser.getScope() - forder.getZprice());
		houseService.update(house);
		sysuserService.update(sysuser);
		forder.setStatus("已取消，已退款");
		forderService.update(forder);
		return "redirect:myOrderList.do";
	}

	@RequestMapping("myOrderList.do")
	public String orderList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		if (u == null) {
			return "login";
		} else {
			commdOrder();
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			Map<String, Object> umap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			pmap.put("uid", u.getUid());
			umap.put("uid", u.getUid());
			pmap.put("isdel", "订单");
			umap.put("isdel", "订单");
			pmap.put("btype", "1");
			umap.put("btype", "1");
			int total = forderService.getCount(umap);
			pageBean.setTotal(total);
			List<Forder> list = forderService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("hlist", houseService.getAll(null));
			comMethod(map, "地区");
			comMethod(map, "类别");
			map.put("ulist", sysuserService.getAll(null));
			session.setAttribute("p", 1);
			return "myOrderlist";
		}
	}

	// 菜品信息

	// 购物车
	@RequestMapping("forderList_cp.do")
	public String forderList_cp(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");

		if (u == null) {
			return "login";
		} else {
			Map<String, Object> pmap = new HashMap<String, Object>();
			pmap.put("isdel", "购物车");
			pmap.put("uid", u.getUid());
			pmap.put("btype", "2");
			List<Forder> list = forderService.getAll(pmap);
			map.put("list", list);
			map.put("hlist", houseService.getAll(null));
			map.put("glist", goodsService.getAll(null));
			comMethod(map, "地区");
			comMethod(map, "类别");
			map.put("user", sysuserService.getById(u.getUid()));
			map.put("ulist", sysuserService.getAll(null));
			session.setAttribute("p", 1);
			return "order_list_cp";
		}
	}

	@RequestMapping("order_zhiFu_all_cp.do")
	public String order_zhiFu_all_cp(ModelMap map, HttpSession session, Forder forder1) {
		Sysuser user = (Sysuser) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			Map<String, Object> tmap = new HashMap<>();
			tmap.put("uid", user.getUid());
			tmap.put("isdel", "购物车");
			tmap.put("btype", "2");
			List<Forder> flist = forderService.getAll(tmap);
			double zprice = 0.0;
			for (Forder forder : flist) {
				zprice += forder.getZprice();
			}
			int dnum = 0;
			user = sysuserService.getById(user.getUid());
			if (user.getMoney() == null) {
				return "redirect:doAddChongZhi.do";
			} else if (user.getMoney() < zprice) {
				return "redirect:doAddChongZhi.do";
			} else {
				if (flist.size() > 0) {
					for (Forder forder : flist) {
						forder.setStatus("已支付，待确认");
						forder.setIsdel("订单");
						forderService.update(forder);
					}
				}
				zprice = forder1.getZprice();
				dnum = flist.size();
				user.setMoney(user.getMoney() - zprice);
				if (user.getScope() == null) {
					user.setScope(zprice);
				} else {
					user.setScope(user.getScope() + zprice);

				}
				/*
				 * if (user.getDnum() == null) { user.setDnum(dnum); } else {
				 * user.setDnum(user.getDnum() + dnum); }
				 */
				sysuserService.update(user);
				/*
				 * user = sysuserService.getById(user.getUid()); if (user.getDnum() > 50) {
				 * user.setVtype("VIP5"); } else if (40 < user.getDnum() && user.getDnum() <=
				 * 50) { user.setVtype("VIP4"); } else if (30 < user.getDnum() && user.getDnum()
				 * <= 40) { user.setVtype("VIP3"); } else if (20 < user.getDnum() &&
				 * user.getDnum() <= 30) { user.setVtype("VIP2"); } else if (10 < user.getDnum()
				 * && user.getDnum() <= 20) { user.setVtype("VIP1"); } else {
				 * user.setVtype("普通用户"); }
				 */
				sysuserService.update(user);
				comMethod(map, "地区");
				comMethod(map, "类别");
				return "redirect:myOrderList_cp.do";

			}

		}
	}

	// 用户取消订单
	@RequestMapping("order_quXiao_cp.do")
	public String order_quXiao_cp(ModelMap map, int id, HttpSession session) {
		Forder forder = forderService.getById(id);
		Sysuser sysuser = sysuserService.getById(forder.getUid());
		Goods goods = goodsService.getById(forder.getFid());
		// sysuser.setDnum(sysuser.getDnum()-1);
        if (goods.getXnum()!=null){
            goods.setXnum(goods.getXnum() - 1);
        }else {
            goods.setXnum(0);
        }
		goodsService.update(goods);
		sysuserService.update(sysuser);
		forder.setStatus("已取消");
		forderService.delete(id);
		return "redirect:forderList_cp.do";
	}

	@RequestMapping("myOrderList_cp.do")
	public String myOrderList_cp(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		if (u == null) {
			return "login";
		} else {
			commdOrder();
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			Map<String, Object> umap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			pmap.put("uid", u.getUid());
			umap.put("uid", u.getUid());
			pmap.put("isdel", "订单");
			umap.put("isdel", "订单");
			pmap.put("btype", "2");
			umap.put("btype", "2");
			int total = forderService.getCount(umap);
			pageBean.setTotal(total);
			List<Forder> list = forderService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("glist", goodsService.getAll(null));
			comMethod(map, "地区");
			comMethod(map, "类别");
			map.put("ulist", sysuserService.getAll(null));
			session.setAttribute("p", 1);
			return "myOrderlist_cp";
		}
	}

	/**
	 * ===后台订单管理==
	 */
	// 出房
	@RequestMapping("admin/order_admin_chuFang.do")
	public String order_admin_chuFang(ModelMap map, int id) {
		Forder forder = forderService.getById(id);
		forder.setStatus("成功订单");
		forderService.update(forder);
		return "redirect:orderList.do";
	}

	// 菜品
	@RequestMapping("admin/order_admin_chuFang_cp.do")
	public String order_admin_chuFang_cp(ModelMap map, int id) {
		Forder forder = forderService.getById(id);
		forder.setStatus("成功订单");
		forderService.update(forder);
		return "redirect:orderList_cp.do";
	}

	// 普通管理员确认订单
	@RequestMapping("admin/order_admin_tongYi.do")
	public String order_admin_tongYi(ModelMap map, int id) {
		Forder forder = forderService.getById(id);
		forder.setStatus("订单确认，待支付");
		forderService.update(forder);
		return "redirect:orderList.do";
	}

	// 确认退房tuiFang1
	@RequestMapping("admin/tuiFang.do")
	public String tuiFang(ModelMap map, int id) {
		Timestamp time = new Timestamp(System.currentTimeMillis());
		Forder forder = forderService.getById(id);
		Sysuser user = sysuserService.getById(forder.getUid());
		House house = houseService.getById(forder.getFid());
		int num = Info.dayToday(forder.getStime(), time.toString());
		if (num == 0) {
			forder.setDay(1 + "");
			num = num + 1;
		} else {
			forder.setDay(num + "");
		}
		forder.setEtime(time.toString().substring(0, 19));
		double zprice = house.getPrice() * num;
		forder.setZprice(zprice);
		user.setMoney(user.getMoney() + forder.getZprice() - zprice);
		forder.setStatus("待评价");
		house.setStatus("可用房间");
		houseService.update(house);
		forderService.update(forder);
		sysuserService.update(user);
		comMethod(map, "地区");
		comMethod(map, "类别");
		return "redirect:orderList.do";
	}

	// 分页查询--后台订单查询
	@RequestMapping("admin/orderList.do")
	public String goodList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("auser");
		if (user == null) {
			return "admin/login";
		} else {

			commdOrder();

			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			Map<String, Object> cmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			if (user.getUtype().equals("普通管理员")) {
				cmap.put("qid", user.getUid());
				pmap.put("qid", user.getUid());
			}
			cmap.put("btype", "1");
			pmap.put("btype", "1");
			int total = forderService.getCount(cmap);
			pageBean.setTotal(total);
			List<Forder> list = forderService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("hlist", houseService.getAll(null));
			comMethod(map, "地区");
			comMethod(map, "类别");
			map.put("ulist", sysuserService.getAll(null));
			session.setAttribute("p", 1);
			return "admin/order_list";
		}
	}

	// 分页查询--后台订单查询---菜品==
	@RequestMapping("admin/orderList_cp.do")
	public String orderList_cp(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("auser");
		if (user == null) {
			return "admin/login";
		} else {

			commdOrder();

			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			Map<String, Object> cmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			if (user.getUtype().equals("普通管理员")) {
				cmap.put("qid", user.getUid());
				pmap.put("qid", user.getUid());
			}
			cmap.put("btype", "2");
			pmap.put("btype", "2");
			int total = forderService.getCount(cmap);
			pageBean.setTotal(total);
			List<Forder> list = forderService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("hlist", goodsService.getAll(null));
			comMethod(map, "地区");
			comMethod(map, "类别");
			map.put("ulist", sysuserService.getAll(null));
			session.setAttribute("p", 1);
			return "admin/order_list_cp";
		}
	}

	// 普通管理员处理回复评价
	@RequestMapping("admin/doAddOrderPj.do")
	public String doAddOrderPj(ModelMap map, int id) {
		Forder forder = forderService.getById(id);

		map.put("order", forder);
		if(forder.getBtype().equals("1")){
            House house = houseService.getById(forder.getFid());
            map.put("house", house);
        }else {
            Goods goods = goodsService.getById(forder.getFid());
            map.put("house", goods);
        }
		return "admin/order_pj";
	}

	// 普通管理员添加回复评价
	@RequestMapping("admin/addOrderHuiFu.do")
	public String addOrderHuiFu(ModelMap map, Forder order) {
		order.setStatus("已评价已回复");
        Forder forder = forderService.getById(order.getId());
		forderService.update(order);
		if (forder.getBtype().equals("1")){
            return "redirect:orderList.do";
        }else {
            return "redirect:orderList_cp.do";
        }

	}

	// 分页查询--后台订单查询--评价
	@RequestMapping("admin/orderList_pj.do")
	public String orderList_pj(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("auser");
		if (user == null) {
			return "admin/login";
		} else {
			commdOrder();
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			Map<String, Object> cmap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			if (user.getUtype().equals("普通管理员")) {
				cmap.put("qid", user.getUid());
				pmap.put("qid", user.getUid());
			}
			cmap.put("status", "已评价");
			pmap.put("status", "已评价");
			int total = forderService.getCount(cmap);
			pageBean.setTotal(total);
			List<Forder> list = forderService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("hlist", houseService.getAll(null));
			comMethod(map, "地区");
			comMethod(map, "类别");
			map.put("ulist", sysuserService.getAll(null));
			session.setAttribute("p", 1);
			return "admin/order_list_pj";
		}
	}

	// selectForderList.do
	// 分页查询--后台订单查询--按条件查询
	@RequestMapping("admin/selectForderList.do")
	public String selectForderList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Forder forder, String stime1, String etime1) {
		commdOrder();
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		Map<String, Object> smap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		if (forder.getOno() != null && !forder.getOno().equals("")) {
			pmap.put("ono", forder.getOno());
			smap.put("ono", forder.getOno());
		}
		if (forder.getStatus() != null && !forder.getStatus().equals("")) {
			pmap.put("status", forder.getStatus());
			smap.put("status", forder.getStatus());
		}
		if (stime1 != null && !stime1.equals("") && etime1 != null && !etime1.equals("")) {
			pmap.put("stime1", stime1);
			pmap.put("etime1", etime1);
			smap.put("stime1", stime1);
			smap.put("etime1", etime1);
		}
		pmap.put("btype", "1");
		smap.put("btype", "1");
		int total = forderService.getCount(smap);
		pageBean.setTotal(total);
		List<Forder> list = forderService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("hlist", houseService.getAll(null));
		comMethod(map, "地区");
		comMethod(map, "类别");
		map.put("ulist", sysuserService.getAll(null));
		session.setAttribute("p", 2);
		return "admin/order_list";
	}

	@RequestMapping("admin/selectForderList_cp.do")
	public String selectForderList_cp(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Forder forder, String stime1, String etime1) {
		commdOrder();
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		Map<String, Object> smap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		if (forder.getOno() != null && !forder.getOno().equals("")) {
			pmap.put("ono", forder.getOno());
			smap.put("ono", forder.getOno());
		}
		if (forder.getStatus() != null && !forder.getStatus().equals("")) {
			pmap.put("status", forder.getStatus());
			smap.put("status", forder.getStatus());
		}
		if (stime1 != null && !stime1.equals("") && etime1 != null && !etime1.equals("")) {
			pmap.put("stime1", stime1);
			pmap.put("etime1", etime1);
			smap.put("stime1", stime1);
			smap.put("etime1", etime1);
		}
		pmap.put("btype", "2");
		smap.put("btype", "2");
		int total = forderService.getCount(smap);
		pageBean.setTotal(total);
		List<Forder> list = forderService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		map.put("hlist", goodsService.getAll(null));
		comMethod(map, "地区");
		comMethod(map, "类别");
		map.put("ulist", sysuserService.getAll(null));
		session.setAttribute("p", 2);
		return "admin/order_list_cp";
	}

	@RequestMapping("admin/deleteForder.do")
	public String deleteForder(int id) {
		forderService.delete(id);
		return "redirect:forderList.do";
	}

	/**
	 * ===导出===
	 *
	 * @param
	 * @param
	 * @param
	 * @return
	 */

	@RequestMapping("admin/exportForder.do")
	public String exportForder(HttpServletResponse response) throws Exception {
		List<Forder> forderList = new ArrayList<>();
		House house = new House();
		Sysuser user = new Sysuser();
		Map<String, Object> lmap = new HashMap<String, Object>();
		lmap.put("status", null);
		forderList = forderService.getAll(lmap);
		for (Forder l : forderList) {
			System.out.println("lid===" + l.getId());
		}
		/*
		 * 设置表头：对Excel每列取名 (必须根据你取的数据编写)
		 */
		String[] tableHeader = { "序号", "编号", "下单人", "发布人", "电话", "身份证号", "房间名称", "下单时间", "预订时间", "到期时间", "总价", "人数",
				"天数" };
		/*
		 * 下面的都可以拷贝不用编写
		 */
		short cellNumber = (short) tableHeader.length;// 表的列数
		HSSFWorkbook workbook = new HSSFWorkbook(); // 创建一个excel
		HSSFCell cell = null; // Excel的列
		HSSFRow row = null; // Excel的行
		HSSFCellStyle style = workbook.createCellStyle(); // 设置表头的类型
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		HSSFCellStyle style1 = workbook.createCellStyle(); // 设置数据类型
		style1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		HSSFFont font = workbook.createFont(); // 设置字体
		HSSFSheet sheet = workbook.createSheet("sheet1"); // 创建一个sheet
		HSSFHeader header = sheet.getHeader();// 设置sheet的头
		try { /**
				 * 根据是否取出数据，设置header信息
				 *
				 */
			if (forderList.size() < 1) {
				header.setCenter("查无数据");
			} else {
				header.setCenter("订单信息表");
				row = sheet.createRow(0);
				row.setHeight((short) 400);
				for (int k = 0; k < cellNumber; k++) {
					cell = row.createCell(k);// 创建第0行第k列
					cell.setCellValue(tableHeader[k]);// 设置第0行第k列的值
					sheet.setColumnWidth(k, 8000);// 设置列的宽度
					font.setColor(HSSFFont.COLOR_NORMAL); // 设置单元格字体的颜色.
					font.setFontHeight((short) 350); // 设置单元字体高度
					style1.setFont(font);// 设置字体风格
					cell.setCellStyle(style1);
				}
				/*
				 * // 给excel填充数据这里需要编写
				 *
				 */
				for (int i = 0; i < forderList.size(); i++) {
					Forder sign = (Forder) forderList.get(i);// 获取sign对象
					row = sheet.createRow((short) (i + 1));// 创建第i+1行
					row.setHeight((short) 400);// 设置行高
					if (sign.getOno() != null) {
						cell = row.createCell(0);// 创建第i+1行第0列
						cell.setCellValue(i + 1);// 设置第i+1行第0列的值
						cell.setCellStyle(style);// 设置风格
					} else {
						cell = row.createCell(0);// 创建第i+1行第0列
						cell.setCellValue("");// 设置第i+1行第0列的值
						cell.setCellStyle(style);// 设置风格
					}

					if (sign.getOno() != null) {
						cell = row.createCell(1);// 创建第i+1行第0列
						cell.setCellValue(sign.getOno());// 设置第i+1行第0列的值
						cell.setCellStyle(style);// 设置风格
					} else {
						cell = row.createCell(1);// 创建第i+1行第0列
						cell.setCellValue("");// 设置第i+1行第0列的值
						cell.setCellStyle(style);// 设置风格
					}
					/* 下单人 */
					if (sign.getUid() != null) {
						user = sysuserService.getById(sign.getUid());
						if (user != null && user.getTname() != null) {
							cell = row.createCell(2); // 创建第i+1行第1列
							cell.setCellValue(user.getTname());// 设置第i+1行第1列的值
							cell.setCellStyle(style); // 设置风格
						} else {
							cell = row.createCell(2);// 创建第i+1行第1列
							cell.setCellValue("");// 设置第i+1行第1列的值
							cell.setCellStyle(style);// 设置风格
						}
					}
					//
					if (sign.getQid() != null) {
						user = sysuserService.getById(sign.getQid());
						if (user != null && user.getTname() != null) {
							cell = row.createCell(3);
							cell.setCellValue(user.getTname());
							cell.setCellStyle(style);
						} else {
							cell = row.createCell(3);
							cell.setCellValue("");
							cell.setCellStyle(style);// 设置风格
						}

					}

					if (sign.getUid() != null) {
						user = sysuserService.getById(sign.getUid());
						if (user != null && user.getTel() != null) {
							cell = row.createCell(4);
							user = sysuserService.getById(sign.getUid());
							cell.setCellValue(user.getTel());
							cell.setCellStyle(style);
						} else {
							cell = row.createCell(4);
							cell.setCellValue("");
							cell.setCellStyle(style);
						}

						if (user != null && user.getIdnumber() != null) {
							cell = row.createCell(5);
							cell.setCellValue(user.getIdnumber());
							cell.setCellStyle(style);
						} else {
							cell = row.createCell(5);
							cell.setCellValue("");
							cell.setCellStyle(style);
						}

					}
					if (sign.getFid() != null) {
						house = houseService.getById(sign.getFid());

						if (house != null && house.getName() != null) {
							cell = row.createCell(6);
							cell.setCellValue(house.getName());
							cell.setCellStyle(style);
						} else {
							cell = row.createCell(6);
							cell.setCellValue("");
							cell.setCellStyle(style);
						}
					}

					if (sign.getPubtime() != null) {
						cell = row.createCell(7);
						cell.setCellValue(sign.getPubtime());
						cell.setCellStyle(style);
					} else {
						cell = row.createCell(7);
						cell.setCellValue("");
						cell.setCellStyle(style);
					}

					if (sign.getStime() != null) {
						cell = row.createCell(8);
						cell.setCellValue(sign.getStime());
						cell.setCellStyle(style);
					} else {
						cell = row.createCell(8);
						cell.setCellValue("");
						cell.setCellStyle(style);
					}

					if (sign.getEtime() != null) {
						cell = row.createCell(9);
						cell.setCellValue(sign.getEtime());
						cell.setCellStyle(style);
					} else {
						cell = row.createCell(9);
						cell.setCellValue("");
						cell.setCellStyle(style);
					}

					if (sign.getZprice() != null) {
						cell = row.createCell(10);
						cell.setCellValue(sign.getZprice());
						cell.setCellStyle(style);
					} else {
						cell = row.createCell(10);
						cell.setCellValue("");
						cell.setCellStyle(style);
					}

					if (sign.getAmount() != null) {
						cell = row.createCell(11);
						cell.setCellValue(sign.getAmount());
						cell.setCellStyle(style);
					} else {
						cell = row.createCell(11);
						cell.setCellValue("");
						cell.setCellStyle(style);
					}

					if (sign.getDay() != null) {
						cell = row.createCell(12);
						cell.setCellValue(sign.getDay());
						cell.setCellStyle(style);
					} else {
						cell = row.createCell(12);
						cell.setCellValue("");
						cell.setCellStyle(style);
					}

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// response = null;//
		OutputStream out = null;// 创建一个输出流对象
		try {
			// response = ServletActionContext.getResponse();//
			// 初始化HttpServletResponse对象
			out = response.getOutputStream();//
			response.setHeader("Content-disposition", "attachment; filename=" + "order" + 2020 + ".xls");// filename是下载的xls的名，建议最好用英文
			response.setContentType("application/msexcel;charset=UTF-8");// 设置类型
			response.setHeader("Pragma", "No-cache");// 设置头
			response.setHeader("Cache-Control", "no-cache");// 设置头
			response.setDateHeader("Expires", 0);// 设置日期头
			workbook.write(out);
			out.flush();
			workbook.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {

				if (out != null) {
					out.close();
				}

			} catch (IOException e) {
				e.printStackTrace();
			}

		}

		return null;
	}

	// 统计分析
	@RequestMapping("admin/tj.do")
	public void selectTongji(ModelMap map, HttpSession session, String starttime, String endtime, String xmlstr,
			HttpServletResponse response) {
		System.out.println("开始时间" + starttime);
		System.out.println("结束时间" + endtime);
		Map<String, Object> cmap = new HashMap<String, Object>();
		cmap.put("stime1", starttime);
		cmap.put("etime1", endtime);
		List<TongJi> tjlist = forderService.getTongJi(cmap);
		System.out.println("aaaaaaaaaaa==" + tjlist.size());
		xmlstr = "<graph showNames='1'  decimalPrecision='0'  > ";
		for (TongJi tj : tjlist) {

			xmlstr += "<set name='" + tj.getName() + "' value='" + tj.getAmount() + "'/> ";
		}
		xmlstr += "</graph>";
		System.out.println("xml==" + xmlstr);
		// System.out.println("ccccccccccccccccccc=="+olist.size());
		// 把集合转换为jsonarray
		// JSONArray array=JSONArray.fromObject(olist);
		JSONObject obj = new JSONObject();
		obj.put("xmlstr", xmlstr);
		// obj.put("list", array);
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

	// 统计分析
	@RequestMapping("admin/tj2.do")
	public void selectTongji(ModelMap map, Forder forder, HttpSession session, String stime, String etime,
			HttpServletResponse response) {

		System.out.println("开始时间" + stime);
		System.out.println("结束时间" + etime);
		System.out.println("商品名称" + forder.getFid());
		Map<String, Object> cmap = new HashMap<String, Object>();
		cmap.put("stime1", stime);
		cmap.put("etime1", etime);
		List<TongJi> list = forderService.getTongJi(null);
		// List<TongJi> tjlist = orderService.getTongJi2(cmap);
		System.out.println("aaaaaaaaaaa==" + list.size());
		/* ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'] */
		// xmlstr = "<graph showNames='1' decimalPrecision='0' > ";
		String sj = "[";
		String hp = "[";
		for (TongJi tj : list) {

			sj += "'" + tj.getName() + "',";
			hp += "" + tj.getAmount() + ",";
		}
		int n = sj.length();
		sj = sj.substring(0, n - 1);
		int n3 = hp.length();
		hp = hp.substring(0, n3 - 1);
		sj += "]";
		hp += "]";
		// stu="['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']";
		// account="[120, 49, 70, 232, 256, 767, 1356, 1622, 326, 200,164, 133]";
		System.out.println(sj);
		System.out.println(hp);
		// xmlstr += "</graph>";
		// System.out.println("xml==" + xmlstr);
		// System.out.println("ccccccccccccccccccc=="+olist.size());
		// 把集合转换为jsonarray
		// JSONArray array=JSONArray.fromObject(olist);
		JSONObject obj = new JSONObject();
		obj.put("sj", sj);
		obj.put("hp", hp);
		// obj.put("list", array);
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

    // 统计分析--菜品统计
    @RequestMapping("admin/tj3.do")
    public void tj3(ModelMap map, Forder forder, HttpSession session, String stime, String etime,
                             HttpServletResponse response) {

        System.out.println("开始时间" + stime);
        System.out.println("结束时间" + etime);
        System.out.println("商品名称" + forder.getFid());
        Map<String, Object> cmap = new HashMap<String, Object>();
        cmap.put("stime1", stime);
        cmap.put("etime1", etime);
        List<TongJi> list = forderService.getTongJi_cp(null);
        // List<TongJi> tjlist = orderService.getTongJi2(cmap);
        System.out.println("aaaaaaaaaaa==" + list.size());
        /* ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'] */
        // xmlstr = "<graph showNames='1' decimalPrecision='0' > ";
        String sj = "[";
        String hp = "[";
        for (TongJi tj : list) {

            sj += "'" + tj.getName() + "',";
            hp += "" + tj.getAmount() + ",";
        }
        int n = sj.length();
        sj = sj.substring(0, n - 1);
        int n3 = hp.length();
        hp = hp.substring(0, n3 - 1);
        sj += "]";
        hp += "]";
        // stu="['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']";
        // account="[120, 49, 70, 232, 256, 767, 1356, 1622, 326, 200,164, 133]";
        System.out.println(sj);
        System.out.println(hp);
        // xmlstr += "</graph>";
        // System.out.println("xml==" + xmlstr);
        // System.out.println("ccccccccccccccccccc=="+olist.size());
        // 把集合转换为jsonarray
        // JSONArray array=JSONArray.fromObject(olist);
        JSONObject obj = new JSONObject();
        obj.put("sj", sj);
        obj.put("hp", hp);
        // obj.put("list", array);
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

}
