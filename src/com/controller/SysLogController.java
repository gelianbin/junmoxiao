package com.controller;


import com.entity.Goods;
import com.entity.SysLog;
import com.entity.Sysuser;
import com.server.GoodsServer;
import com.server.SysLogServier;
import com.server.SysuserServier;
import com.util.PageBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SysLogController {
    @Resource
    private SysLogServier sysLogService;
    @Resource
    private SysuserServier userService;
    @Resource
    private GoodsServer goodsService;


    // 查询所有日志的信息
    @RequestMapping("admin/sysLogList.do")
    public String sysLogList(@RequestParam(value = "page", required = false) String page, HttpSession session,
                             ModelMap map) {
        Sysuser u = (Sysuser) session.getAttribute("auser");
        if (u == null) {
            return "admin/login";
        } else {
            if (page == null || page.equals("")) {
                page = "1";
            }
            PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
            Map<String, Object> pmap = new HashMap<>();
            pmap.put("pageno", pageBean.getStart());
            pmap.put("pageSize", pageBean.getPageSize());
            Map<String, Object> cmap = new HashMap<>();
            /*pmap.put("uid", u.getUid());
            cmap.put("uid", u.getUid());*/
            int total = sysLogService.getCount(cmap);
            pageBean.setTotal(total);
            List<SysLog> list = sysLogService.getByPage(pmap);
            map.put("page", pageBean);
            map.put("list", list);
            map.put("ulist", userService.getAll(null));
            map.put("glist", goodsService.getAll(null));
            session.setAttribute("p", 1);
            return "admin/sysLog_list";
        }
    }
    
    @RequestMapping("admin/sysLogListQuery.do")
    public String sysLogListQuery(@RequestParam(value = "page", required = false) String page, HttpSession session,
                             ModelMap map,SysLog log) {
        Sysuser u = (Sysuser) session.getAttribute("auser");
        if (u == null) {
            return "admin/login";
        } else {
            if (page == null || page.equals("")) {
                page = "1";
            }
            PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
            Map<String, Object> pmap = new HashMap<>();
            pmap.put("pageno", pageBean.getStart());
            pmap.put("pageSize", pageBean.getPageSize());
            Map<String, Object> cmap = new HashMap<>();
            if(log.getBtype()!=null&&!log.getBtype().equals("")) {
            	pmap.put("btype", log.getBtype());
                cmap.put("btype", log.getBtype());
            }
            if(log.getUid()!=null) {
            	pmap.put("uid", log.getUid());
                cmap.put("uid", log.getUid());
            }
            
            int total = sysLogService.getCount(cmap);
            pageBean.setTotal(total);
            List<SysLog> list = sysLogService.getAll(pmap);
            map.put("page", pageBean);
            map.put("list", list);
            map.put("ulist", userService.getAll(null));
            map.put("glist", goodsService.getAll(null));
            session.setAttribute("p", 5);
            return "admin/sysLog_list";
        }
    }



    @RequestMapping("admin/deleteSysLog.do")
    public String deleteSysLog(int id) {
        sysLogService.delete(id);
        return "redirect:sysLogList.do";
    }

}
