package com.kktshop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.kktshop.dto.GoodsDTO;
import com.kktshop.dto.MemberDTO;
import com.kktshop.dto.NavbarDTO;
import com.kktshop.dto.NoticeDTO;
import com.kktshop.dto.QnaDTO;
import com.kktshop.dto.ReviewDTO;
import com.kktshop.dto.SalesDTO;
import com.kktshop.dto.SearchDTO;
import com.kktshop.service.GoodsService;
import com.kktshop.service.HomeService;
import com.kktshop.service.MemberService;
import com.kktshop.service.NoticeService;
import com.kktshop.service.QnaService;
import com.kktshop.service.ReviewService;
import com.kktshop.service.SalesService;
import com.kktshop.util.Email2;
import com.kktshop.util.EmailSender2;
import com.kktshop.util.PageMaker;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	HomeService homeService;
	
	@Autowired
	MemberService memberService;

	@Autowired
	NoticeService noticeService;
	
	@Autowired
	GoodsService goodsService;
	
	@Autowired
	SalesService salesService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	QnaService qnaService;	
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Autowired
	private EmailSender2 emailSender2;

	@Autowired
	private Email2 email2;
	
	@Autowired
	HttpSession session;
	
	//관리자 페이지
    @RequestMapping(value="/", method = RequestMethod.GET)
    public String AdminRoot() {
        return "admin/admin";
    }
	
    //관리자 페이지
    @RequestMapping(value="admin.do", method = RequestMethod.GET)
    public String Admin() {
        return "admin/admin";
    }
    
	//상품 목록 불러오기
	@RequestMapping(value="goodsList.do", method = RequestMethod.GET)
    public String goodsList(Model model) throws Exception {
		int cnt = goodsService.goodsCount();
		List<GoodsDTO> goodsList = goodsService.goodsList();
		model.addAttribute("cnt", cnt);
		model.addAttribute("cate_tit", "모든 상품");
		model.addAttribute("goodsList", goodsList);
        return "admin/goodsList";
    }
	
	//ajax로 카테고리 목록 불러오기
	@ResponseBody
	@RequestMapping(value="categoryLoading.do", method = RequestMethod.GET)
    public List<NavbarDTO> categoryLoading(String navparam, Model model) throws Exception {
		List<NavbarDTO> cateList = goodsService.cateList(navparam);
		return cateList;
    }
	
	//ajax로 내비게이션바의 상품 메뉴 목록 불러오기
	@ResponseBody
	@RequestMapping(value="navLoading.do", method = RequestMethod.POST)
    public List<NavbarDTO> navLoading(Model model) throws Exception {
		List<NavbarDTO> navList = homeService.navList();
		return navList;
    }
	
	//상품 대분류 카테고리별 중분류 카테고리 목록별 상품 목록 불러오기
	@RequestMapping(value="prolist.do", method = RequestMethod.GET)
    public String proList(@RequestParam("navparam") String navparam, Model model) throws Exception {
		List<GoodsDTO> goodsList = goodsService.proList(navparam);
		int cnt = goodsService.proCount(navparam);
		String navname = goodsService.navnameLoading(navparam);
		model.addAttribute("cnt", cnt);
		model.addAttribute("cate_tit", navname);
		model.addAttribute("goodsList", goodsList);
        return "admin/goodsList";
    }
	
	//상품 등록하기
	@RequestMapping(value="addGoods.do", method = RequestMethod.POST)
    public String addGoods(GoodsDTO goods, Model model) throws Exception {
		goodsService.addGoods(goods);
        return "redirect:/admin/goodsList.do";
    }
	
	//상품 등록 화면 로딩
	@RequestMapping(value="addGoodsForm.do", method = RequestMethod.GET)
    public String addGoodsForm(Model model) throws Exception {
		List<NavbarDTO> navbarList = homeService.navList();
		model.addAttribute("navbarList", navbarList);
        return "admin/addGoodsForm";
    }
	
	//상품 정보 변경하기
	@RequestMapping(value="updateGoods.do", method = RequestMethod.POST)
    public String updateGoods(GoodsDTO goods, Model model) throws Exception {
		goodsService.updateGoods(goods);
        return "redirect:/admin/goodsList.do";
    }
	
	//상품 정보 삭제하기
	@RequestMapping(value="deleteGoods.do", method = RequestMethod.GET)
    public String deleteGoods(GoodsDTO goods, Model model) throws Exception {
		goodsService.deleteGoods(goods);
        return "redirect:/admin/goodsList.do";
    }
	
	//상품 정보 상세보기
	@RequestMapping(value="getGoods.do", method = RequestMethod.GET)
    public String getGoods(int gnum, Model model) throws Exception {
		GoodsDTO goods = goodsService.getGoods(gnum);
		model.addAttribute("goods", goods);
        return "admin/getGoods";
    }
	
	//ajax로 해당 상품 정보 불러오기
	@ResponseBody
	@RequestMapping(value="getAjaxGoods.do", method = RequestMethod.GET)
    public GoodsDTO getAjaxGoods(int gnum, Model model) throws Exception {
		GoodsDTO goods = goodsService.getGoods(gnum);
        return goods;
    }
	
	
	//상품이미지 업로드 화면 로딩
	@RequestMapping(value="goodsImgUploadForm.do", method = RequestMethod.GET)
    public String goodsImgUploadForm(Model model) throws Exception {
		List<NavbarDTO> navbarList = homeService.navList();
		model.addAttribute("navbarList", navbarList);
        return "admin/goodsImgUploadForm";
    }
	
	//상품이미지 업로드
	@RequestMapping(value="goodsImgUploadPro.do", method = RequestMethod.POST)
    public String goodsImgUploadPro(MultipartFile myfile, Model model) throws UnsupportedEncodingException, Exception {
		String uploadFolder = "D:\\kim3\\jsp3\\web05\\src\\main\\webapp\\WEB-INF\\views\\upload"; //절대경로
		//String uploadFolder = "/WEB-INF/views/upload"; //상대경로
		String fileName = myfile.getOriginalFilename();
		File saveFile = new File(uploadFolder, fileName);
		myfile.transferTo(saveFile);
    	model.addAttribute("filename", fileName);
    	return "admin/goodsImgUploadForm";
    }
	
	//신상품(베스트 상품) 불러오기
	@RequestMapping(value="newGoodsLoading.do", method = RequestMethod.GET)
	public String newGoodsLoading(Model model) throws Exception {
		int cnt = goodsService.goodsCount();
		List<GoodsDTO> goodsList = homeService.latestGoods();
		model.addAttribute("cnt", cnt);
		model.addAttribute("cate_tit", "신상품");
		model.addAttribute("goodsList",goodsList);
		return "admin/goodsList";
	}	
        
    //카테고리 등록 폼
    @RequestMapping(value="cateForm.do", method = RequestMethod.GET)
    public String cateForm(Model model) throws Exception {
    	List<NavbarDTO> navbarList = homeService.navList();
    	model.addAttribute("navbarList",navbarList);
        return "admin/cateForm";
    }
    
    //상품 분류 코드 중복 조회
    @ResponseBody
    @RequestMapping(value="checkNav.do", method = RequestMethod.GET)
    public String checkNav(@RequestParam("navparam") String navparam) throws Exception {
    	String data = "";
    	int cnt = homeService.navCount(navparam); 
    	if(cnt >= 1) {
    		data = "no";
    	} else {
    		data = "ok";
    	}
    	return data;
    }
    
    //카테고리 등록 처리
    @RequestMapping(value="addCate.do", method = RequestMethod.POST)
    public String addCate(NavbarDTO navbar, Model model) throws Exception {
    	homeService.addCate(navbar);
    	return "redirect:/admin/admin.do";
    }
    
    //카테고리 삭제 처리
    @RequestMapping(value="delCate.do", method = RequestMethod.GET)
    public String delCate(@RequestParam("idx") int idx, Model model) throws Exception {
    	homeService.delCate(idx);
    	return "redirect:/admin/admin.do";
    }
    
    //회원 목록
	@RequestMapping(value="memberList.do", method = RequestMethod.GET)
    public String memberList(Model model) throws Exception {
		int cnt = memberService.memberCount();
		List<MemberDTO> memberList = memberService.memberList();
		model.addAttribute("cnt", cnt);
		model.addAttribute("memberList", memberList);
        return "admin/memberList";
    }
    
	//회원 상세 정보
	@RequestMapping(value="getMember.do", method = RequestMethod.GET)
    public String getMember(@RequestParam("id") String id, Model model) throws Exception {
		MemberDTO member = memberService.getMember(id);
		model.addAttribute("member", member);
        return "admin/getMember";
    }

    //직권 회원등록 폼 불러오기
    @RequestMapping(value="joinMemberForm.do", method = RequestMethod.GET)
	public String joinMemberForn(MemberDTO member, Model model) throws Exception {
		return "admin/joinForm";
	}
	
    //직권 회원등록
    @RequestMapping(value="addMember.do", method = RequestMethod.POST)
	public String addMember(MemberDTO member, Model model) throws Exception {
    	String reqpass = member.getPwd();
    	String pwd = passEncoder.encode(reqpass);
    	member.setPwd(pwd);
    	memberService.joinMember(member);
		return "admin/memberList";
	}
	
	//직권 회원 강제탈퇴
    @RequestMapping(value="deleteMember.do", method = RequestMethod.GET)
    public String deleteMember(@RequestParam("id") String id, MemberDTO member) throws Exception {
    	member.setId(id);
		memberService.deleteMember(member);
		return "admin/memberList";
    }
    
    //직권 회원정보 수정
    @RequestMapping(value="updateMember.do", method = RequestMethod.POST)
	public String updateMember(MemberDTO member) throws Exception {
    	sendEmailAction(member);	//정보 (비밀번호)변경 이메일 보내기
    	String reqpass = member.getPwd();
    	String pwd = passEncoder.encode(reqpass);
    	member.setPwd(pwd);
    	memberService.updateMember(member);
		return "admin/memberList";
	}
    
    //비밀번호 변경 이메일 보내기
    public void sendEmailAction(MemberDTO member) throws Exception {
    	String id = member.getId();
    	String e_mail = member.getEmail();
    	String pw = member.getPwd();
    	System.out.println(pw);
    	if(pw!=null) {
    		email2.setContent("비밀번호는 "+pw+" 입니다.");
    		email2.setReceiver(e_mail);
    		email2.setSubject(id+"님 비밀번호 변경 이메일입니다.");
    		emailSender2.SendEmail(email2);
    	}
    }

    //공지사항 등록 폼 로딩
    @RequestMapping(value="adminNoticeForm.do", method = RequestMethod.GET)
    public String adminNoticeForm() {
    	return "admin/adminNoticeForm";
    }
    

	//DataTables jQuery 플러그인을 활용한 목록
	@RequestMapping(value="noticeList.do", method = RequestMethod.GET)
    public String noticeList(Model model) throws Exception {
		List<NoticeDTO> noticeList = noticeService.noticeList();
		int cnt = noticeService.noticeCount();
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("cnt", cnt);
        return "admin/noticeList";
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
        return "admin/noticePageList";
    }
	
	//일반 글쓰기 폼을 호출 
	@RequestMapping(value="addNoticeForm.do", method = RequestMethod.GET)
    public String addNoticeForm(Model model) throws Exception {
        return "admin/addNoticeForm";
    }
	
	//일반 글쓰기 처리
	@RequestMapping(value="addNotice.do", method = RequestMethod.POST)
    public String addNotice(NoticeDTO notice, Model model) throws Exception {
		noticeService.addNotice(notice);
        return "redirect:/admin/noticeList.do";
    }
	
	/* ckeditor 폼 호출 */ 
	@RequestMapping(value="addSmartNoticeForm.do", method = RequestMethod.GET)
    public String addNoticeSmartForm(Model model) throws Exception {
        return "admin/addSmartNoticeForm";
    }
	
	/* ckeditor를 활용한 글쓰기 처리 */
	@RequestMapping(value="addSmartNotice.do", method = RequestMethod.POST)
    public String addSmartNotice(NoticeDTO notice, Model model) throws Exception {
		noticeService.addNotice(notice);
        return "redirect:/admin/pageList.do";
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
        return "admin/noticeRead";
    }
	
	@RequestMapping(value="updateNotice.do", method = RequestMethod.POST)
    public String updateNotice(NoticeDTO notice, Model model) throws Exception {
		noticeService.updateNotice(notice);
		return "redirect:/admin/noticeList.do";
    }
	
	@RequestMapping(value="deleteNotice.do", method = RequestMethod.GET)
    public String deleteNotice(@RequestParam("seq") int seq, Model model) throws Exception {
		NoticeDTO notice = new NoticeDTO();
		notice.setSeq(seq);
		noticeService.deleteNotice(notice);
		return "redirect:/admin/noticeList.do";
    }
    
	//메뉴에서 목록을 눌렀을 경우는 a태그에 의한 GET방식 호출되었을 때
	@RequestMapping(value="qnaList.do", method = RequestMethod.GET)
	public String qnaBasicList(Model model) throws Exception {
		List<QnaDTO> qnaList = qnaService.qnaList();
		model.addAttribute("qnaList", qnaList);
		return "admin/qnaList";
	}
	
	//검색 창(Form)에서 검색 방법과 검색어를 입력받아 처리하는 POST 방식
	@RequestMapping(value="qnaList.do", method = RequestMethod.POST)
	public String qnaList(SearchDTO sdto, Model model) throws Exception {
		List<QnaDTO> qnaList = qnaService.qnaList(sdto);
		model.addAttribute("qnaList", qnaList);
		return "admin/qnaList";
	}

	@RequestMapping(value="qnaRead.do", method = RequestMethod.GET)
	public String qnaRead(@RequestParam int qno, Model model) throws Exception {
		QnaDTO qna = qnaService.qnaRead(qno);
		model.addAttribute("qna", qna);
		return "admin/qnaRead";
	}

	@RequestMapping(value="replyRead.do", method = RequestMethod.GET)
	public String replyRead(@RequestParam int qno, Model model) throws Exception {
		QnaDTO qna = qnaService.replyRead(qno);
		model.addAttribute("qna", qna);
		return "admin/replyRead";
	}
	
	@RequestMapping("qnaWriteForm.do")  
	public String qnaWriteForm(Model model) throws Exception {
		return "admin/qnaWriteForm";
	}
	
	@RequestMapping(value="replyForm.do", method=RequestMethod.GET)  
	public String replyWriteForm(@RequestParam int qno, Model model) throws Exception {
		QnaDTO qna = qnaService.qnaRead(qno);
		model.addAttribute("qna", qna);
		return "admin/replyWriteForm";
	}
	
	@RequestMapping(value="qnaInsert.do", method = RequestMethod.POST)
	public String qnaWrite(QnaDTO qdto, Model model) throws Exception {
		qnaService.qnaWrite(qdto);
		return "redirect:/admin/qnaList.do";
	}

	@RequestMapping(value="replyInsert.do", method = RequestMethod.POST)
	public String replyWrite(QnaDTO qdto, Model model) throws Exception {
		qnaService.replyWrite(qdto);
		return "redirect:/admin/qnaList.do";
	}
	
	@RequestMapping(value="qnaUpdate.do", method = RequestMethod.POST)
	public String qnaUpdate(QnaDTO qdto, Model model) throws Exception {
		qnaService.qnaUpdate(qdto);
		return "redirect:/admin/qnaList.do";
	}

	@RequestMapping(value="qnaDelete.do", method = RequestMethod.GET)
	public String qnaDelete(@RequestParam int qno, Model model) throws Exception {
		qnaService.qnaDelete(qno);
		return "redirect:/admin/qnaList.do";
	}
	
	@RequestMapping(value="replyDelete.do", method = RequestMethod.GET)
	public String replyDelete(@RequestParam int qno, Model model) throws Exception {
		qnaService.replyDelete(qno);
		return "redirect:/admin/qnaList.do";
	}
    
    //판매 목록
	//결제 목록 보기
	@RequestMapping(value="salesList.do", method = RequestMethod.GET)
    public String salesList(Model model) throws Exception {
		List<SalesDTO> salesList = salesService.salesList();
		model.addAttribute("salesList", salesList);
        return "admin/salesList";
    }
    
    //배송지 배정
	//배송처리 화면 로딩
	@RequestMapping(value="addShuttleForm.do", method = RequestMethod.GET)
	public String addShuttleForm(int ono, Model model) throws Exception {
		SalesDTO sale = salesService.salesRead(ono);
		model.addAttribute("sales", sale);
		return "admin/addShuttleForm";
	}

	//판매된 제품의 배송 처리
	@RequestMapping(value="addShuttle.do", method = RequestMethod.POST)
	public String addShuttle(SalesDTO sales, Model model) throws Exception {
		System.out.println("배송코드 : "+sales.getTransno());
		System.out.println("배송사 : "+sales.getTransco());
		salesService.addShipping(sales);
		return "admin/admin";
	}
	
	//DataTables jQuery 플러그인을 활용한 목록
	@RequestMapping(value="reviewList.do", method = RequestMethod.GET)
    public String reviewList(Model model) throws Exception {
		List<ReviewDTO> reviewList = reviewService.reviewAllList();
		int cnt = reviewService.reviewCount();
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("cnt", cnt);
        return "admin/reviewList";
    }
}