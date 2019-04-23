

CREATE TABLE movie
(
	movie_id			NUMBER			NOT NULL,
	movie_title			VARCHAR2(100)	NOT NULL,
	movie_director		VARCHAR2(20)	NOT NULL,
	movie_actor     	VARCHAR2(20)	NOT NULL,
	movie_age			NUMBER			NOT NULL,
	movie_openday		DATE			NOT NULL,
	movie_running_time	NUMBER			NOT NULL,
	movie_summary		VARCHAR2(1000)	NOT NULL,
		
	CONSTRAINT movie_pk PRIMARY KEY(movie_id)
)	
	
	

CREATE OR REPLACE TRIGGER MOVIE_AI_TRG
BEFORE INSERT ON MOVIE 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT MOVIE_SEQ.NEXTVAL
    INTO: NEW.movie_id
    FROM DUAL;
END;	

--DROP TRIGGER MOVIE_AI_TRG;
/

--DROP SEQUENCE MOVIE_SEQ;
/

COMMENT ON TABLE MOVIE IS '��ȭ ����'
/

COMMENT ON COLUMN MOVIE.movie_id IS '��ȭ ��ȣ'
/

COMMENT ON COLUMN MOVIE.movie_title IS '��ȭ ����'
/

COMMENT ON COLUMN MOVIE.movie_director IS '����'
/

COMMENT ON COLUMN MOVIE.movie_actor IS '�ֿ� ���'
/

COMMENT ON COLUMN MOVIE.movie_age IS '���� ���'
/

COMMENT ON COLUMN MOVIE.movie_openday IS '���� �Ͻ�'
/

COMMENT ON COLUMN MOVIE.movie_running_time IS '����Ÿ��'
/

COMMENT ON COLUMN MOVIE.movie_summary IS '��ȭ �ٰŸ�'
/



-- MOVIE_SCHEDULE Table Create SQL

CREATE TABLE movie_schedule
(
	screen_no		NUMBER			NOT NULL,
	screen_date		DATE			NOT NULL,
	screen_time		VARCHAR2(20)	NOT NULL,
	movie_id		NUMBER			NOT NULL,
	CONSTRAINT movie_schedule_pk PRIMARY KEY(screen_no)
)

CREATE SEQUENCE MOVIE_SCHEDULE_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER MOVIE_SCHEDULE_AI_TRG
BEFORE INSERT ON MOVIE_SCHEDULE 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT MOVIE_SCHEDULE_SEQ.NEXTVAL
    INTO: NEW.screen_no
    FROM DUAL;
END;
/

--DROP TRIGGER MOVIE_SCHEDULE_AI_TRG;
/

--DROP SEQUENCE MOVIE_SCHEDULE_SEQ;
/

COMMENT ON TABLE MOVIE_SCHEDULE IS '�� ����'
/

COMMENT ON COLUMN MOVIE_SCHEDULE.screen_no IS '�� ���� ��ȣ'
/

COMMENT ON COLUMN MOVIE_SCHEDULE.screen_date IS '�� ����'
/

COMMENT ON COLUMN MOVIE_SCHEDULE.screen_time IS '�� �ð�'
/

COMMENT ON COLUMN MOVIE_SCHEDULE.movie_id IS '��ȭ ��ȣ'
/

ALTER TABLE MOVIE_SCHEDULE
    ADD CONSTRAINT FK_MOVIE_SCHEDULE_movie_id_MOV FOREIGN KEY (movie_id)
        REFERENCES MOVIE (movie_id)
/


-- CUSTOMER Table Create SQL

CREATE TABLE customers
(
	customer_no			NUMBER			NOT NULL,
	customer_id			VARCHAR2(20)	NOT NULL,
	customer_pw			VARCHAR2(20)	NOT NULL,
	customer_name		VARCHAR2(20)	NOT NULL,
	customer_phone_no	VARCHAR2(20)	NOT NULL,
	customer_birth		DATE			NOT NULL,
	CONSTRAINT customer_pk PRIMARY KEY (customer_no),
	CONSTRAINT customer_id_uk UNIQUE   (customer_id)
)	

CREATE SEQUENCE CUSTOMER_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER CUSTOMER_AI_TRG
BEFORE INSERT ON CUSTOMERS
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT CUSTOMER_SEQ.NEXTVAL
    INTO: NEW.customer_no
    FROM DUAL;
END;
/

--DROP TRIGGER CUSTOMER_AI_TRG;
/

--DROP SEQUENCE CUSTOMER_SEQ;
/

COMMENT ON TABLE CUSTOMERS IS '�� ����'
/

COMMENT ON COLUMN CUSTOMERS.customer_no IS 'ȸ�� ��ȣ'
/

COMMENT ON COLUMN CUSTOMERS.customer_id IS 'UNIQUE'
/

COMMENT ON COLUMN CUSTOMERS.customer_pw IS 'ȸ�� pw'
/

COMMENT ON COLUMN CUSTOMERS.customer_name IS 'ȸ�� �̸�'
/

COMMENT ON COLUMN CUSTOMERS.customer_phone_no IS 'ȸ�� ��ȭ��ȣ'
/

COMMENT ON COLUMN CUSTOMERS.customer_birth IS '�������'
/



-- SEAT Table Create SQL
CREATE TABLE SEAT
(
    seat_no         VARCHAR2(20)    NOT NULL, 
    screen_no       NUMBER          NOT NULL, 
    movie_id        NUMBER          NOT NULL, 
    seat_reserve    CHAR(1)         NULL, 
    CONSTRAINT SEAT_PK PRIMARY KEY (seat_no)
)
/

COMMENT ON TABLE SEAT IS '�¼�'
/

COMMENT ON COLUMN SEAT.seat_no IS '�¼� ��ȣ'
/

COMMENT ON COLUMN SEAT.screen_no IS '�� ���� ��ȣ'
/

COMMENT ON COLUMN SEAT.movie_id IS '��ȭ ��ȣ'
/

COMMENT ON COLUMN SEAT.seat_reserve IS 'check y/n'
/

ALTER TABLE SEAT
    ADD CONSTRAINT FK_SEAT_screen_no_MOVIE_SCHEDU FOREIGN KEY (screen_no)
        REFERENCES MOVIE_SCHEDULE (screen_no)
/

ALTER TABLE SEAT
    ADD CONSTRAINT FK_SEAT_movie_id_MOVIE_movie_i FOREIGN KEY (movie_id)
        REFERENCES MOVIE (movie_id)
/

ALTER TABLE SEAT
	ADD CONSTRAINT seat_reserve_chk CHECK(seat_reserve IN ('Y', 'N'))



	
-- TICKETING Table Create SQL
CREATE TABLE TICKETING
(
    booking_no      NUMBER          NOT NULL, 
    customer_no     NUMBER          NOT NULL, 
    ticket_price    NUMBER          NOT NULL, 
    ticket_no       NUMBER          NOT NULL, 
    seat_no         VARCHAR2(20)    NOT NULL, 
    screen_no       NUMBER          NOT NULL, 
    CONSTRAINT TICKETING_PK PRIMARY KEY (booking_no)
)
/

CREATE SEQUENCE TICKETING_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TICKETING_AI_TRG
BEFORE INSERT ON TICKETING 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TICKETING_SEQ.NEXTVAL
    INTO: NEW.booking_no
    FROM DUAL;
END;
/

--DROP TRIGGER TICKETING_AI_TRG;
/

--DROP SEQUENCE TICKETING_SEQ;
/

COMMENT ON TABLE TICKETING IS '���ų���'
/

COMMENT ON COLUMN TICKETING.booking_no IS '���� ��ȣ'
/

COMMENT ON COLUMN TICKETING.customer_no IS 'ȸ�� ��ȣ'
/

COMMENT ON COLUMN TICKETING.ticket_price IS 'Ƽ�� ����'
/

COMMENT ON COLUMN TICKETING.ticket_no IS 'Ƽ�� �ż�'
/

COMMENT ON COLUMN TICKETING.seat_no IS '�¼� ��ȣ'
/

COMMENT ON COLUMN TICKETING.screen_no IS '�� ���� ��ȣ'
/

ALTER TABLE TICKETING
    ADD CONSTRAINT FK_TICKETING_screen_no_MOVIE_S FOREIGN KEY (screen_no)
        REFERENCES MOVIE_SCHEDULE (screen_no)
/

ALTER TABLE TICKETING
    ADD CONSTRAINT FK_TICKETING_seat_no_SEAT_seat FOREIGN KEY (seat_no)
        REFERENCES SEAT (seat_no)
/

ALTER TABLE TICKETING
    ADD CONSTRAINT FK_TICKETING_customer_no_CUSTO FOREIGN KEY (customer_no)
        REFERENCES CUSTOMERS (customer_no)
/	

-- PAYMENT Table Create SQL
CREATE TABLE PAYMENT
(
    booking_no         NUMBER          NOT NULL, 
    booking_date       VARCHAR2(20)    NOT NULL, 
    payment_confirm    CHAR(1)         NULL   
)
/

COMMENT ON TABLE PAYMENT IS '����'
/

COMMENT ON COLUMN PAYMENT.booking_no IS '���� ��ȣ'
/

COMMENT ON COLUMN PAYMENT.booking_date IS '���� ����'
/

COMMENT ON COLUMN PAYMENT.payment_confirm IS 'check y/n'
/

ALTER TABLE PAYMENT
    ADD CONSTRAINT FK_PAYMENT_booking_no_TICKETIN FOREIGN KEY (booking_no)
        REFERENCES TICKETING (booking_no)

	
ALTER TABLE payment
	ADD CONSTRAINT payment_confirm_chk CHECK(payment_confirm IN ('Y', 'N'))

/


-- ADMIN Table Create SQL
CREATE TABLE ADMIN
(
    admin_id    VARCHAR2(20)    NOT NULL, 
    admin_pw    VARCHAR2(20)    NOT NULL, 
    CONSTRAINT ADMIN_PK PRIMARY KEY (admin_id)
)
/

COMMENT ON TABLE ADMIN IS '������'
/

COMMENT ON COLUMN ADMIN.admin_id IS '������ id'
/

COMMENT ON COLUMN ADMIN.admin_pw IS '������ pw'
/


ALTER TABLE MOVIE_SCHEDULE MODIFY screen_time DATE

ALTER TABLE PAYMENT DROP COLUMN booking_date

ALTER TABLE PAYMENT ADD (booking_date DATE DEFAULT SYSDATE)

