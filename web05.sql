create database myshop;
commit;
use myshop;


-- 등급이 없는 member 테이블
create table member(
id varchar(12),
pwd varchar(12) not null,
uname varchar(20) not null,
birth date,
phone varchar(13) not null,
email varchar(50) not null,
regdate date default (current_date),
primary key(id), unique key(email), unique key(phone)
);

use myshop;

drop table member;

-- 등급이 있는 member 테이블
create table member(
id varchar(12),
pwd varchar(12) not null,
uname varchar(20) not null,
birth date,
phone varchar(13) not null,
email varchar(50) not null,
regdate date default (current_date),
grade int default 0,
primary key(id)
);

alter table member modify pwd varchar(200) not null;

insert into member(id, pwd, uname, birth, phone, email, grade) values ('admin','1234','관리자','2022-06-28','031-902-1777', 'admin@kktshop.com', 9);
insert into member(id, pwd, uname, birth, phone, email) values ('kkt','1111','김기태','1979-12-25','010-123-1111', 'kkt@kktshop.com');
insert into member(id, pwd, uname, birth, phone, email) values ('give','2222','기브','1987-08-12','010-123-2222', 'give@kktshop.com');
insert into member(id, pwd, uname, birth, phone, email) values ('take','3333','테이크','1994-03-02','010-123-3333', 'take@kktshop.com');
insert into member(id, pwd, uname, birth, phone, email) values ('kmgt','4444','케이엠지티','2000-10-18','031-123-4444', 'kmgt@kktshop.com');

update member set pwd='$2a$10$b6I1c3h7uQly5NdnAAfJNuw3dZ2bQ8a.fcWZ9rPlyoV/DqBcg9TbK' where id='admin';
update member set pwd='$2a$10$iu1NChJlChC0vPJmtsBMjuvR8NkNZ4HPqFzkTCpAqQOf9Tg9.UiVS' where id='kkt';
update member set pwd='$2a$10$zgXTrRjseH1v3bHx7KuapOOIdJIooATPNPmixVB5xQIHOvvVA8xWG' where id='give';
update member set pwd='$2a$10$MZrcBnc8kg82fpjeGfidbOrN.yekeLASNLxIHAgauxE1PWWjVfsPe' where id='take';
update member set pwd='$2a$10$COkMZpbZKojH1FRLqnZ80uimxfoEf1tO2XdzN2jYXZNL74/OpTiY6' where id='kmgt';
-- (current_date) : 오늘 날짜
-- (current_time) : 현재 시간
-- current_timestamp : 현재 지역의 시간
-- now() : 현재 날짜와 시간

select * from member;
select count(*) as 인원수 from member;

commit;

-- 공지사항 테이블 notice
create table notice(
seq int not null auto_increment,
title varchar(100) not null,
content varchar(800) not null,
nickname varchar(20),
regdate date default (now()),
visited int default 0,
primary key (seq));

-- 글 등록 addNotice
-- insert into notice(title, content, nickname) value (#{title}, #{content}, 'admin')

-- 글 수정 updateNotice
-- update notice set title=#{title}, content=#{content}, regdate=now() where seq=#{seq}

-- 글 삭제 deleteNotice
-- delete from notice where seq=#{seq}

-- 글 목록 noticeList
select * from notice;

-- 특정 글 읽기 noticeRead
-- select * from notice where seq=#{seq}
use myshop;

drop table qna;

-- 묻고 답하기 qna
create table qna(
qno int not null auto_increment,
qtitle varchar(255) not null,
qcontent varchar(1000) not null,
qwriter varchar(20) not null,
qwritedate date default (now()),
qreadcnt int default 0,
qroot int,
qstep int default 0,
qindent int default 0,
primary key (qno));

select * from qna;

delete from qna where qno=6;

commit;
-- 질문하기 - addQuestion
-- insert into qna(qtitle, qcontent, qwriter, qstep, qindent) values (#{qtitle}, #{qcontent}, #{qwriter}, 0, 0);
-- update qna set qroot=qno where qno=#{qno} - updateQuestion

update qna set qroot=qno where qno=1;

-- 답변하기 - addReply
-- insert into qna(qtitle, qcontent, qwriter, qroot, qstep, qindent) values (#{qtitle}, #{qcontent}, #{qwriter}, #{qroot}, 1, 14)

-- 묻고 답하기 글 수정 - updateQna
-- update qna set qtitle=#{qtitle}, qcontent=#{qcontent}, qwriter=#{qwriter}, qwritedate=now() where qno=#{qno}

-- 질문 삭제 deleteQuestion
-- delete from qna where qroot=#{qno}

-- 답글 삭제 deleteReply
-- delete from qna where qno=#{qno}

-- 묻고 답하기 글 목록 qnaList
select * from qna order by qroot asc, qno asc, qstep asc, qwritedate desc;

-- 질문 글 읽기 - questionRead
-- select * from qna where qroot=#{qno} order by qroot asc

-- 답변 읽기 - replyRead
-- select * from qna where qno=#{qno}


-- 리뷰 테이블 review
create table review(
uno int not null auto_increment,
gnum int,
userid varchar(20),
subject varchar(100),
content varchar(800),
regdate date default (now()),
visited int default 0,
primary key (uno)
);

-- 리뷰 쓰기 addReview
-- insert into review(gnum, userid, subject, content) values (#{gnum}, #{userid}, #{subject}, #{content}) 

insert into review(gnum, userid, subject, content) values (3, 'kkt', '좋아요', '이 제품 좋아요'); 
insert into review(gnum, userid, subject, content) values (3, 'admin', '좋아요', '이 제품 아주 괜찮습니다.'); 

-- 리뷰 삭제 deleteReview
-- delete from review where uno=#{uno}

-- 리뷰 수정 updateReview
-- update review set userid=#{userid}, subject=#{subject}, content=#{content}, regdate=now() where uno=#{uno}

-- 리뷰 목록 reviewList
-- select * from review where gnum=#{gnum} order by regdate desc;

select * from review;

commit;

drop table goods;

-- 상품 테이블 goods
create table goods(
gnum int not null auto_increment,
gname varchar(50) not null,
ccode varchar(30) not null,
gprice int not null,
gstock int,
gdes varchar(500),
gimg varchar(200),
regdate date default (current_date),
primary key(gnum)
);

-- 상품 추가
insert into goods(gname, ccode, gprice, gstock, gdes, gimg) values ("나시 슬리브 가디건", "A01", 18000, 5, "스윗 나시 슬리브리스 반팔 가디건 세트 SET", "a010001.gif.webp");
insert into goods(gname, ccode, gprice, gstock, gdes, gimg) values ("부클 니트 가디건", "A01", 21000, 3, "르네 박시핏 부클 니트 가디건", "a010002.gif.webp");
insert into goods(gname, ccode, gprice, gstock, gdes, gimg) values ("크롭 자켓", "A02", 27000, 5, "마틸다 린넨 크롭자켓", "a020001.gif.webp");
insert into goods(gname, ccode, gprice, gstock, gdes, gimg) values ("야상 자켓", "A02", 22000, 4, "더블링 퍼프 크롭 야상 자켓", "a020002.jpg");

select * from goods;


-- 상품 등록  addGoods
-- insert into goods(gname, ccode, gprice, gstock, gdes, gimg) values (#{gname}, #{ccode}, #{gprice}, #{gstock}, #{gdes}, #{gimg})

-- 상품 정보 수정 updateGoods
-- update goods set gname=#{gname}, ccode=#{ccode}, gprice=#{gprice}, gstock=#{gstock}, gdes=#{gdes}, gimg=#{gimg}, regdate=(current_date) from gnum=#{gnum}

-- 상품 삭제 deleteGoods
-- delete from goods where gnum=#{gnum};

-- 상품 목록 goodsList
select * from goods order by regdate desc;

-- 상품 정보 보기 getGoods
-- select * from goods where gnum=#{gnum}



-- 상품 카테고리
create table category (
    cname     varchar(20)    not null,
    ccode     varchar(30)    not null,
    ccoderef  varchar(30)    null,
    primary key(ccode)
);

set foreign_key_checks = 0; 
drop table category;

-- 상품 테이블에 ccode를 상품 카테고리의 carecode를 외래키로 등록하여 상품 카테고리의 참조 무결성을 설정
alter table goods add constraint fk_category foreign key (ccode) references category(ccode);

-- 상품 카테고리 등록
-- insert into category values (#{cname}, #{ccode}, #{ccoderef})

-- 상품 카테고리는 상품과 관련이 있으므로 삭제나 수정이 불가능함 - 만약, 강제 삭제시에는 상품 테이블의 참조 무결성이 위배됨

use myshop;

-- 장바구니 테이블 cart
create table cart(
bno int not null auto_increment,
userid varchar(20),
gno int,
gcolor varchar(40),
amount int,
gsize varchar(40),
bdate Date default (current_date),
primary key (bno)
);

-- 장바구니 담기 addCart
-- insert into cart(userid, gno, gcolor, amount, gsize) value (#{userid}, #{gno}, #{gcolor}, #{amount}, #{gsize})

-- 장바구니 정보 변경 updateCart
-- update cart set gno=#{gno}, gcolor=#{gcolor}, amount=#{amount}, gsize=#{gsize}, bdate=(current_date) where bno=#{bno}

-- 장바구니 삭제 deleteCart
-- delete from cart where bno=#{bno}

-- 장바구니 목록 cartList
-- select * from cart where userid=#{userid};

-- 장바구니 검색 cartRead
-- select * from cart where bno=#{bno} and userid=#{userid}

use myshop;

drop table sales;

-- 결재 및 주문 테이블 sales
create table sales(
ono int not null auto_increment,
paytype varchar(50),
payplace varchar(100),
payno varchar(50),
money int,
sdate date,
gno int,
amount int,
userid varchar(20),
rname varchar(30),
tel varchar(20),
addr1 varchar(200),
addr2 varchar(100),
postcode varchar(10),
transno varchar(50),
transco varchar(50),
rstate varchar(20),
rdate date,
memo varchar(100),
primary key (ono));

alter table sales modify rdate Date;

use myshop;

commit;

select * from sales;

-- 결제 및 주문 처리 addSales
-- insert into sales(paytype, payno, meney, sdate, gno, amount, userid, rname, tel, addr1, addr2, postcode, memo) values
-- (#{paytype}, #{payno}, #{meney}, #{sdate}, #{gno}, #{amount}, #{userid}, #{rname}, #{tel}, #{addr1}, #{addr2}, #{postcode}, #{memo}

-- 배송 처리 addShipping
-- update sales set transno=#{transno}, transco=#{transco}, rstate=#[rstate}, rdate=#{rdate} where ono=#{ono}

-- 받는 사람 수정 updateSales
-- update sales set rname=#{rname}, tel=#{tel}, addr1=#{addr1}, addr2=#{addr2}, postcode=#{postcode} where ono=#{ono}

-- 결제 취소 deleteSales
-- delete from sales where ono=#{ono}

-- 판매 목록 salesList
select * from sales;

-- 판매 건수 조회 salesCount
select count(*) from sales;



-- 특정 판매건 정보 조회 salesRead
-- select * from sales where ono=#{ono};

commit;





-- 사용자
CREATE TABLE user (
  IDX int(11) NOT NULL AUTO_INCREMENT,
  ID varchar(45) NOT NULL,
  EMAIL varchar(100) NOT NULL,
  NAME varchar(45) NOT NULL,
  PASSWORD varchar(45) NOT NULL,
  GRADE int(11) DEFAULT '0',
  REGDATE timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (IDX),
  UNIQUE KEY EMAIL_UNIQUE (EMAIL),
  UNIQUE KEY ID_UNIQUE (ID)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;





-- 게시판
-- 상품
-- 결제
-- 기타 테이블

use myshop;
create table databank(
seq int not null auto_increment,
title varchar(200) not null,
fileurl varchar(300) not null,
author varchar(20),
primary key (seq));

commit;
 
select * from databank;

create table jumsu(
	num int,
    score int
);

select * from jumsu;

desc jumsu;

delete from jumsu;

use myshop;

drop table navbar;

create table navbar(
idx int not null auto_increment,
dept int not null,
navname varchar(50) not null,
navparam varchar(50),
navurl varchar(200),
primary key (idx));

delete from navbar;
commit;  
insert into navbar (dept, navname, navparam, navurl) values (0,"아우터","A","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (0,"상의","B","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (0,"셔츠/블라우스","C","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (0,"트레이닝","D","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (0,"베이직","E","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (0,"원피스","F","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (0,"스커트","G","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (0,"팬츠","H","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (0,"가방","I","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (0,"신발","J","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (0,"악세사리","K","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (0,"기타","L","prolist.do");

insert into navbar (dept, navname, navparam, navurl) values (1,"가디건/조끼","A01","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"야상/점퍼","A02","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"자켓/코트","A03","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"패딩","A04","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"플리스","A05","prolist.do");

insert into navbar (dept, navname, navparam, navurl) values (1,"긴팔티셔츠","B01","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"맨트맨","B02","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"후드","B03","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"반팔티셔츠","B04","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"민소매","B05","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"니트","B06","prolist.do");

insert into navbar (dept, navname, navparam, navurl) values (1,"여성용 블라우스","C01","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"남성용 블라우스","C02","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"여성용 Y셔츠 반팔","C03","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"여성용 Y셔츠 긴팔","C04","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"남성용 Y셔츠 반팔","C05","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"남성용 Y셔츠 긴팔","C06","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"남녀공용 Y셔츠","C07","prolist.do");

insert into navbar (dept, navname, navparam, navurl) values (1,"남자","D01","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"여자","D02","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"유아/아동","D03","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"빅사이즈","D04","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"스포츠브랜드","D05","prolist.do");

insert into navbar (dept, navname, navparam, navurl) values (1,"남자 정장","E01","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"여자 정장","E02","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"세미 정장","E03","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"출근복 올세트","E04","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"외출복 올세트","E05","prolist.do");

insert into navbar (dept, navname, navparam, navurl) values (1,"미니 원피스","F01","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"롱 원피스","F02","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"투피스","F03","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"점프 슈트","F04","prolist.do");

insert into navbar (dept, navname, navparam, navurl) values (1,"미니 스커트","G01","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"미디 스커트","G02","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"롱 스커트","G03","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"치마바지","G04","prolist.do");

insert into navbar (dept, navname, navparam, navurl) values (1,"청바지","H01","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"롱팬츠","H02","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"면바지","H03","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"슬랙스","H04","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"레깅스","H05","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"숏팬츠","H06","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"브랜드 하의","H07","prolist.do");

insert into navbar (dept, navname, navparam, navurl) values (1,"백팩","I01","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"스쿨백","I02","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"크로스백","I03","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"토드백","I04","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"기타 백","I05","prolist.do");

insert into navbar (dept, navname, navparam, navurl) values (1,"운동화","J01","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"단화","J02","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"구두","J03","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"워커","J04","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"샌들","J05","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"슬리퍼","J06","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"장화","J07","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"등산화","J08","prolist.do");

insert into navbar (dept, navname, navparam, navurl) values (1,"주얼리","K01","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"모자","K02","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"벨트","K03","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"양말","K04","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"스타킹","K05","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"기타","K06","prolist.do");

insert into navbar (dept, navname, navparam, navurl) values (1,"맞춤복","L01","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"단체복","L02","prolist.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"선물","L03","prolist.do");

commit;

use myshop;

delete from navbar where idx=78;

select * from navbar;

update navbar set navurl="goods/prolist.do" where navurl="prolist.do";

insert into navbar (dept, navname, navparam, navurl) values (0,"커뮤니티","Z","cummunity.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"공지사항","Z","notice.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"공지사항","Z","notice.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"공지사항","Z","notice.do");
insert into navbar (dept, navname, navparam, navurl) values (1,"공지사항","Z","notice.do");

-- 베스트 상품 - 팔린 상품이 최소 6개 이상 존재해야함 
select * from goods where gnum in (select gno from (select gno, count(gno) as cnt from sales group by gno order by cnt desc limit 5));

select gno, COUNT(gno) AS cnt from sales group by gno order by cnt desc limit 5;

select gnum, COUNT(gnum) AS cnt from goods group by gnum order by gstock desc limit 3;
