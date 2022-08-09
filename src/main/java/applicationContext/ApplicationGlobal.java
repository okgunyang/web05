package applicationContext;

import org.springframework.context.annotation.Configuration;

import com.kktshop.dto.CartDTO;
import com.kktshop.dto.CategoryDTO;
import com.kktshop.dto.DatabankDTO;
import com.kktshop.dto.GoodsDTO;
import com.kktshop.dto.MemberDTO;
import com.kktshop.dto.NavbarDTO;
import com.kktshop.dto.NoticeDTO;
import com.kktshop.dto.QnaDTO;
import com.kktshop.dto.ReviewDTO;
import com.kktshop.dto.SalesDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Configuration
@Getter
@Setter
@AllArgsConstructor
public class ApplicationGlobal {
	private CartDTO cart;
	private GoodsDTO goods;
	private NoticeDTO notice;
	private CategoryDTO category;
	private DatabankDTO databank;
	private MemberDTO member;
	private NavbarDTO navbar;
	private QnaDTO qna;
	private ReviewDTO review;
	private SalesDTO sales;
}