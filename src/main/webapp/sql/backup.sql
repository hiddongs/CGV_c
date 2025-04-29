--------------------------------------------------------
--  파일이 생성됨 - 월요일-4월-28-2025   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence EVENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "STEAM01"."EVENT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence MEMBER_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "STEAM01"."MEMBER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence MOVIE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "STEAM01"."MOVIE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CHAT
--------------------------------------------------------

  CREATE TABLE "STEAM01"."CHAT" 
   (	"CHAT_ID" NUMBER, 
	"CHATROOM_ID" NUMBER, 
	"CHAT_DATE" DATE, 
	"MESSAGE" VARCHAR2(900 BYTE), 
	"SEND" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."CHAT"."CHAT_ID" IS '채팅ID';
   COMMENT ON COLUMN "STEAM01"."CHAT"."CHATROOM_ID" IS '채팅방 고유 ID';
   COMMENT ON COLUMN "STEAM01"."CHAT"."CHAT_DATE" IS '채팅방 ID';
   COMMENT ON COLUMN "STEAM01"."CHAT"."MESSAGE" IS '관리자와 사용자 채팅 내용';
   COMMENT ON COLUMN "STEAM01"."CHAT"."SEND" IS '보낸사람';
--------------------------------------------------------
--  DDL for Table CHATROOM
--------------------------------------------------------

  CREATE TABLE "STEAM01"."CHATROOM" 
   (	"CHATROOM_ID" NUMBER, 
	"MEMBER_ID" NUMBER, 
	"ROOM_DATE" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."CHATROOM"."CHATROOM_ID" IS '채팅방 고유 ID';
   COMMENT ON COLUMN "STEAM01"."CHATROOM"."MEMBER_ID" IS '유저 식별자';
   COMMENT ON COLUMN "STEAM01"."CHATROOM"."ROOM_DATE" IS '채팅방 개설일';
--------------------------------------------------------
--  DDL for Table COUPON
--------------------------------------------------------

  CREATE TABLE "STEAM01"."COUPON" 
   (	"COUPON_ID" NUMBER, 
	"CODE" VARCHAR2(50 BYTE), 
	"DISCOUNT_AMOUNT" NUMBER, 
	"EXPIRE_DATE" DATE, 
	"MEMBER_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."COUPON"."COUPON_ID" IS '쿠폰_고유_아이디';
   COMMENT ON COLUMN "STEAM01"."COUPON"."CODE" IS '쿠폰_코드';
   COMMENT ON COLUMN "STEAM01"."COUPON"."DISCOUNT_AMOUNT" IS '할인 금액';
   COMMENT ON COLUMN "STEAM01"."COUPON"."EXPIRE_DATE" IS '쿠폰 만료일';
   COMMENT ON COLUMN "STEAM01"."COUPON"."MEMBER_ID" IS '쿠폰 소유자';
--------------------------------------------------------
--  DDL for Table EVENT
--------------------------------------------------------

  CREATE TABLE "STEAM01"."EVENT" 
   (	"EVENT_ID" NUMBER, 
	"TITLE" VARCHAR2(200 BYTE), 
	"CONTENT" CLOB, 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"TYPE" VARCHAR2(20 BYTE), 
	"POSTER_URL" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "STEAM01"."EVENT"."EVENT_ID" IS '이벤트 고유 ID';
   COMMENT ON COLUMN "STEAM01"."EVENT"."TITLE" IS '이벤트 제목';
   COMMENT ON COLUMN "STEAM01"."EVENT"."CONTENT" IS '이벤트 내용';
   COMMENT ON COLUMN "STEAM01"."EVENT"."START_DATE" IS '이벤트 시작일';
   COMMENT ON COLUMN "STEAM01"."EVENT"."END_DATE" IS '이벤트 종료일';
   COMMENT ON COLUMN "STEAM01"."EVENT"."TYPE" IS '영화/제휴';
--------------------------------------------------------
--  DDL for Table EVENT_NOTICE
--------------------------------------------------------

  CREATE TABLE "STEAM01"."EVENT_NOTICE" 
   (	"EVENT_NOTICE_ID" NUMBER, 
	"MEMBER_ID" NUMBER, 
	"EVENT_ID" NUMBER, 
	"E_NAME" VARCHAR2(100 BYTE), 
	"E_CONTENT" VARCHAR2(300 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."EVENT_NOTICE"."EVENT_NOTICE_ID" IS '당첨자 고유 ID';
   COMMENT ON COLUMN "STEAM01"."EVENT_NOTICE"."MEMBER_ID" IS '유저 식별자';
   COMMENT ON COLUMN "STEAM01"."EVENT_NOTICE"."EVENT_ID" IS '이벤트 고유 ID';
   COMMENT ON COLUMN "STEAM01"."EVENT_NOTICE"."E_NAME" IS '당첨자 발표 글 제목';
   COMMENT ON COLUMN "STEAM01"."EVENT_NOTICE"."E_CONTENT" IS '당점차 발표 글 내용';
--------------------------------------------------------
--  DDL for Table EVENT_USER
--------------------------------------------------------

  CREATE TABLE "STEAM01"."EVENT_USER" 
   (	"EVENT_USER_ID" NUMBER, 
	"MEMBER_ID" NUMBER
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."EVENT_USER"."EVENT_USER_ID" IS '이벤트 신청자 ID';
   COMMENT ON COLUMN "STEAM01"."EVENT_USER"."MEMBER_ID" IS '유저 식별자';
--------------------------------------------------------
--  DDL for Table INQUIRY
--------------------------------------------------------

  CREATE TABLE "STEAM01"."INQUIRY" 
   (	"INQUIRY_ID" NUMBER, 
	"MEMBER_ID" NUMBER, 
	"TITLE" VARCHAR2(200 BYTE), 
	"CONTENT" CLOB, 
	"REG_DATE" DATE, 
	"STATUS" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;

   COMMENT ON COLUMN "STEAM01"."INQUIRY"."INQUIRY_ID" IS '1:1 문의 고유 ID';
   COMMENT ON COLUMN "STEAM01"."INQUIRY"."MEMBER_ID" IS '문의 작성자';
   COMMENT ON COLUMN "STEAM01"."INQUIRY"."TITLE" IS '문의 제목';
   COMMENT ON COLUMN "STEAM01"."INQUIRY"."CONTENT" IS '문의 내용';
   COMMENT ON COLUMN "STEAM01"."INQUIRY"."REG_DATE" IS '문의 작성일';
   COMMENT ON COLUMN "STEAM01"."INQUIRY"."STATUS" IS '답변 대기 / 완료';
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "STEAM01"."MEMBER" 
   (	"MEMBER_ID" NUMBER, 
	"USER_ID" VARCHAR2(50 BYTE), 
	"PASSWORD" VARCHAR2(50 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"REG_DATE" DATE, 
	"GENDER" VARCHAR2(10 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"GRADE" VARCHAR2(20 BYTE) DEFAULT 'STANDARD', 
	"ADDRESS" VARCHAR2(200 BYTE), 
	"POINT" NUMBER(8,0) DEFAULT 0, 
	"EMAIL" VARCHAR2(254 BYTE), 
	"ADDRESS_DETAIL" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."MEMBER"."MEMBER_ID" IS '유저 식별자';
   COMMENT ON COLUMN "STEAM01"."MEMBER"."USER_ID" IS '로그인 ID';
   COMMENT ON COLUMN "STEAM01"."MEMBER"."PASSWORD" IS '암호화 비밀번호';
   COMMENT ON COLUMN "STEAM01"."MEMBER"."NAME" IS '사용자 이름';
   COMMENT ON COLUMN "STEAM01"."MEMBER"."REG_DATE" IS 'YYYY-MM-DD';
   COMMENT ON COLUMN "STEAM01"."MEMBER"."GENDER" IS '남성/여성';
   COMMENT ON COLUMN "STEAM01"."MEMBER"."PHONE" IS '- 포함한 휴대폰 번호';
   COMMENT ON COLUMN "STEAM01"."MEMBER"."GRADE" IS '회원 등급';
   COMMENT ON COLUMN "STEAM01"."MEMBER"."ADDRESS" IS '기본 주소';
   COMMENT ON COLUMN "STEAM01"."MEMBER"."POINT" IS 'CJ포인트';
   COMMENT ON COLUMN "STEAM01"."MEMBER"."EMAIL" IS '이메일';
   COMMENT ON COLUMN "STEAM01"."MEMBER"."ADDRESS_DETAIL" IS '상세 주소';
--------------------------------------------------------
--  DDL for Table MOVIE
--------------------------------------------------------

  CREATE TABLE "STEAM01"."MOVIE" 
   (	"MOVIE_ID" NUMBER, 
	"TITLE" VARCHAR2(100 BYTE), 
	"DIRECTOR" VARCHAR2(50 BYTE), 
	"ACTOR" VARCHAR2(200 BYTE), 
	"GENRE" VARCHAR2(200 BYTE), 
	"RUNTIME" NUMBER(3,0), 
	"RELEASE_DATE" DATE, 
	"AGE_LIMIT" VARCHAR2(10 BYTE) DEFAULT 'ALL', 
	"POSTER_URL" VARCHAR2(255 BYTE), 
	"MOVIE_CREATE" DATE, 
	"DESCRIPTION" VARCHAR2(3000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."MOVIE"."MOVIE_ID" IS '고유 영화';
   COMMENT ON COLUMN "STEAM01"."MOVIE"."TITLE" IS '영화 제목';
   COMMENT ON COLUMN "STEAM01"."MOVIE"."DIRECTOR" IS '영화 감독';
   COMMENT ON COLUMN "STEAM01"."MOVIE"."ACTOR" IS '영화 배우';
   COMMENT ON COLUMN "STEAM01"."MOVIE"."GENRE" IS '영화 장르';
   COMMENT ON COLUMN "STEAM01"."MOVIE"."RUNTIME" IS '분단위';
   COMMENT ON COLUMN "STEAM01"."MOVIE"."RELEASE_DATE" IS '개봉일';
   COMMENT ON COLUMN "STEAM01"."MOVIE"."AGE_LIMIT" IS '관련 등긍(예:12세)';
   COMMENT ON COLUMN "STEAM01"."MOVIE"."POSTER_URL" IS '포스터 이미지 주소';
   COMMENT ON COLUMN "STEAM01"."MOVIE"."MOVIE_CREATE" IS '생성일';
   COMMENT ON COLUMN "STEAM01"."MOVIE"."DESCRIPTION" IS '영화설명';
--------------------------------------------------------
--  DDL for Table MOVIE_MEDIA
--------------------------------------------------------

  CREATE TABLE "STEAM01"."MOVIE_MEDIA" 
   (	"MEDIA_ID" NUMBER, 
	"MOVIE_ID" NUMBER, 
	"MEDIA_TYPE" VARCHAR2(20 BYTE), 
	"MEDIA_URL" VARCHAR2(200 BYTE), 
	"MEDIA_STATUS" NUMBER(1,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."MOVIE_MEDIA"."MEDIA_ID" IS '미디어 고유 ID';
   COMMENT ON COLUMN "STEAM01"."MOVIE_MEDIA"."MOVIE_ID" IS '고유 영화';
   COMMENT ON COLUMN "STEAM01"."MOVIE_MEDIA"."MEDIA_TYPE" IS '트레일러, 스틸컷';
   COMMENT ON COLUMN "STEAM01"."MOVIE_MEDIA"."MEDIA_URL" IS '영상 또는 이미지 URL';
   COMMENT ON COLUMN "STEAM01"."MOVIE_MEDIA"."MEDIA_STATUS" IS '개방 상태에 따라 Y 또는 N';
--------------------------------------------------------
--  DDL for Table MOVIE_TYPE
--------------------------------------------------------

  CREATE TABLE "STEAM01"."MOVIE_TYPE" 
   (	"MOVIE_ID" NUMBER, 
	"IMAX" VARCHAR2(10 BYTE) DEFAULT 'N', 
	"SCREENX" VARCHAR2(10 BYTE) DEFAULT 'N', 
	"4DX" VARCHAR2(10 BYTE) DEFAULT 'N', 
	"3D" VARCHAR2(10 BYTE) DEFAULT 'N', 
	"2D" VARCHAR2(20 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."MOVIE_TYPE"."MOVIE_ID" IS '고유 영화 식별자';
   COMMENT ON COLUMN "STEAM01"."MOVIE_TYPE"."IMAX" IS 'IMAX 관';
   COMMENT ON COLUMN "STEAM01"."MOVIE_TYPE"."SCREENX" IS 'SCREENX관';
   COMMENT ON COLUMN "STEAM01"."MOVIE_TYPE"."4DX" IS '4DX관';
   COMMENT ON COLUMN "STEAM01"."MOVIE_TYPE"."3D" IS 'SCREENX관';
   COMMENT ON COLUMN "STEAM01"."MOVIE_TYPE"."2D" IS '기본 평범한 영화관';
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "STEAM01"."NOTICE" 
   (	"NOTICE_ID" NUMBER, 
	"TITLE" VARCHAR2(200 BYTE), 
	"CONTENT" CLOB, 
	"REG_DATE" DATE, 
	"TYPE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;

   COMMENT ON COLUMN "STEAM01"."NOTICE"."NOTICE_ID" IS '공지 사항 고유 식별자';
   COMMENT ON COLUMN "STEAM01"."NOTICE"."TITLE" IS '공지 제목';
   COMMENT ON COLUMN "STEAM01"."NOTICE"."CONTENT" IS '공지 내용';
   COMMENT ON COLUMN "STEAM01"."NOTICE"."REG_DATE" IS '공지작성일';
   COMMENT ON COLUMN "STEAM01"."NOTICE"."TYPE" IS 'FAQ/공지/이벤트';
--------------------------------------------------------
--  DDL for Table POINT_LOG
--------------------------------------------------------

  CREATE TABLE "STEAM01"."POINT_LOG" 
   (	"LOG_ID" NUMBER, 
	"MEMBER_ID" NUMBER, 
	"AMOUNT" NUMBER, 
	"REASON" VARCHAR2(100 BYTE), 
	"DATE" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."POINT_LOG"."LOG_ID" IS '포인트 사용 내역 ID';
   COMMENT ON COLUMN "STEAM01"."POINT_LOG"."MEMBER_ID" IS '유저 식별자';
   COMMENT ON COLUMN "STEAM01"."POINT_LOG"."AMOUNT" IS '사용/적립 포인트';
   COMMENT ON COLUMN "STEAM01"."POINT_LOG"."REASON" IS '포인트 사유';
   COMMENT ON COLUMN "STEAM01"."POINT_LOG"."DATE" IS '적립/사용 날짜';
--------------------------------------------------------
--  DDL for Table PRICE
--------------------------------------------------------

  CREATE TABLE "STEAM01"."PRICE" 
   (	"PRICE_ID" NUMBER, 
	"P_MOIVE" NUMBER(8,0), 
	"WEEKEND" NUMBER(8,0), 
	"KIDS" NUMBER(8,0), 
	"AFTERNOON" NUMBER(8,0), 
	"MIDNIGHT" NUMBER(8,0), 
	"P_IMAX" NUMBER(8,0), 
	"P_SCREENX" NUMBER(8,0), 
	"P_4DX" NUMBER(8,0), 
	"P_3D" NUMBER(8,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."PRICE"."PRICE_ID" IS '가격정보 ID';
   COMMENT ON COLUMN "STEAM01"."PRICE"."P_MOIVE" IS '영화 기본 가격';
   COMMENT ON COLUMN "STEAM01"."PRICE"."WEEKEND" IS '주말 추가 가격';
   COMMENT ON COLUMN "STEAM01"."PRICE"."KIDS" IS '성인 가격에서 뺸 청소년 가격';
   COMMENT ON COLUMN "STEAM01"."PRICE"."AFTERNOON" IS '오후 추가 가격';
   COMMENT ON COLUMN "STEAM01"."PRICE"."MIDNIGHT" IS '심야 추가 가격';
   COMMENT ON COLUMN "STEAM01"."PRICE"."P_IMAX" IS '특별관 가격 가중치';
   COMMENT ON COLUMN "STEAM01"."PRICE"."P_SCREENX" IS '특별관 가격 가중치';
   COMMENT ON COLUMN "STEAM01"."PRICE"."P_4DX" IS '특별관 가격 가중치';
   COMMENT ON COLUMN "STEAM01"."PRICE"."P_3D" IS '특별관 가격 가중치';
--------------------------------------------------------
--  DDL for Table RESERVATION
--------------------------------------------------------

  CREATE TABLE "STEAM01"."RESERVATION" 
   (	"RERSERVATION_ID" NUMBER, 
	"MEMBER_ID" NUMBER, 
	"SCHEDULE_ID" NUMBER, 
	"SEAT_NUMBER" VARCHAR2(10 BYTE), 
	"PAYMENT_STATUS" VARCHAR2(20 BYTE), 
	"PAYMENT_DATE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."RESERVATION"."RERSERVATION_ID" IS '예매 고유 식별자';
   COMMENT ON COLUMN "STEAM01"."RESERVATION"."MEMBER_ID" IS '유저 식별자';
   COMMENT ON COLUMN "STEAM01"."RESERVATION"."SCHEDULE_ID" IS '상영스케줄 고유 ID';
   COMMENT ON COLUMN "STEAM01"."RESERVATION"."SEAT_NUMBER" IS '좌석 정보(예:A5)';
   COMMENT ON COLUMN "STEAM01"."RESERVATION"."PAYMENT_STATUS" IS '완료/대기';
   COMMENT ON COLUMN "STEAM01"."RESERVATION"."PAYMENT_DATE" IS '결제한 날짜';
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "STEAM01"."REVIEW" 
   (	"REVIEW_ID" VARCHAR2(255 BYTE), 
	"MEMBER_ID" NUMBER, 
	"MOVIE_ID" NUMBER, 
	"RATING" NUMBER(1,0), 
	"CONTENT" CLOB, 
	"REG_DATE" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;

   COMMENT ON COLUMN "STEAM01"."REVIEW"."REVIEW_ID" IS '고유 리뷰 식별자';
   COMMENT ON COLUMN "STEAM01"."REVIEW"."MEMBER_ID" IS '유저 식별자';
   COMMENT ON COLUMN "STEAM01"."REVIEW"."MOVIE_ID" IS '고유 영화';
   COMMENT ON COLUMN "STEAM01"."REVIEW"."RATING" IS '별점 평가';
   COMMENT ON COLUMN "STEAM01"."REVIEW"."CONTENT" IS '리뷰 내용';
   COMMENT ON COLUMN "STEAM01"."REVIEW"."REG_DATE" IS '작성 날짜';
--------------------------------------------------------
--  DDL for Table SCHEDULE
--------------------------------------------------------

  CREATE TABLE "STEAM01"."SCHEDULE" 
   (	"SCHEDULE_ID" NUMBER, 
	"THEATER_ID" NUMBER, 
	"MOVIE_ID" NUMBER, 
	"SCREENING_TIME" TIMESTAMP (6), 
	"PRICE" NUMBER, 
	"IS_MORNING" NUMBER(1,0), 
	"IS_NIGHT" NUMBER(1,0), 
	"IS_AVAILABLE" NUMBER(1,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."SCHEDULE"."SCHEDULE_ID" IS '상영스케줄 고유 ID';
   COMMENT ON COLUMN "STEAM01"."SCHEDULE"."THEATER_ID" IS '고유 극장 식별자';
   COMMENT ON COLUMN "STEAM01"."SCHEDULE"."MOVIE_ID" IS '고유 영화';
   COMMENT ON COLUMN "STEAM01"."SCHEDULE"."SCREENING_TIME" IS '상영시작일시';
   COMMENT ON COLUMN "STEAM01"."SCHEDULE"."PRICE" IS '기본가격';
   COMMENT ON COLUMN "STEAM01"."SCHEDULE"."IS_MORNING" IS 'Y또는N';
   COMMENT ON COLUMN "STEAM01"."SCHEDULE"."IS_NIGHT" IS 'Y또는N';
   COMMENT ON COLUMN "STEAM01"."SCHEDULE"."IS_AVAILABLE" IS 'Y또는N';
--------------------------------------------------------
--  DDL for Table SEAT
--------------------------------------------------------

  CREATE TABLE "STEAM01"."SEAT" 
   (	"SEAT_ID" NUMBER, 
	"THEATER_ID" NUMBER, 
	"ROW" VARCHAR2(5 BYTE), 
	"COLUMN" VARCHAR2(5 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."SEAT"."SEAT_ID" IS '좌석 고유 식별자';
   COMMENT ON COLUMN "STEAM01"."SEAT"."THEATER_ID" IS '고유 극장 식별자';
   COMMENT ON COLUMN "STEAM01"."SEAT"."ROW" IS '좌석 행';
   COMMENT ON COLUMN "STEAM01"."SEAT"."COLUMN" IS '좌석 열';
--------------------------------------------------------
--  DDL for Table THEATER
--------------------------------------------------------

  CREATE TABLE "STEAM01"."THEATER" 
   (	"THEATER_ID" NUMBER, 
	"REGION" VARCHAR2(50 BYTE), 
	"NAME" VARCHAR2(100 BYTE), 
	"DESCRIPTION" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "STEAM01"."THEATER"."THEATER_ID" IS '고유 극장 식별자';
   COMMENT ON COLUMN "STEAM01"."THEATER"."REGION" IS '극장지역';
   COMMENT ON COLUMN "STEAM01"."THEATER"."NAME" IS '지점 이름';
   COMMENT ON COLUMN "STEAM01"."THEATER"."DESCRIPTION" IS '극장 소개';
REM INSERTING into STEAM01.CHAT
SET DEFINE OFF;
REM INSERTING into STEAM01.CHATROOM
SET DEFINE OFF;
REM INSERTING into STEAM01.COUPON
SET DEFINE OFF;
REM INSERTING into STEAM01.EVENT
SET DEFINE OFF;
Insert into STEAM01.EVENT (EVENT_ID,TITLE,START_DATE,END_DATE,TYPE,POSTER_URL) values (3,'test23',to_date('25/04/02','RR/MM/DD'),to_date('25/05/02','RR/MM/DD'),'test','b4283a1a-1f1f-4e0a-8320-6dcd3b5a031d.jpg');
Insert into STEAM01.EVENT (EVENT_ID,TITLE,START_DATE,END_DATE,TYPE,POSTER_URL) values (2,'test',to_date('25/04/01','RR/MM/DD'),to_date('25/05/01','RR/MM/DD'),'test','fdad7eb9-776e-4151-8802-a92b051d3a93.jpg');
REM INSERTING into STEAM01.EVENT_NOTICE
SET DEFINE OFF;
REM INSERTING into STEAM01.EVENT_USER
SET DEFINE OFF;
REM INSERTING into STEAM01.INQUIRY
SET DEFINE OFF;
REM INSERTING into STEAM01.MEMBER
SET DEFINE OFF;
Insert into STEAM01.MEMBER (MEMBER_ID,USER_ID,PASSWORD,NAME,REG_DATE,GENDER,PHONE,GRADE,ADDRESS,POINT,EMAIL,ADDRESS_DETAIL) values (1,'admin','admin','관리자',to_date('25/04/21','RR/MM/DD'),'M','010-1111-2222','ADMIN','1',0,'admin@admin.com','1');
Insert into STEAM01.MEMBER (MEMBER_ID,USER_ID,PASSWORD,NAME,REG_DATE,GENDER,PHONE,GRADE,ADDRESS,POINT,EMAIL,ADDRESS_DETAIL) values (5,'1234','1234','관리자',to_date('25/04/21','RR/MM/DD'),'M','010-1111-2222','STANDARD','2',0,'admin@admin.com','2');
Insert into STEAM01.MEMBER (MEMBER_ID,USER_ID,PASSWORD,NAME,REG_DATE,GENDER,PHONE,GRADE,ADDRESS,POINT,EMAIL,ADDRESS_DETAIL) values (6,'12','123','관리자',to_date('25/04/21','RR/MM/DD'),'M','010-1111-2222','ADMIN','3',0,'admin@admin.com','3');
REM INSERTING into STEAM01.MOVIE
SET DEFINE OFF;
Insert into STEAM01.MOVIE (MOVIE_ID,TITLE,DIRECTOR,ACTOR,GENRE,RUNTIME,RELEASE_DATE,AGE_LIMIT,POSTER_URL,MOVIE_CREATE,DESCRIPTION) values (27,'전우치','최동훈','강동원,김윤석,임수정,유해진,김상호,백윤식,','액션',136,to_date('09/12/23','RR/MM/DD'),'12','1085bdb5.jpg',to_date('25/04/24','RR/MM/DD'),' 전설의 피리 ''만파식적''이 요괴 손에 넘어가 세상이 시끄럽자, 신선들은 당대 최고의 도인 천관대사(백윤식)와 화담(김윤석)에게 도움을 요청해 요괴를 봉인하고, ''만파식적''을 둘로 나눠 두 사람에게 각각 맡긴다. 한편, 천관대사의 망나니 제자 전우치(강동원)가 둔갑술로 임금을 속여 한바탕 소동을 일으키자, 신선들은 화담과 함께 천관대사를 찾아간다. 그러나 천관대사는 누군가에게 살해당하고 피리 반쪽이 사라졌다! 범인으로 몰린 전우치는 신선들에 의해 자신의 개 초랭이(유해진)와 함께 그림족자에 봉인된다.

어찌된 일인지 과거 봉인된 요괴들이 하나 둘 다시 나타나 세상을 어지럽힌다. 이제는 신부, 중, 점쟁이로 제각각 은둔생활을 즐기던 신선들은 다시 모여 화담을 찾지만, 500년 전 수행을 이유로 잠적한 그는 생사조차 알 수 없다. 고심 끝에 신선들은 박물관 전시품이 된 그림족자를 찾아 전우치와 초랭이를 불러낸다. 요괴들을 잡아 오면 봉인에서 완전히 풀어주겠다는 제안에 마지 못해 요괴 사냥에 나선 전우치. 그러나 전우치는 요괴사냥은 뒷전인 채 달라진 세상구경에 바쁘고, 한 술 더 떠 과거 첫눈에 반한 여인과 똑같은 얼굴을 한 서인경(임수정)을 만나 사랑놀음까지 시작한다. 전우치 때문에 골치를 앓는 신선들 앞에 때마침 화담이 나타나지만, 화담은 만파식적의 행방을 두고 전우치와 대적하는데…');
Insert into STEAM01.MOVIE (MOVIE_ID,TITLE,DIRECTOR,ACTOR,GENRE,RUNTIME,RELEASE_DATE,AGE_LIMIT,POSTER_URL,MOVIE_CREATE,DESCRIPTION) values (28,'부당거래','류승완','황정민,류승범,유해진,천호진','범죄,스릴러',119,to_date('10/10/28','RR/MM/DD'),'ALL','51bee448.jpg',to_date('25/04/24','RR/MM/DD'),'온 국민을 충격으로 몰아넣은 연쇄 살인 사건. 계속된 검거 실패로 대통령이 직접 사건에 개입하고, 수사 도중 유력한 용의자가 사망하는 사고가 발생하자 경찰청은 마지막 카드를 꺼내든다. 가짜 범인인 ‘배우’를 만들어 사건을 종결 짓는 것!

이번 사건의 담당으로 지목된 광역수사대 에이스 최철기(황정민). 경찰대 출신이 아니라는 이유 때문에 줄도, 빽도 없던 그는 승진을 보장해주겠다는 상부의 조건을 받아들이고 사건에 뛰어들게 된다. 그는 스폰서인 해동 장석구(유해진)를 이용해 ‘배우’를 세우고 대국민을 상대로 한 이벤트를 완벽하게 마무리 짓는다.

한편, 부동산 업계의 큰 손 태경 김회장으로부터 스폰을 받는 검사 주양(류승범)은 최철기가 입찰 비리건으로 김회장을 구속시켰다는 사실에 분개해 그의 뒤를 캐기 시작한다. 때마침 자신에게 배정된 연쇄 살인 사건의 범인을 조사하던 주양은 조사 과정에서 최철기와 장석구 사이에 거래가 있었음을 알아차리고, 최철기에게 또 다른 거래를 제안하는데..

각본쓰는 검사, 연출하는 경찰, 연기하는 스폰서.. 서로의 목적을 숨긴 그들의 부당거래가 시작된다!');
Insert into STEAM01.MOVIE (MOVIE_ID,TITLE,DIRECTOR,ACTOR,GENRE,RUNTIME,RELEASE_DATE,AGE_LIMIT,POSTER_URL,MOVIE_CREATE,DESCRIPTION) values (26,'신의 한수','조범구','정우성,이범수,안성기,김인권,이시영,이도경,정해균','액션,범죄,스릴러',118,to_date('24/07/03','RR/MM/DD'),'ALL','tlsdmlgkstn.jpg',to_date('25/04/24','RR/MM/DD'),' 범죄로 변해버린 신들의 놀음판, 목숨을 건 한 수가 시작된다!
프로 바둑기사 태석(정우성)은 내기바둑판에서 살수(이범수)팀의 음모에 의해 형을 잃는다. 심지어 살인 누명을 쓰고 교도소에서 복역하기에 이르고, 몇 년 후 살수와의 대결을 위해 전국의 내로라하는 선수들을 모은다.
각자의 복수와 마지막 한판 승부를 위해 모인 태석(정우성), 주님(안성기), 꽁수(김인권), 허목수(안길강)는 승부수를 띄울 판을 짠다. 단 한번이라도 지면 절대 살려두지 않는 악명 높은 살수(이범수)팀을 향한 계획된 승부가 차례로 시작되고……
범죄로 인해 곪아버린 내기바둑판에서 꾼들의 명승부가 펼쳐진다!');
Insert into STEAM01.MOVIE (MOVIE_ID,TITLE,DIRECTOR,ACTOR,GENRE,RUNTIME,RELEASE_DATE,AGE_LIMIT,POSTER_URL,MOVIE_CREATE,DESCRIPTION) values (24,'타짜','최동훈','조승우,김혜수,백윤식,유해진,최동훈,김윤석,김상호,김응수,조상','범죄,코미디,스릴러',139,to_date('25/04/02','RR/MM/DD'),'ALL','5b67b45b.jpg',to_date('25/04/24','RR/MM/DD'),'우연히 낀 화투판에서 전문도박꾼들에게 속아 돈을 잃은 천방지축청년 고니는 돈을 되찾기 위해 타짜가 되기로 결심하고, 우연인 듯 필연처럼 만난 전설의 타짜 평경장에게서 가르침을 받는다. 그리고 잃었던 돈의 다섯 배를 따면 화투를 그만둔단 맹세와 함께 타짜의 길로 들어서게 된다.

타짜가 된 고니는 평경장을 통해 도박판의 꽃, 설계자 정마담을 만나고, 커져 가는 욕망을 이기지 못한 채 그녀와의 화려한 삶을 택해 부귀영화를 누리게 되나, 악하지 못한 고니의 본성은 또다시 그를 다른 길로 이끈다. 결국, 고니는 평경장에 이어 정마담과도 각자의 길을 가기에 이른다.');
Insert into STEAM01.MOVIE (MOVIE_ID,TITLE,DIRECTOR,ACTOR,GENRE,RUNTIME,RELEASE_DATE,AGE_LIMIT,POSTER_URL,MOVIE_CREATE,DESCRIPTION) values (25,'신세계','박훈정','이정재,최민식,황정민,박성웅,송지효','액션,범죄,스릴러',134,to_date('25/03/04','RR/MM/DD'),'ALL','95e05349.jpg',to_date('25/04/24','RR/MM/DD'),' "너, 나하고 일 하나 같이 하자"

경찰청 수사 기획과 강과장(최민식)은 국내 최대 범죄 조직인 ''골드문''이 기업형 조직으로 그 세력이 점점 확장되자 신입경찰 이자성(이정재)에게 잠입 수사를 명한다. 그리고 8년, 자성은 골드문의 2인자이자 그룹 실세인 정청(황정민)의 오른팔이 되기에 이른다.

"우리 브라더는 그냥 딱, 이 좆같은 형님만 믿으면 돼야!"

골드문 회장이 갑자기 사망하자, 강과장(최민식)은 후계자 결정에 직접 개입하는 ''신세계'' 작전을 설계한다. 피도 눈물도 없는 후계자 전쟁의 한 가운데, 정청(황정민)은 8년 전, 고향 여수에서 처음 만나 지금까지 친형제처럼 모든 순간을 함께 해 온 자성(이정재)에게 더욱 강한 신뢰를 보낸다.

"약속 했잖습니까... 이번엔 진짜 끝이라고"

한편, 작전의 성공만 생각하는 강과장(최민식)은 계속해서 자성(이정재)의 목을 조여만 간다. 시시각각 신분이 노출될 위기에 처한 자성(이정재)은 언제 자신을 배신할 지 모르는 경찰과, 형제의 의리로 대하는 정청(황정민) 사이에서 갈등하게 되는데…');
Insert into STEAM01.MOVIE (MOVIE_ID,TITLE,DIRECTOR,ACTOR,GENRE,RUNTIME,RELEASE_DATE,AGE_LIMIT,POSTER_URL,MOVIE_CREATE,DESCRIPTION) values (29,'추격자','나홍진','김윤석,하정우','액션,범죄,스릴러',123,to_date('08/02/14','RR/MM/DD'),'ALL','49e53494.jpg',to_date('25/04/24','RR/MM/DD'),' 출장안마소를 운영하는 전직 형사 ''중호'', 최근 데리고 있던 여자들이 잇달아 사라지는 일이 발생하고, 조금 전 나간 미진을 불러낸 손님의 전화 번호와 사라진 여자들이 마지막으로 통화한 번호가 일치함을 알아낸다. 하지만 미진 마저도 연락이 두절되고…… 미진을 찾아 헤매던 중 우연히 ''영민''과 마주친 중호, 옷에 묻은 피를 보고 영민이 바로 그놈인 것을 직감하고 추격 끝에 그를 붙잡는다.
실종된 여자들을 모두 죽였다는 충격적인 고백을 담담히 털어 놓는 영민에 의해 경찰서는 발칵 뒤집어 진다. 우왕좌왕하는 경찰들 앞에서 미진은 아직 살아 있을 거라며 태연하게 미소 짓는 영민. 그러나 영민을 잡아둘 수 있는 증거는 아무것도 없다. 공세우기에 혈안이 된 경찰은 미진의 생사보다는 증거를 찾기에만 급급해 하고, 미진이 살아 있다고 믿는 단 한 사람 중호는 미진을 찾아 나서는데……');
Insert into STEAM01.MOVIE (MOVIE_ID,TITLE,DIRECTOR,ACTOR,GENRE,RUNTIME,RELEASE_DATE,AGE_LIMIT,POSTER_URL,MOVIE_CREATE,DESCRIPTION) values (23,'테스트','테스트','테스트','액션,범죄,SF',150,to_date('25/05/20','RR/MM/DD'),'ALL','a11ebe77.jpg',to_date('25/04/24','RR/MM/DD'),'테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트');
Insert into STEAM01.MOVIE (MOVIE_ID,TITLE,DIRECTOR,ACTOR,GENRE,RUNTIME,RELEASE_DATE,AGE_LIMIT,POSTER_URL,MOVIE_CREATE,DESCRIPTION) values (41,'극장판 귀멸의 칼날: 무한열차편','소토자키 하루오','아카자, 렌고쿠 쿄쥬로, 카마도 네즈코, 하시비라 이노스케, 아가츠마 젠이츠, 카마도 탄지로, 토미오카 기유','액션,스릴러,공포,판타지',117,to_date('21/01/27','RR/MM/DD'),'ALL','f4955b48-24c2-4b56-a2e7-3ca7e8c1585c.jpg',to_date('25/04/25','RR/MM/DD'),'혈귀로 변해버린 여동생 네즈코를 다시 인간으로 되돌리기 위해 비밀조직 귀살대의 조직원이 된 탄지로는 젠이츠, 이노스케와 함께 무한 열차를 타고 임무 수행에 나선다. 탄지로 일행은 무한 열차에서 예상치 못한 식인 혈귀의 존재와 맞닥뜨리게 되고, 혈귀에 맞서 승객들을 구하기 위해 목숨을 건 사투를 시작한다.');
REM INSERTING into STEAM01.MOVIE_MEDIA
SET DEFINE OFF;
REM INSERTING into STEAM01.MOVIE_TYPE
SET DEFINE OFF;
Insert into STEAM01.MOVIE_TYPE (MOVIE_ID,IMAX,SCREENX,"4DX","3D","2D") values (24,'N','N','N','N','Y');
Insert into STEAM01.MOVIE_TYPE (MOVIE_ID,IMAX,SCREENX,"4DX","3D","2D") values (25,'N','N','N','N','Y');
Insert into STEAM01.MOVIE_TYPE (MOVIE_ID,IMAX,SCREENX,"4DX","3D","2D") values (26,'N','N','N','N','Y');
Insert into STEAM01.MOVIE_TYPE (MOVIE_ID,IMAX,SCREENX,"4DX","3D","2D") values (27,'Y','N','Y','N','Y');
Insert into STEAM01.MOVIE_TYPE (MOVIE_ID,IMAX,SCREENX,"4DX","3D","2D") values (28,'N','N','N','N','Y');
Insert into STEAM01.MOVIE_TYPE (MOVIE_ID,IMAX,SCREENX,"4DX","3D","2D") values (29,'N','N','N','N','Y');
Insert into STEAM01.MOVIE_TYPE (MOVIE_ID,IMAX,SCREENX,"4DX","3D","2D") values (23,'N','N','N','N','Y');
Insert into STEAM01.MOVIE_TYPE (MOVIE_ID,IMAX,SCREENX,"4DX","3D","2D") values (41,'N','N','N','N','Y');
REM INSERTING into STEAM01.NOTICE
SET DEFINE OFF;
REM INSERTING into STEAM01.POINT_LOG
SET DEFINE OFF;
REM INSERTING into STEAM01.PRICE
SET DEFINE OFF;
Insert into STEAM01.PRICE (PRICE_ID,P_MOIVE,WEEKEND,KIDS,AFTERNOON,MIDNIGHT,P_IMAX,P_SCREENX,P_4DX,P_3D) values (1,5000,2000,-1000,1000,3000,5000,4000,3000,2000);
REM INSERTING into STEAM01.RESERVATION
SET DEFINE OFF;
REM INSERTING into STEAM01.REVIEW
SET DEFINE OFF;
REM INSERTING into STEAM01.SCHEDULE
SET DEFINE OFF;
REM INSERTING into STEAM01.SEAT
SET DEFINE OFF;
REM INSERTING into STEAM01.THEATER
SET DEFINE OFF;
Insert into STEAM01.THEATER (THEATER_ID,REGION,NAME,DESCRIPTION) values (1,'경기도','행신','행신 영화관');
Insert into STEAM01.THEATER (THEATER_ID,REGION,NAME,DESCRIPTION) values (2,'서울','홍대
','홍대 영화관');
--------------------------------------------------------
--  DDL for Index PK_CHAT
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_CHAT" ON "STEAM01"."CHAT" ("CHAT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CHATROOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_CHATROOM" ON "STEAM01"."CHATROOM" ("CHATROOM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_COUPON
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_COUPON" ON "STEAM01"."COUPON" ("COUPON_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_EVENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_EVENT" ON "STEAM01"."EVENT" ("EVENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_EVENT_NOOTICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_EVENT_NOOTICE" ON "STEAM01"."EVENT_NOTICE" ("EVENT_NOTICE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_EVENT_USER
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_EVENT_USER" ON "STEAM01"."EVENT_USER" ("EVENT_USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_INQUIRY
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_INQUIRY" ON "STEAM01"."INQUIRY" ("INQUIRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_MEMBER" ON "STEAM01"."MEMBER" ("MEMBER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MOVIE
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_MOVIE" ON "STEAM01"."MOVIE" ("MOVIE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MOVIE_MEDIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_MOVIE_MEDIA" ON "STEAM01"."MOVIE_MEDIA" ("MEDIA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_NOTICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_NOTICE" ON "STEAM01"."NOTICE" ("NOTICE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_POINT_LOG
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_POINT_LOG" ON "STEAM01"."POINT_LOG" ("LOG_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PRICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_PRICE" ON "STEAM01"."PRICE" ("PRICE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_RESERVATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_RESERVATION" ON "STEAM01"."RESERVATION" ("RERSERVATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_REVIEW
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_REVIEW" ON "STEAM01"."REVIEW" ("REVIEW_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_SCHEDULE
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_SCHEDULE" ON "STEAM01"."SCHEDULE" ("SCHEDULE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_SEAT
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_SEAT" ON "STEAM01"."SEAT" ("SEAT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_THEATER
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_THEATER" ON "STEAM01"."THEATER" ("THEATER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000093333C00004$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."SYS_IL0000093333C00004$$" ON "STEAM01"."INQUIRY" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE( INITIAL 65536 NEXT 1048576 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000093338C00003$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."SYS_IL0000093338C00003$$" ON "STEAM01"."NOTICE" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE( INITIAL 65536 NEXT 1048576 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000093341C00003$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."SYS_IL0000093341C00003$$" ON "STEAM01"."EVENT" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000093347C00005$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."SYS_IL0000093347C00005$$" ON "STEAM01"."REVIEW" (
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE( INITIAL 65536 NEXT 1048576 MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL (DEGREE 0 INSTANCES 0) ;
--------------------------------------------------------
--  DDL for Index PK_CHAT
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_CHAT" ON "STEAM01"."CHAT" ("CHAT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CHATROOM
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_CHATROOM" ON "STEAM01"."CHATROOM" ("CHATROOM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_COUPON
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_COUPON" ON "STEAM01"."COUPON" ("COUPON_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_EVENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_EVENT" ON "STEAM01"."EVENT" ("EVENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_EVENT_NOOTICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_EVENT_NOOTICE" ON "STEAM01"."EVENT_NOTICE" ("EVENT_NOTICE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_EVENT_USER
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_EVENT_USER" ON "STEAM01"."EVENT_USER" ("EVENT_USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_INQUIRY
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_INQUIRY" ON "STEAM01"."INQUIRY" ("INQUIRY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MEMBER
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_MEMBER" ON "STEAM01"."MEMBER" ("MEMBER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MOVIE
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_MOVIE" ON "STEAM01"."MOVIE" ("MOVIE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MOVIE_MEDIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_MOVIE_MEDIA" ON "STEAM01"."MOVIE_MEDIA" ("MEDIA_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_NOTICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_NOTICE" ON "STEAM01"."NOTICE" ("NOTICE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_POINT_LOG
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_POINT_LOG" ON "STEAM01"."POINT_LOG" ("LOG_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PRICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_PRICE" ON "STEAM01"."PRICE" ("PRICE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_RESERVATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_RESERVATION" ON "STEAM01"."RESERVATION" ("RERSERVATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_REVIEW
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_REVIEW" ON "STEAM01"."REVIEW" ("REVIEW_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_SCHEDULE
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_SCHEDULE" ON "STEAM01"."SCHEDULE" ("SCHEDULE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_SEAT
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_SEAT" ON "STEAM01"."SEAT" ("SEAT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_THEATER
--------------------------------------------------------

  CREATE UNIQUE INDEX "STEAM01"."PK_THEATER" ON "STEAM01"."THEATER" ("THEATER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger TRG_INSERT_MOVIE_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "STEAM01"."TRG_INSERT_MOVIE_TYPE" 
AFTER INSERT ON MOVIE
FOR EACH ROW
BEGIN
    INSERT INTO MOVIE_TYPE(MOVIE_ID) 
    VALUES (:NEW.MOVIE_ID);
END;
/
ALTER TRIGGER "STEAM01"."TRG_INSERT_MOVIE_TYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_INSERT_MOVIE_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "STEAM01"."TRG_INSERT_MOVIE_TYPE" 
AFTER INSERT ON MOVIE
FOR EACH ROW
BEGIN
    INSERT INTO MOVIE_TYPE(MOVIE_ID) 
    VALUES (:NEW.MOVIE_ID);
END;
/
ALTER TRIGGER "STEAM01"."TRG_INSERT_MOVIE_TYPE" ENABLE;
--------------------------------------------------------
--  Constraints for Table CHAT
--------------------------------------------------------

  ALTER TABLE "STEAM01"."CHAT" MODIFY ("CHAT_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."CHAT" MODIFY ("CHATROOM_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."CHAT" MODIFY ("CHAT_DATE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."CHAT" MODIFY ("MESSAGE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."CHAT" MODIFY ("SEND" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."CHAT" ADD CONSTRAINT "PK_CHAT" PRIMARY KEY ("CHAT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CHATROOM
--------------------------------------------------------

  ALTER TABLE "STEAM01"."CHATROOM" MODIFY ("CHATROOM_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."CHATROOM" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."CHATROOM" MODIFY ("ROOM_DATE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."CHATROOM" ADD CONSTRAINT "PK_CHATROOM" PRIMARY KEY ("CHATROOM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COUPON
--------------------------------------------------------

  ALTER TABLE "STEAM01"."COUPON" MODIFY ("COUPON_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."COUPON" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."COUPON" MODIFY ("DISCOUNT_AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."COUPON" MODIFY ("EXPIRE_DATE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."COUPON" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."COUPON" ADD CONSTRAINT "PK_COUPON" PRIMARY KEY ("COUPON_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EVENT
--------------------------------------------------------

  ALTER TABLE "STEAM01"."EVENT" MODIFY ("EVENT_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."EVENT" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."EVENT" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."EVENT" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."EVENT" MODIFY ("END_DATE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."EVENT" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."EVENT" ADD CONSTRAINT "PK_EVENT" PRIMARY KEY ("EVENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EVENT_NOTICE
--------------------------------------------------------

  ALTER TABLE "STEAM01"."EVENT_NOTICE" MODIFY ("EVENT_NOTICE_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."EVENT_NOTICE" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."EVENT_NOTICE" MODIFY ("EVENT_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."EVENT_NOTICE" MODIFY ("E_NAME" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."EVENT_NOTICE" MODIFY ("E_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."EVENT_NOTICE" ADD CONSTRAINT "PK_EVENT_NOOTICE" PRIMARY KEY ("EVENT_NOTICE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table EVENT_USER
--------------------------------------------------------

  ALTER TABLE "STEAM01"."EVENT_USER" MODIFY ("EVENT_USER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."EVENT_USER" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."EVENT_USER" ADD CONSTRAINT "PK_EVENT_USER" PRIMARY KEY ("EVENT_USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table INQUIRY
--------------------------------------------------------

  ALTER TABLE "STEAM01"."INQUIRY" MODIFY ("INQUIRY_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."INQUIRY" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."INQUIRY" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."INQUIRY" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."INQUIRY" MODIFY ("REG_DATE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."INQUIRY" ADD CONSTRAINT "PK_INQUIRY" PRIMARY KEY ("INQUIRY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "STEAM01"."MEMBER" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MEMBER" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MEMBER" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MEMBER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MEMBER" MODIFY ("GENDER" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MEMBER" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY ("MEMBER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STEAM01"."MEMBER" MODIFY ("REG_DATE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MEMBER" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MEMBER" MODIFY ("ADDRESS_DETAIL" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MEMBER" MODIFY ("EMAIL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MOVIE
--------------------------------------------------------

  ALTER TABLE "STEAM01"."MOVIE" MODIFY ("MOVIE_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE" MODIFY ("RELEASE_DATE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE" ADD CONSTRAINT "PK_MOVIE" PRIMARY KEY ("MOVIE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "STEAM01"."MOVIE" MODIFY ("DIRECTOR" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE" MODIFY ("ACTOR" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE" MODIFY ("GENRE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE" MODIFY ("RUNTIME" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE" MODIFY ("MOVIE_CREATE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE" MODIFY ("POSTER_URL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MOVIE_MEDIA
--------------------------------------------------------

  ALTER TABLE "STEAM01"."MOVIE_MEDIA" MODIFY ("MEDIA_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE_MEDIA" MODIFY ("MOVIE_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE_MEDIA" MODIFY ("MEDIA_TYPE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE_MEDIA" MODIFY ("MEDIA_URL" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE_MEDIA" MODIFY ("MEDIA_STATUS" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE_MEDIA" ADD CONSTRAINT "PK_MOVIE_MEDIA" PRIMARY KEY ("MEDIA_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MOVIE_TYPE
--------------------------------------------------------

  ALTER TABLE "STEAM01"."MOVIE_TYPE" MODIFY ("MOVIE_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE_TYPE" MODIFY ("IMAX" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE_TYPE" MODIFY ("SCREENX" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE_TYPE" MODIFY ("4DX" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE_TYPE" MODIFY ("3D" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."MOVIE_TYPE" MODIFY ("2D" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "STEAM01"."NOTICE" MODIFY ("NOTICE_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."NOTICE" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."NOTICE" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."NOTICE" MODIFY ("REG_DATE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."NOTICE" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY ("NOTICE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table POINT_LOG
--------------------------------------------------------

  ALTER TABLE "STEAM01"."POINT_LOG" MODIFY ("LOG_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."POINT_LOG" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."POINT_LOG" MODIFY ("AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."POINT_LOG" MODIFY ("REASON" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."POINT_LOG" MODIFY ("DATE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."POINT_LOG" ADD CONSTRAINT "PK_POINT_LOG" PRIMARY KEY ("LOG_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRICE
--------------------------------------------------------

  ALTER TABLE "STEAM01"."PRICE" MODIFY ("PRICE_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."PRICE" MODIFY ("P_MOIVE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."PRICE" MODIFY ("WEEKEND" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."PRICE" MODIFY ("KIDS" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."PRICE" MODIFY ("AFTERNOON" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."PRICE" MODIFY ("MIDNIGHT" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."PRICE" MODIFY ("P_IMAX" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."PRICE" MODIFY ("P_SCREENX" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."PRICE" MODIFY ("P_4DX" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."PRICE" MODIFY ("P_3D" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."PRICE" ADD CONSTRAINT "PK_PRICE" PRIMARY KEY ("PRICE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RESERVATION
--------------------------------------------------------

  ALTER TABLE "STEAM01"."RESERVATION" MODIFY ("RERSERVATION_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."RESERVATION" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."RESERVATION" MODIFY ("SCHEDULE_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."RESERVATION" MODIFY ("SEAT_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."RESERVATION" MODIFY ("PAYMENT_STATUS" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."RESERVATION" MODIFY ("PAYMENT_DATE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."RESERVATION" ADD CONSTRAINT "PK_RESERVATION" PRIMARY KEY ("RERSERVATION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "STEAM01"."REVIEW" MODIFY ("REVIEW_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."REVIEW" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."REVIEW" MODIFY ("MOVIE_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."REVIEW" MODIFY ("RATING" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."REVIEW" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."REVIEW" MODIFY ("REG_DATE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY ("REVIEW_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SCHEDULE
--------------------------------------------------------

  ALTER TABLE "STEAM01"."SCHEDULE" MODIFY ("SCHEDULE_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."SCHEDULE" MODIFY ("THEATER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."SCHEDULE" MODIFY ("MOVIE_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."SCHEDULE" MODIFY ("SCREENING_TIME" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."SCHEDULE" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."SCHEDULE" MODIFY ("IS_MORNING" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."SCHEDULE" MODIFY ("IS_NIGHT" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."SCHEDULE" MODIFY ("IS_AVAILABLE" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."SCHEDULE" ADD CONSTRAINT "PK_SCHEDULE" PRIMARY KEY ("SCHEDULE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SEAT
--------------------------------------------------------

  ALTER TABLE "STEAM01"."SEAT" MODIFY ("SEAT_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."SEAT" MODIFY ("THEATER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."SEAT" MODIFY ("ROW" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."SEAT" MODIFY ("COLUMN" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."SEAT" ADD CONSTRAINT "PK_SEAT" PRIMARY KEY ("SEAT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table THEATER
--------------------------------------------------------

  ALTER TABLE "STEAM01"."THEATER" MODIFY ("THEATER_ID" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."THEATER" MODIFY ("REGION" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."THEATER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "STEAM01"."THEATER" ADD CONSTRAINT "PK_THEATER" PRIMARY KEY ("THEATER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MOVIE_TYPE
--------------------------------------------------------

  ALTER TABLE "STEAM01"."MOVIE_TYPE" ADD CONSTRAINT "FK_MOVIE_TYPE" FOREIGN KEY ("MOVIE_ID")
	  REFERENCES "STEAM01"."MOVIE" ("MOVIE_ID") ON DELETE CASCADE ENABLE;
