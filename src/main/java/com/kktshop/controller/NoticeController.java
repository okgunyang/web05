package com.kktshop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.kktshop.dto.NoticeDTO;
import com.kktshop.service.NoticeService;
import com.kktshop.util.PageMaker;

@Controller
@RequestMapping("/notice/")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	HttpSession session;
	
	//DataTables jQuery 플러그인을 활용한 목록
	@RequestMapping(value="list.do", method = RequestMethod.GET)
    public String noticeList(Model model) throws Exception {
		List<NoticeDTO> noticeList = noticeService.noticeList();
		int cnt = noticeService.noticeCount();
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("cnt", cnt);
        return "notice/noticeList";
    }
	
	//페이지메이커를 활용한 페이지 분리하기 목록
	@RequestMapping(value="pageList.do", method = RequestMethod.GET)
    public String noticePageList(@RequestParam("curPage") int curPage, Model model) throws Exception {
		int cnt = noticeService.noticeCount();
		//PageMaker page = new PageMaker(cnt, curPage);
		//PageMaker page = new PageMaker(cnt, curPage, 10);
		PageMaker page = new PageMaker(cnt, curPage, 10, 10);
		List<NoticeDTO> noticePageList = noticeService.noticePageList(page);
		model.addAttribute("noticePageList", noticePageList);
		model.addAttribute("page", page);
		model.addAttribute("cnt", cnt);
        return "notice/noticePageList";
    }
	
	//일반 글쓰기 폼을 호출 
	@RequestMapping(value="addNoticeForm.do", method = RequestMethod.GET)
    public String addNoticeForm(Model model) throws Exception {
        return "notice/addNoticeForm";
    }
	
	//일반 글쓰기 처리
	@RequestMapping(value="addNotice.do", method = RequestMethod.POST)
    public String addNotice(NoticeDTO notice, Model model) throws Exception {
		noticeService.addNotice(notice);
        return "redirect:/notice/list.do";
    }
	
	/* ckeditor 폼 호출 */ 
	@RequestMapping(value="addSmartNoticeForm.do", method = RequestMethod.GET)
    public String addNoticeSmartForm(Model model) throws Exception {
        return "notice/addSmartNoticeForm";
    }
	
	/* ckeditor를 활용한 글쓰기 처리 */
	@RequestMapping(value="addSmartNotice.do", method = RequestMethod.POST)
    public String addSmartNotice(NoticeDTO notice, Model model) throws Exception {
		noticeService.addNotice(notice);
        return "redirect:/notice/pageList.do";
    }
	
	//파일 업로드
	@ResponseBody
	@RequestMapping(value = "fileupload.do")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			           
			            //String uploadPath = req.getSession().getServletContext().getRealPath("/views/upload"); //저장경로
			            String uploadPath = "D:\\kim3\\jsp3\\web05\\src\\main\\webapp\\WEB-INF\\views\\upload";
			            System.out.println("uploadPath:"+uploadPath);

			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + "/" + fileName2 +fileName;
			            
			            out = new FileOutputStream(new File(uploadPath));
			            out.write(bytes);
			            
			            printWriter = resp.getWriter();
			            //String fileUrl = "/views/upload/"+fileName2+fileName;
			            String fileUrl = "D:\\kim3\\jsp3\\web05\\src\\main\\webapp\\WEB-INF\\views\\upload"+fileName2+fileName; //url경로
			            System.out.println("fileUrl :" + fileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			 
			        }catch(IOException e){
			            e.printStackTrace();
			        } finally {
			            if (out != null) {
		                    out.close();
		                }
		                if (printWriter != null) {
		                    printWriter.close();
		                }
			        }
				}
			}
		}
	}
	
	@RequestMapping(value="noticeRead.do", method = RequestMethod.GET)
    public String noticeRead(@RequestParam("seq") int seq, Model model) throws Exception {
		NoticeDTO notice = noticeService.noticeRead(seq);
		model.addAttribute("notice", notice);
        return "notice/noticeRead";
    }
	
	@RequestMapping(value="updateNotice.do", method = RequestMethod.POST)
    public String updateNotice(NoticeDTO notice, Model model) throws Exception {
		noticeService.updateNotice(notice);
		return "redirect:/notice/list.do";
    }
	
	@RequestMapping(value="deleteNotice.do", method = RequestMethod.GET)
    public String deleteNotice(@RequestParam("seq") int seq, Model model) throws Exception {
		NoticeDTO notice = new NoticeDTO();
		notice.setSeq(seq);
		noticeService.deleteNotice(notice);
		return "redirect:/notice/list.do";
    }
}