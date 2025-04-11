-- 시퀀스 생성
CREATE SEQUENCE member_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE movie_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE theater_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE screen_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE schedule_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE booking_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE event_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE notice_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE inquiry_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE point_history_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE rating_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE coupon_seq START WITH 1 INCREMENT BY 1;

-- 1. 기본 테이블 생성
-- 회원 테이블
CREATE TABLE MEMBER (
    member_id NUMBER,
    user_id VARCHAR2(50),
    password VARCHAR2(100),
    name VARCHAR2(50),
    birth_date DATE,
    gender CHAR(1),
    phone VARCHAR2(20),
    email VARCHAR2(100),
    address VARCHAR2(200),
    join_date DATE DEFAULT SYSDATE,
    member_grade VARCHAR2(20) DEFAULT 'BRONZE',
    grade_point NUMBER DEFAULT 0,
    marketing_agree CHAR(1) DEFAULT 'N',
    status CHAR(1) DEFAULT 'Y',
    last_login_date DATE
);

-- 영화 테이블
CREATE TABLE MOVIE (
    movie_id NUMBER,
    title VARCHAR2(200),
    director VARCHAR2(100),
    actors VARCHAR2(500),
    genre VARCHAR2(100),
    running_time NUMBER,
    release_date DATE,
    end_date DATE,
    rating VARCHAR2(20),
    synopsis CLOB,
    poster_url VARCHAR2(500),
    booking_rate NUMBER(5,2) DEFAULT 0,
    average_rating NUMBER(3,1) DEFAULT 0,
    total_audience NUMBER DEFAULT 0,
    status VARCHAR2(20) DEFAULT 'UPCOMING'
);

-- 극장 테이블
CREATE TABLE THEATER (
    theater_id NUMBER,
    name VARCHAR2(100),
    region VARCHAR2(50),
    address VARCHAR2(200),
    phone VARCHAR2(20),
    total_screens NUMBER,
    introduction CLOB,
    facilities VARCHAR2(500)
);

-- 상영관 테이블
CREATE TABLE SCREEN (
    screen_id NUMBER,
    theater_id NUMBER,
    name VARCHAR2(50),
    total_seats NUMBER,
    screen_type VARCHAR2(20)
);

-- 상영 시간표 테이블
CREATE TABLE SCHEDULE (
    schedule_id NUMBER,
    movie_id NUMBER,
    screen_id NUMBER,
    showing_date DATE,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    price NUMBER,
    remaining_seats NUMBER,
    schedule_type VARCHAR2(20)
);

-- 예매 테이블
CREATE TABLE BOOKING (
    booking_id NUMBER,
    member_id NUMBER,
    schedule_id NUMBER,
    booking_date DATE DEFAULT SYSDATE,
    total_price NUMBER,
    payment_method VARCHAR2(50),
    status VARCHAR2(20) DEFAULT 'COMPLETED',
    cancel_date DATE
);

-- 좌석 예매 테이블
CREATE TABLE SEAT_BOOKING (
    seat_booking_id NUMBER,
    booking_id NUMBER,
    screen_id NUMBER,
    seat_number VARCHAR2(10)
);

-- 포인트 이력 테이블
CREATE TABLE POINT_HISTORY (
    point_history_id NUMBER,
    member_id NUMBER,
    booking_id NUMBER,
    point_amount NUMBER,
    point_type VARCHAR2(20),
    description VARCHAR2(200),
    transaction_date DATE DEFAULT SYSDATE
);

-- 영화 평점 테이블
CREATE TABLE MOVIE_RATING (
    rating_id NUMBER,
    movie_id NUMBER,
    member_id NUMBER,
    rating NUMBER(2,1),
    comments VARCHAR2(500),
    rating_date DATE DEFAULT SYSDATE
);

-- 찜한 영화 테이블
CREATE TABLE MOVIE_WISHLIST (
    wishlist_id NUMBER,
    movie_id NUMBER,
    member_id NUMBER,
    add_date DATE DEFAULT SYSDATE
);

-- 이벤트 테이블
CREATE TABLE EVENT (
    event_id NUMBER,
    title VARCHAR2(200),
    content CLOB,
    start_date DATE,
    end_date DATE,
    event_type VARCHAR2(50),
    image_url VARCHAR2(500)
);

-- 쿠폰 테이블
CREATE TABLE COUPON (
    coupon_id NUMBER,
    member_id NUMBER,
    event_id NUMBER,
    coupon_code VARCHAR2(50),
    discount_amount NUMBER,
    issue_date DATE DEFAULT SYSDATE,
    expire_date DATE,
    used_date DATE,
    status VARCHAR2(20) DEFAULT 'ACTIVE'
);

-- FAQ 테이블
CREATE TABLE FAQ (
    faq_id NUMBER,
    category VARCHAR2(50),
    question VARCHAR2(500),
    answer CLOB,
    order_num NUMBER
);

-- 공지사항 테이블
CREATE TABLE NOTICE (
    notice_id NUMBER,
    title VARCHAR2(200),
    content CLOB,
    post_date DATE DEFAULT SYSDATE,
    important CHAR(1) DEFAULT 'N',
    view_count NUMBER DEFAULT 0
);

-- 극장 공지사항 테이블
CREATE TABLE THEATER_NOTICE (
    notice_id NUMBER,
    theater_id NUMBER,
    title VARCHAR2(200),
    content CLOB,
    post_date DATE DEFAULT SYSDATE
);

-- 1. NOT NULL 제약조건 추가
-- MEMBER 테이블 NOT NULL
ALTER TABLE MEMBER MODIFY user_id CONSTRAINT member_userid_nn NOT NULL;
ALTER TABLE MEMBER MODIFY password CONSTRAINT member_pw_nn NOT NULL;
ALTER TABLE MEMBER MODIFY name CONSTRAINT member_name_nn NOT NULL;
ALTER TABLE MEMBER MODIFY birth_date CONSTRAINT member_birth_nn NOT NULL;
ALTER TABLE MEMBER MODIFY phone CONSTRAINT member_phone_nn NOT NULL;

-- MOVIE 테이블 NOT NULL
ALTER TABLE MOVIE MODIFY title CONSTRAINT movie_title_nn NOT NULL;

-- THEATER 테이블 NOT NULL
ALTER TABLE THEATER MODIFY name CONSTRAINT theater_name_nn NOT NULL;
ALTER TABLE THEATER MODIFY region CONSTRAINT theater_region_nn NOT NULL;
ALTER TABLE THEATER MODIFY address CONSTRAINT theater_addr_nn NOT NULL;

-- SCREEN 테이블 NOT NULL
ALTER TABLE SCREEN MODIFY name CONSTRAINT screen_name_nn NOT NULL;

-- SCHEDULE 테이블 NOT NULL
ALTER TABLE SCHEDULE MODIFY showing_date CONSTRAINT schedule_date_nn NOT NULL;
ALTER TABLE SCHEDULE MODIFY start_time CONSTRAINT schedule_start_nn NOT NULL;
ALTER TABLE SCHEDULE MODIFY end_time CONSTRAINT schedule_end_nn NOT NULL;

-- BOOKING 테이블 NOT NULL
ALTER TABLE BOOKING MODIFY payment_method CONSTRAINT booking_payment_nn NOT NULL;

-- SEAT_BOOKING 테이블 NOT NULL
ALTER TABLE SEAT_BOOKING MODIFY seat_number CONSTRAINT seat_number_nn NOT NULL;

-- POINT_HISTORY 테이블 NOT NULL
ALTER TABLE POINT_HISTORY MODIFY point_amount CONSTRAINT point_amount_nn NOT NULL;

-- EVENT 테이블 NOT NULL
ALTER TABLE EVENT MODIFY title CONSTRAINT event_title_nn NOT NULL;
ALTER TABLE EVENT MODIFY start_date CONSTRAINT event_start_nn NOT NULL;
ALTER TABLE EVENT MODIFY end_date CONSTRAINT event_end_nn NOT NULL;

-- COUPON 테이블 NOT NULL
ALTER TABLE COUPON MODIFY discount_amount CONSTRAINT coupon_amount_nn NOT NULL;
ALTER TABLE COUPON MODIFY expire_date CONSTRAINT coupon_expire_nn NOT NULL;

-- FAQ 테이블 NOT NULL
ALTER TABLE FAQ MODIFY category CONSTRAINT faq_category_nn NOT NULL;
ALTER TABLE FAQ MODIFY question CONSTRAINT faq_question_nn NOT NULL;
ALTER TABLE FAQ MODIFY answer CONSTRAINT faq_answer_nn NOT NULL;
ALTER TABLE FAQ MODIFY order_num CONSTRAINT faq_order_nn NOT NULL;

-- NOTICE 테이블 NOT NULL
ALTER TABLE NOTICE MODIFY title CONSTRAINT notice_title_nn NOT NULL;
ALTER TABLE NOTICE MODIFY content CONSTRAINT notice_content_nn NOT NULL;

-- THEATER_NOTICE 테이블 NOT NULL
ALTER TABLE THEATER_NOTICE MODIFY title CONSTRAINT theater_notice_title_nn NOT NULL;
ALTER TABLE THEATER_NOTICE MODIFY content CONSTRAINT theater_notice_content_nn NOT NULL;

-- 2. PRIMARY KEY 제약조건 추가
ALTER TABLE MEMBER ADD CONSTRAINT member_pk PRIMARY KEY (member_id);
ALTER TABLE MOVIE ADD CONSTRAINT movie_pk PRIMARY KEY (movie_id);
ALTER TABLE THEATER ADD CONSTRAINT theater_pk PRIMARY KEY (theater_id);
ALTER TABLE SCREEN ADD CONSTRAINT screen_pk PRIMARY KEY (screen_id);
ALTER TABLE SCHEDULE ADD CONSTRAINT schedule_pk PRIMARY KEY (schedule_id);
ALTER TABLE BOOKING ADD CONSTRAINT booking_pk PRIMARY KEY (booking_id);
ALTER TABLE SEAT_BOOKING ADD CONSTRAINT seat_booking_pk PRIMARY KEY (seat_booking_id);
ALTER TABLE POINT_HISTORY ADD CONSTRAINT point_history_pk PRIMARY KEY (point_history_id);
ALTER TABLE MOVIE_RATING ADD CONSTRAINT rating_pk PRIMARY KEY (rating_id);
ALTER TABLE MOVIE_WISHLIST ADD CONSTRAINT wishlist_pk PRIMARY KEY (wishlist_id);
ALTER TABLE EVENT ADD CONSTRAINT event_pk PRIMARY KEY (event_id);
ALTER TABLE COUPON ADD CONSTRAINT coupon_pk PRIMARY KEY (coupon_id);
ALTER TABLE FAQ ADD CONSTRAINT faq_pk PRIMARY KEY (faq_id);
ALTER TABLE NOTICE ADD CONSTRAINT notice_pk PRIMARY KEY (notice_id);
ALTER TABLE THEATER_NOTICE ADD CONSTRAINT theater_notice_pk PRIMARY KEY (notice_id);

-- 3. UNIQUE 제약조건 추가
ALTER TABLE MEMBER ADD CONSTRAINT member_userid_uk UNIQUE (user_id);
ALTER TABLE COUPON ADD CONSTRAINT coupon_code_uk UNIQUE (coupon_code);
ALTER TABLE MOVIE_RATING ADD CONSTRAINT rating_uk UNIQUE (movie_id, member_id);
ALTER TABLE MOVIE_WISHLIST ADD CONSTRAINT wishlist_uk UNIQUE (movie_id, member_id);
ALTER TABLE SEAT_BOOKING ADD CONSTRAINT seat_booking_uk UNIQUE (screen_id, seat_number, booking_id);

-- 4. CHECK 제약조건 추가
ALTER TABLE MEMBER ADD CONSTRAINT member_gender_ck CHECK (gender IN ('M', 'F'));
ALTER TABLE MEMBER ADD CONSTRAINT member_grade_ck CHECK (member_grade IN ('BRONZE', 'SILVER', 'GOLD', 'PLATINUM'));
ALTER TABLE MEMBER ADD CONSTRAINT member_marketing_ck CHECK (marketing_agree IN ('Y', 'N'));
ALTER TABLE MEMBER ADD CONSTRAINT member_status_ck CHECK (status IN ('Y', 'N'));

ALTER TABLE MOVIE ADD CONSTRAINT movie_runtime_ck CHECK (running_time > 0);
ALTER TABLE MOVIE ADD CONSTRAINT movie_rating_ck CHECK (rating IN ('ALL', '12', '15', '19'));
ALTER TABLE MOVIE ADD CONSTRAINT movie_bookrate_ck CHECK (booking_rate BETWEEN 0 AND 100);
ALTER TABLE MOVIE ADD CONSTRAINT movie_avgrate_ck CHECK (average_rating BETWEEN 0 AND 5);
ALTER TABLE MOVIE ADD CONSTRAINT movie_status_ck CHECK (status IN ('UPCOMING', 'CURRENT', 'ENDED'));

ALTER TABLE THEATER ADD CONSTRAINT theater_screens_ck CHECK (total_screens > 0);

ALTER TABLE SCREEN ADD CONSTRAINT screen_seats_ck CHECK (total_seats > 0);
ALTER TABLE SCREEN ADD CONSTRAINT screen_type_ck CHECK (screen_type IN ('2D', '3D', '4DX', 'IMAX'));

ALTER TABLE SCHEDULE ADD CONSTRAINT schedule_price_ck CHECK (price > 0);
ALTER TABLE SCHEDULE ADD CONSTRAINT schedule_type_ck CHECK (schedule_type IN ('NORMAL', 'MORNING', 'LATE'));
ALTER TABLE SCHEDULE ADD CONSTRAINT schedule_time_ck CHECK (end_time > start_time);

ALTER TABLE BOOKING ADD CONSTRAINT booking_price_ck CHECK (total_price >= 0);
ALTER TABLE BOOKING ADD CONSTRAINT booking_status_ck CHECK (status IN ('COMPLETED', 'CANCELLED', 'REFUNDED'));

ALTER TABLE POINT_HISTORY ADD CONSTRAINT point_type_ck CHECK (point_type IN ('EARN', 'USE', 'EXPIRE', 'CANCEL'));

ALTER TABLE MOVIE_RATING ADD CONSTRAINT rating_score_ck CHECK (rating BETWEEN 0 AND 5);

ALTER TABLE EVENT ADD CONSTRAINT event_type_ck CHECK (event_type IN ('MOVIE', 'BOOKING', 'PARTNERSHIP'));
ALTER TABLE EVENT ADD CONSTRAINT event_date_ck CHECK (end_date >= start_date);

ALTER TABLE COUPON ADD CONSTRAINT coupon_status_ck CHECK (status IN ('ACTIVE', 'USED', 'EXPIRED'));
ALTER TABLE COUPON ADD CONSTRAINT coupon_date_ck CHECK (expire_date >= issue_date);

ALTER TABLE NOTICE ADD CONSTRAINT notice_important_ck CHECK (important IN ('Y', 'N'));
ALTER TABLE NOTICE ADD CONSTRAINT notice_count_ck CHECK (view_count >= 0);

-- 5. FOREIGN KEY 제약조건 추가
ALTER TABLE SCREEN ADD CONSTRAINT screen_theater_fk 
    FOREIGN KEY (theater_id) REFERENCES THEATER(theater_id) ON DELETE CASCADE;

ALTER TABLE SCHEDULE ADD CONSTRAINT schedule_movie_fk 
    FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id) ON DELETE CASCADE;
ALTER TABLE SCHEDULE ADD CONSTRAINT schedule_screen_fk 
    FOREIGN KEY (screen_id) REFERENCES SCREEN(screen_id) ON DELETE CASCADE;

ALTER TABLE BOOKING ADD CONSTRAINT booking_member_fk 
    FOREIGN KEY (member_id) REFERENCES MEMBER(member_id) ON DELETE SET NULL;
ALTER TABLE BOOKING ADD CONSTRAINT booking_schedule_fk 
    FOREIGN KEY (schedule_id) REFERENCES SCHEDULE(schedule_id) ON DELETE CASCADE;

ALTER TABLE SEAT_BOOKING ADD CONSTRAINT seatbooking_booking_fk 
    FOREIGN KEY (booking_id) REFERENCES BOOKING(booking_id) ON DELETE CASCADE;
ALTER TABLE SEAT_BOOKING ADD CONSTRAINT seatbooking_screen_fk 
    FOREIGN KEY (screen_id) REFERENCES SCREEN(screen_id) ON DELETE CASCADE;

ALTER TABLE POINT_HISTORY ADD CONSTRAINT point_member_fk 
    FOREIGN KEY (member_id) REFERENCES MEMBER(member_id) ON DELETE CASCADE;
ALTER TABLE POINT_HISTORY ADD CONSTRAINT point_booking_fk 
    FOREIGN KEY (booking_id) REFERENCES BOOKING(booking_id) ON DELETE SET NULL;

ALTER TABLE MOVIE_RATING ADD CONSTRAINT rating_movie_fk 
    FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id) ON DELETE CASCADE;
ALTER TABLE MOVIE_RATING ADD CONSTRAINT rating_member_fk 
    FOREIGN KEY (member_id) REFERENCES MEMBER(member_id) ON DELETE CASCADE;

ALTER TABLE MOVIE_WISHLIST ADD CONSTRAINT wishlist_movie_fk 
    FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id) ON DELETE CASCADE;
ALTER TABLE MOVIE_WISHLIST ADD CONSTRAINT wishlist_member_fk 
    FOREIGN KEY (member_id) REFERENCES MEMBER(member_id) ON DELETE CASCADE;

ALTER TABLE COUPON ADD CONSTRAINT coupon_member_fk 
    FOREIGN KEY (member_id) REFERENCES MEMBER(member_id) ON DELETE CASCADE;
ALTER TABLE COUPON ADD CONSTRAINT coupon_event_fk 
    FOREIGN KEY (event_id) REFERENCES EVENT(event_id) ON DELETE SET NULL;

ALTER TABLE THEATER_NOTICE ADD CONSTRAINT theater_notice_fk 
    FOREIGN KEY (theater_id) REFERENCES THEATER(theater_id) ON DELETE CASCADE;




