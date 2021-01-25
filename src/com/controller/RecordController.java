package com.controller;


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

import com.entity.Goods;
import com.entity.Record;
import com.entity.Sysuser;
import com.server.GoodsServer;
import com.server.RecordServier;
import com.server.SysuserServier;
import com.util.PageBean;

@Controller
public class RecordController {
    @Resource
    private RecordServier recordService;
    @Resource
    private SysuserServier userService;
    @Resource
    private GoodsServer goodsService;


    @RequestMapping("addRecord.do")
    public String addRecord(HttpServletRequest request, Record record, HttpSession session) {
        System.out.println("ddddd");
        Sysuser u = (Sysuser) session.getAttribute("user");
        System.out.println("u=-=" + u);
        if (u == null) {
            return "login";
        } else {
            Sysuser user = userService.getById(u.getUid());
            Goods goods = goodsService.getById(record.getGid());
            if (user.getScope() < goods.getKcnum()) {
                session.setAttribute("info", "积分不足！");
                return "error";
            } else {
                user.setScope(user.getScope() - goods.getKcnum());
                Timestamp time = new Timestamp(System.currentTimeMillis());
                record.setPubtime(time.toString().substring(0, 19));
                record.setUid(u.getUid());
                recordService.add(record);
                userService.update(user);
                return "redirect:recordList.do";
            }

        }
    }

    // 查询所有礼品的信息
    @RequestMapping("recordList.do")
    public String userList(@RequestParam(value = "page", required = false) String page, HttpSession session,
                           ModelMap map) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null) {
            return "login";
        } else {
            if (page == null || page.equals("")) {
                page = "1";
            }
            PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
            Map<String, Object> pmap = new HashMap<String, Object>();
            pmap.put("pageno", pageBean.getStart());
            pmap.put("pageSize", pageBean.getPageSize());
            Map<String, Object> cmap = new HashMap<String, Object>();
            pmap.put("uid", u.getUid());
            cmap.put("uid", u.getUid());
            int total = recordService.getCount(cmap);
            pageBean.setTotal(total);
            List<Record> list = recordService.getByPage(pmap);
            map.put("page", pageBean);
            map.put("list", list);
            map.put("ulist", userService.getAll(null));
            map.put("glist", goodsService.getAll(null));
            session.setAttribute("p", 1);
            return "record_list";
        }
    }


    @RequestMapping("admin/deleteRecord.do")
    public String deleteRecord(int id) {
        recordService.delete(id);
        return "redirect:recordList.do";
    }

}
