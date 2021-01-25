package com.controller;

import java.io.File;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Btype;
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
import org.springframework.web.multipart.MultipartFile;

import com.entity.Forder;
import com.entity.House;
import com.entity.Sysuser;
import com.server.BtypeServer;
import com.server.ForderServer;
import com.server.HouseServer;
import com.server.SysuserServier;
import com.util.PageBean;

@Controller
public class HouseController {
    @Resource
    private HouseServer houseService;
    @Resource
    private BtypeServer btypeService;
    @Resource
    private SysuserServier userService;
    @Resource
    private ForderServer forderService;

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

    // 分页查询
    @RequestMapping("showhouse.do")
    public String showHouse(@RequestParam(value = "page", required = false) String page, ModelMap map,
                            HttpSession session, House cd) {
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
        if (cd.getBid() != null && !cd.getBid().equals("")) {
            cmap.put("bid", cd.getBid());
            pmap.put("bid", cd.getBid());
        }
        int total = houseService.getCount(cmap);
        pageBean.setTotal(total);
        List<House> list = houseService.getByPage(pmap);
        map.put("page", pageBean);
        map.put("list", list);
        session.setAttribute("p", 1);
        comMethod(map);
        return "houselist";
    }

    @RequestMapping("showhouse2.do")
    public String showHouse2(@RequestParam(value = "page", required = false) String page, ModelMap map,
                             HttpSession session, House cd) {
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
        if (cd.getBid() != null && !cd.getBid().equals("")) {
            cmap.put("bid", cd.getBid());
            pmap.put("bid", cd.getBid());
        }
        int total = houseService.getCount(cmap);
        pageBean.setTotal(total);
        List<House> list = houseService.getByPage(pmap);
        map.put("page", pageBean);
        map.put("list", list);
        session.setAttribute("p", 1);
        
        comMethod(map);
        return "houselist";
    }

    // 分页模糊查询
    @RequestMapping("selectHouseList.do")
    public String SelectHouse(@RequestParam(value = "page", required = false) String page, ModelMap map,
                              HttpSession session, House cd) {
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
        if (cd.getBid() != null && !cd.getBid().equals("")) {
            cmap.put("bid", cd.getBid());
            pmap.put("bid", cd.getBid());

        }
        if (cd.getCnum() != null && !cd.getCnum().equals("")) {
            cmap.put("cnum", cd.getCnum());
            pmap.put("cnum", cd.getCnum());

        }
        if (cd.getPubtime() != null && !cd.getPubtime().equals("")) {
            cmap.put("pubtime", cd.getPubtime());
            pmap.put("pubtime", cd.getPubtime());

        }
        if (cd.getUnum() != null && !cd.getUnum().equals("")) {
            cmap.put("unum", cd.getUnum());
            pmap.put("unum", cd.getUnum());

        }
        if (cd.getAddr2() != null && !cd.getAddr2().equals("")) {
            cmap.put("addr2", cd.getAddr2());
            pmap.put("addr2", cd.getAddr2());

        }
        int total = houseService.getCount(cmap);
        pageBean.setTotal(total);
        List<House> list = houseService.getAll(pmap);
        map.put("page", pageBean);
        map.put("list", list);
        session.setAttribute("p", 2);
        comMethod(map);
        return "house_list2";
    }

    @RequestMapping("deleteHouse.do")
    public String deleteHouse(int id) {
        houseService.delete(id);
        return "redirect:fHouseList.do";
    }

    @RequestMapping("deleteHouse2.do")
    public String deleteHouse2(int id) {
        houseService.delete(id);
        return "redirect:houseList.do";
    }

    // 分页查询--某一类房间的信息
    @RequestMapping("showHouseType.do")
    public String showHouseType(@RequestParam(value = "page", required = false) String page, ModelMap map,
                                HttpSession session, int bid) {
        if (page == null || page.equals("")) {
            page = "1";
        }
        PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
        Map<String, Object> pmap = new HashMap<String, Object>();
        pmap.put("pageno", pageBean.getStart());
        pmap.put("pageSize", pageBean.getPageSize());
        Map<String, Object> cmap = new HashMap<String, Object>();
        pmap.put("bid", bid);
        cmap.put("bid", bid);
        int total = houseService.getCount(cmap);
        pageBean.setTotal(total);
        List<House> list = houseService.getByPage(pmap);
        System.out.println("bid==" + bid);
        System.out.println("count==" + list.size());
        map.put("page", pageBean);
        map.put("list", list);
        comMethod(map);
        map.put("ulist", userService.getAll(null));
        session.setAttribute("bid", bid);
        session.setAttribute("type", btypeService.getById(bid).getName());
        return "house_type_list";
    }

    // 分页查询
    @RequestMapping("fHouseList.do")
    public String showjianList(@RequestParam(value = "page", required = false) String page, ModelMap map,
                               HttpSession session) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null || u.equals("")) {
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
            pmap.put("name", null);
            cmap.put("name", null);
            pmap.put("yid", u.getUid());
            cmap.put("yid", u.getUid());
            int total = houseService.getCount(cmap);
            pageBean.setTotal(total);
            List<House> list = houseService.getByPage(pmap);
            map.put("page", pageBean);
            map.put("list", list);
            comMethod(map);
            map.put("ulist", userService.getAll(null));
            // session.setAttribute("p", 1);
            return "myHouselist";
        }
    }

    // 分页查询--前台用户查看所有的房子信息
    @RequestMapping("houseList.do")
    public String houseList(@RequestParam(value = "page", required = false) String page, ModelMap map,
                            HttpSession session) {
        if (page == null || page.equals("")) {
            page = "1";
        }
        PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
        Map<String, Object> pmap = new HashMap<String, Object>();
        pmap.put("pageno", pageBean.getStart());
        pmap.put("pageSize", pageBean.getPageSize());
        Map<String, Object> cmap = new HashMap<String, Object>();
        pmap.put("name", null);
        cmap.put("name", null);
        int total = houseService.getCount(cmap);
        pageBean.setTotal(total);
        List<House> list = houseService.getByPage(pmap);
        map.put("page", pageBean);
        map.put("list", list);
        comMethod(map);
        map.put("ulist", userService.getAll(null));
        session.setAttribute("p", 1);
        return "house_list";
    }

    // 分页查询--前台用户查看展示最热门10个房子信息
    @RequestMapping("houseList_hot.do")
    public String houseList_hot(@RequestParam(value = "page", required = false) String page, ModelMap map,
                                HttpSession session) {
        Map<String, Object> smap = new HashMap<>();
        List<House> list = houseService.getTop10(smap);
        map.put("list", list);
        comMethod(map);
        map.put("ulist", userService.getAll(null));
        session.setAttribute("p", 2);
        return "house_list_hot";
    }

    @RequestMapping("doUpdateHouse2.do")
    public String doUpdateHouse2(ModelMap map, int id) {
        map.put("jz", houseService.getById(id));
        comMethod(map);
        return "update_house2";
    }

    //
    @RequestMapping("showHouse.do")
    public String showHouse(ModelMap map, int id) {
        House house1 = houseService.getById(id);
        if (house1.getFjnum() > 0) {
            house1.setStatus("可用房间");
            houseService.update(house1);
        }
        map.put("house", houseService.getById(id));
        Map<String, Object> ymap = new HashMap<>();
        Map<String, Object> ymap2 = new HashMap<>();
        ymap.put("fid", id);
        ymap2.put("fid", id);
        ymap.put("status", "预约");
        ymap2.put("status", "已住");
        List<Forder> list = forderService.getAll(ymap);
        List<Forder> list2 = forderService.getAll(ymap2);
        map.put("list", list);
        map.put("list2", list2);
        Map<String, Object> omap = new HashMap<>();
        omap.put("status", "已评价");
        omap.put("fid", id);
        map.put("plist", forderService.getAll(omap));
        comMethod(map);
        map.put("ulist", userService.getAll(null));
        return "housex";
    }

    @RequestMapping("addZuLin.do")
    public String addZuLin(ModelMap map, HttpSession session, int id) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null || u.equals("")) {
            return "fore_login";
        } else {
            House h = houseService.getById(id);
            if (h.getStatus().equals("已预订")) {
                return "error_zl";
            } else {
                h.setStatus("已预订");
                /* h.setYid(u.getUid()); */
                houseService.update(h);
                return "success";
            }
        }
    }

    @RequestMapping("queRenGuiHuai.do")
    public String queRenZuLin(ModelMap map, HttpSession session, int id) {
        Sysuser u = (Sysuser) session.getAttribute("user");
        if (u == null || u.equals("")) {
            return "fore_login";
        } else {
            House h = houseService.getById(id);
            h.setStatus("可用房间");
            /* h.setYid(0); */
            h.setId(id);
            comMethod(map);
            houseService.update(h);
            return "success";
        }
    }

    /**
     * ===后台房间管理===
     *
     * @param map
     * @param session
     * @return
     */

    @RequestMapping("admin/doAddHouse.do")
    public String doAddHouse(ModelMap map, HttpSession session) {
        Sysuser user = (Sysuser) session.getAttribute("auser");
        if (user == null) {
            return "admin/login";
        } else {
            comMethod(map);
            return "admin/house_add";
        }

    }

    @RequestMapping("admin/addHouse.do")
    public String addHouse(@RequestParam(value = "file", required = false) MultipartFile file,
                           @RequestParam(value = "file1", required = false) MultipartFile file1,
                           @RequestParam(value = "file2", required = false) MultipartFile file2,
                           @RequestParam(value = "file3", required = false) MultipartFile file3,
                           @RequestParam(value = "file4", required = false) MultipartFile file4, HttpServletRequest request,
                           HttpServletRequest request1, House House, String img, String img1, String img2, String img3, String img4,
                           HttpSession session) {
        Sysuser user = (Sysuser) session.getAttribute("auser");
        if (user == null) {
            return "admin/login";
        } else {
            System.out.println("ddddd");
            img = fileUpload(file, request, img);
            if (img != "zanwu.jpg") {
                House.setImg(img);
            }
            img1 = fileUpload(file1, request1, img1);
            if (img1 != "zanwu.jpg") {
                House.setImg1(img1);
            }
            img2 = fileUpload(file2, request, img2);
            if (img2 != "zanwu.jpg") {
                House.setImg2(img2);
            }
            img3 = fileUpload(file3, request, img3);
            if (img3 != "zanwu.jpg") {
                House.setImg3(img3);
            }
            img4 = fileUpload(file4, request, img4);
            if (img4 != "zanwu.jpg") {
                House.setImg4(img4);
            }
            java.sql.Timestamp time = new Timestamp(System.currentTimeMillis());
            House.setPubtime(time.toString().substring(0, 19));
            House.setIsdel("1");
            House.setOnum(0);
            House.setUid(user.getUid());
            House.setStatus("可用房间");
            houseService.add(House);
            return "admin/success";
        }
    }

    // 修改
    @RequestMapping("admin/doUpdateHouse.do")
    public String doUpdateHouse(ModelMap map, int id) {
        map.put("house", houseService.getById(id));
        comMethod(map);
        return "admin/house_update";
    }


    @RequestMapping("admin/updateHouse.do")
    public String updateHouse(@RequestParam(value = "file", required = false) MultipartFile file,
                              @RequestParam(value = "file1", required = false) MultipartFile file1,
                              @RequestParam(value = "file2", required = false) MultipartFile file2,
                              @RequestParam(value = "file3", required = false) MultipartFile file3,
                              @RequestParam(value = "file4", required = false) MultipartFile file4, HttpServletRequest request,
                              House House, String img, String img1, String img2, String img3, String img4) {
        img = fileUpload(file, request, img);
        if (img != "zanwu.jpg") {
            House.setImg(img);
        }
        img1 = fileUpload(file1, request, img1);
        System.out.println("img1===" + img1);
        if (img1 != "zanwu.jpg") {
            House.setImg1(img1);
        }
        img2 = fileUpload(file2, request, img2);
        if (img2 != "zanwu.jpg") {
            House.setImg2(img2);
        }
        img3 = fileUpload(file3, request, img3);
        if (img3 != "zanwu.jpg") {
            House.setImg3(img3);
        }
        img4 = fileUpload(file4, request, img4);
        if (img4 != "zanwu.jpg") {
            House.setImg4(img4);
        }
        houseService.update(House);
        return "redirect:HouseList.do";
    }

    // 分页查询
    @RequestMapping("admin/HouseList.do")
    public String jianList(@RequestParam(value = "page", required = false) String page, ModelMap map,
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
            pmap.put("pageno", pageBean.getStart());
            pmap.put("pageSize", pageBean.getPageSize());
            Map<String, Object> cmap = new HashMap<String, Object>();
            if (user.getUtype().equals("普通管理员")) {
                pmap.put("uid", user.getUid());
                cmap.put("uid", user.getUid());
            }
            int total = houseService.getCount(cmap);
            pageBean.setTotal(total);
            List<House> list = houseService.getByPage(pmap);
            map.put("page", pageBean);
            map.put("list", list);
            session.setAttribute("p", 1);
            comMethod(map);
            map.put("ulist", userService.getAll(null));
            return "admin/house_list";
        }
    }

    // 分页模糊查询
    @RequestMapping("admin/vagueHouseList.do")
    public String vagueHouseList(@RequestParam(value = "page", required = false) String page, ModelMap map,
                                 HttpSession session, House cd) {
        Sysuser user = (Sysuser) session.getAttribute("auser");
        if (user == null) {
            return "admin/login";
        } else {
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
            if (cd.getBid() != null) {
                cmap.put("bid", cd.getBid());
                pmap.put("bid", cd.getBid());
            }
            if (cd.getCnum() != null && !cd.getCnum().equals("")) {
                cmap.put("cnum", cd.getCnum());
                pmap.put("cnum", cd.getCnum());
            }
            if (cd.getStatus() != null && !cd.getStatus().equals("")) {
                cmap.put("status", cd.getStatus());
                pmap.put("status", cd.getStatus());
            }
            if (user.getUtype().equals("普通管理员")) {
                pmap.put("uid", user.getUid());
                cmap.put("uid", user.getUid());
            }
            int total = houseService.getCount(cmap);
            pageBean.setTotal(total);
            List<House> list = houseService.getByPage(pmap);
            map.put("page", pageBean);
            map.put("list", list);
            session.setAttribute("p", 2);
            comMethod(map);
            return "admin/house_list";

        }
    }

    // 处理修改排行榜
    @RequestMapping("admin/doUpdateHouse_phb.do")
    public String doUpdateHouse_phb(ModelMap map, int id) {
        map.put("house", houseService.getById(id));
        comMethod(map);
        return "admin/house_update_phb";
    }

    // 保存修改的排行榜
    @RequestMapping("admin/updateHouse_phb.do")
    public String updateHouse_phb(ModelMap map, House house, HttpSession session) {
        houseService.update(house);
        return "redirect:houseList_phb";
    }

    // 分页查询--住宿排行榜
    @RequestMapping("admin/houseList_phb.do")
    public String houseList_phb(@RequestParam(value = "page", required = false) String page, ModelMap map,
                                HttpSession session) {
        if (page == null || page.equals("")) {
            page = "1";
        }
        PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
        Map<String, Object> pmap = new HashMap<String, Object>();
        pmap.put("pageno", pageBean.getStart());
        pmap.put("pageSize", pageBean.getPageSize());
        Map<String, Object> cmap = new HashMap<String, Object>();
        pmap.put("name", null);
        cmap.put("name", null);
        int total = houseService.getCount(cmap);
        pageBean.setTotal(total);
        List<House> list = houseService.getByPage2(pmap);
        map.put("page", pageBean);
        map.put("list", list);
        session.setAttribute("p", 1);
        comMethod(map);
        map.put("ulist", userService.getAll(null));
        return "admin/house_list_phb";
    }

    @RequestMapping("admin/deleteHouse.do")
    public String deleteHouseA(int id) {
        House b = houseService.getById(id);
        b.setIsdel("1");
        b.setId(id);
        houseService.update(b);
        return "admin/success";
    }


    /**
     * ===导出===
     *
     * @param
     * @param
     * @return
     */

    @RequestMapping("admin/exportHouse.do")
    public String exportHouse(HttpServletResponse response) throws Exception {
        List<House> houseList = new ArrayList<>();
        Btype btype = new Btype();
        Map<String, Object> lmap = new HashMap<String, Object>();
        lmap.put("status", null);
        houseList = houseService.getAll(lmap);
        for (House l : houseList) {
            System.out.println("lid===" + l.getId());
        }
        /*
         * 设置表头：对Excel每列取名 (必须根据你取的数据编写)
         */
        String[] tableHeader = {"序号", "房间名称", "分类", "价格", "人数", "房间数", "卫生间类型", "位置", "发布时间", "预定状态"};
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
            if (houseList.size() < 1) {
                header.setCenter("查无数据");
            } else {
                header.setCenter("房间信息表");
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
                for (int i = 0; i < houseList.size(); i++) {
                    House sign = (House) houseList.get(i);// 获取sign对象
                    row = sheet.createRow((short) (i + 1));// 创建第i+1行
                    row.setHeight((short) 400);// 设置行高
                    if (sign.getName() != null) {
                        cell = row.createCell(0);// 创建第i+1行第0列
                        cell.setCellValue(i + 1);// 设置第i+1行第0列的值
                        cell.setCellStyle(style);// 设置风格
                    } else {
                        cell = row.createCell(0);// 创建第i+1行第0列
                        cell.setCellValue("");// 设置第i+1行第0列的值
                        cell.setCellStyle(style);// 设置风格
                    }

                    if (sign.getName() != null) {
                        cell = row.createCell(1);// 创建第i+1行第0列
                        cell.setCellValue(sign.getName());// 设置第i+1行第0列的值
                        cell.setCellStyle(style);// 设置风格
                    } else {
                        cell = row.createCell(1);// 创建第i+1行第0列
                        cell.setCellValue("");// 设置第i+1行第0列的值
                        cell.setCellStyle(style);// 设置风格
                    }
                    /* 分类 */
                    if (sign.getBid() != null) {
                        btype = btypeService.getById(sign.getBid());
                        if (btype != null && btype.getName() != null) {
                            cell = row.createCell(2); // 创建第i+1行第1列
                            cell.setCellValue(btype.getName());// 设置第i+1行第1列的值
                            cell.setCellStyle(style); // 设置风格
                        } else {
                            cell = row.createCell(2);// 创建第i+1行第1列
                            cell.setCellValue("");// 设置第i+1行第1列的值
                            cell.setCellStyle(style);// 设置风格
                        }
                    }
                    //
                    if (sign.getPrice() != null) {
                        cell = row.createCell(3);// 创建第i+1行第0列
                        cell.setCellValue(sign.getPrice());// 设置第i+1行第0列的值
                        cell.setCellStyle(style);// 设置风格
                    } else {
                        cell = row.createCell(3);// 创建第i+1行第0列
                        cell.setCellValue("");// 设置第i+1行第0列的值
                        cell.setCellStyle(style);// 设置风格
                    }

                    if (sign.getFjnum() != null) {
                        cell = row.createCell(4);
                        cell.setCellValue(sign.getFjnum());
                        cell.setCellStyle(style);
                    } else {
                        cell = row.createCell(4);
                        cell.setCellValue("");
                        cell.setCellStyle(style);
                    }

                    if (sign.getWsjtype() != null) {
                        cell = row.createCell(5);
                        cell.setCellValue(sign.getWsjtype());
                        cell.setCellStyle(style);
                    } else {
                        cell = row.createCell(5);
                        cell.setCellValue("");
                        cell.setCellStyle(style);
                    }

                    if (sign.getAddr() != null) {
                        cell = row.createCell(6);
                        cell.setCellValue(sign.getAddr());
                        cell.setCellStyle(style);
                    } else {
                        cell = row.createCell(6);
                        cell.setCellValue("");
                        cell.setCellStyle(style);
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

                    if (sign.getStatus() != null) {
                        cell = row.createCell(8);
                        cell.setCellValue(sign.getStatus());
                        cell.setCellStyle(style);
                    } else {
                        cell = row.createCell(8);
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
            response.setHeader("Content-disposition", "attachment; filename=" + "house" + 2020 + ".xls");// filename是下载的xls的名，建议最好用英文
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
