package com.kktshop.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kktshop.dto.DatabankDTO;
import com.kktshop.service.FileService;
@Controller
public class FileController {
	@Autowired
	ResourceLoader rsLoader;
	@RequestMapping(value="/uploadForm.do", method = RequestMethod.GET) //파일 업로드 폼 로딩
	public String uploadForm() {
		return "uploadFile";
	}
    @RequestMapping(value="/fileUplaod.do", method = RequestMethod.POST) 	//파일 업로드 처리
    public String fileUpload(MultipartFile myfile) throws UnsupportedEncodingException, Exception {
    	String filename = myfile.getOriginalFilename();
    	System.out.println("업로드 파일 이름 : "+filename);
    	filename = new String(filename.getBytes("8859_1"), "utf-8");
    	Resource resource = rsLoader.getResource("/WEB-INF/views/upload");
    	myfile.transferTo(new File(resource.getFile().getCanonicalPath()+"/"+filename)); //상대경로
    	System.out.println("파일 업로드 위치 : "+resource.getFile().getCanonicalPath());
    	//myfile.transferTo(new File("d:/kim3/fileUplad/"+filename)); //절대경로
    	System.out.println("파일 저장 성공");
        return "redirect:/";
    } 	/*  D:\\kim3\\jsp3\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\web05\\WEB-INF\\views\\upload\\ 에 저장됨  */

	@RequestMapping(value="/uploadMulti.do", method = RequestMethod.GET) //다수파일 업로드 폼 로딩
	public String uploadMulti() {
		return "uploadMulti";
	}
	@RequestMapping(value="/multiFileUplaod.do", method = RequestMethod.POST) //다수파일 업로드 폼 로딩
	public String multiFileUpload(MultipartFile[] files) {
		String uploadFolder = "D:\\kim3\\jsp3\\web05\\src\\main\\webapp\\WEB-INF\\views\\upload";
		for(MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			System.out.println("업로드 파일 이름 : "+fileName);
			System.out.println("업로드 파일 크기 : "+file.getSize());
			
			File saveFile = new File(uploadFolder, fileName);
			try {
				file.transferTo(saveFile);
			} catch(Exception e) {
				System.out.println("파일 처리 오류");
				e.printStackTrace();
			}
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/databankForm.do", method = RequestMethod.GET) //자료 등록 폼 로딩
	public String databankForm() {
		return "databankForm";
	}
	
	@Autowired
	FileService fileService;
	
	@RequestMapping(value="/databankInsert.do", method = RequestMethod.POST) //자료 등록 폼 로딩
	public String databankInsert(MultipartFile fileurl, HttpServletRequest request, Model model) throws UnsupportedEncodingException, Exception {
		String uploadFolder = "D:\\kim3\\jsp3\\web05\\src\\main\\webapp\\WEB-INF\\views\\upload";
		String fileName = fileurl.getOriginalFilename();
		File saveFile = new File(uploadFolder, fileName);
		fileurl.transferTo(saveFile);
		DatabankDTO databank = new DatabankDTO();
		databank.setTitle(request.getParameter("title"));
		databank.setAuthor(request.getParameter("author"));
		databank.setFileurl(fileName);
		//해당 서비스를 호출 -> DAO호출 -> Mapper -> DB
		fileService.databankInsert(databank);
		return "redirect:/";
	}
	/*
	 * System.out.println("업로드 파일 이름 : "+fileName);
	 * System.out.println("업로드 파일 크기 : "+fileurl.getSize());
	 * System.out.println("자료 제목 : "+databank.getTitle());
	 * System.out.println("자료 작성자 : "+databank.getAuthor());
	 * System.out.println("자료 파일명 : "+databank.getFileurl());
	 */
	
	@RequestMapping(value="/databankList.do", method = RequestMethod.GET)
	public String databankList(DatabankDTO databank, Model model) throws Exception {
		List<DatabankDTO> databankList = fileService.databankList();
		model.addAttribute("databankList", databankList);
		return "databankList";
	}
	
	@RequestMapping(value="/uploadAjaxForm.do", method = RequestMethod.GET) //자료 등록 폼 로딩
	public String uploadAjaxForm() {
		return "uploadAjax";
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax.do", method = RequestMethod.POST) //자료 등록 폼 로딩
	public String uploadAjax(MultipartFile[] uploadFile, Model model) throws UnsupportedEncodingException, Exception {
		String uploadFolder = "D:\\kim3\\jsp3\\web05\\src\\main\\webapp\\WEB-INF\\views\\upload";
		String result = "";
		for(MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				multipartFile.transferTo(saveFile);
				result = "파일 업로드 성공";
			} catch(Exception e) {
				result = "파일 업로드 실패";
				e.printStackTrace();
			}
			System.out.println(result);
		}
		return result;
	}
}