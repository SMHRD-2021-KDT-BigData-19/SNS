CREATE TABLE board (
  num NUMBER PRIMARY KEY,
  title VARCHAR2(50),
  userid VARCHAR2(50),
  nick VARCHAR2(50),
  content VARCHAR2(1000),
  regdate DATE,
  cnt NUMBER DEFAULT 0
);

CREATE sequence board_seq
	start with 1
	increment by 1
	maxvalue 999999
	nocache
	nocycle
	noorder;

--삽입
INSERT INTO board (num, title, userid, nick, content, regdate, cnt)
VALUES (board_seq.nextval, '제목1', '작성자1', '닉네임1', '내용1', SYSDATE, 0);

INSERT INTO board (num, title, userid, nick, content, regdate, cnt)
VALUES (board_seq.nextval, '제목2', '작성자2', '닉네임2', '내용2', SYSDATE, 0);

INSERT INTO board (num, title, userid, nick, content, regdate, cnt)
VALUES (board_seq.nextval, '제목3', '작성자3', '닉네임3', '내용3', SYSDATE, 0);

INSERT INTO board (num, title, userid, nick, content, regdate, cnt)
VALUES (board_seq.nextval, '제목4', '작성자4', '닉네임4', '내용4', SYSDATE, 0);

INSERT INTO board (num, title, userid, nick, content, regdate, cnt)
VALUES (board_seq.nextval, '제목5', '작성자5', '닉네임5', '내용5', SYSDATE, 0);

--조회
SELECT num, title, userid, nick, content, regdate, cnt from board;
--수정
update board set title='제목수정', content='내용수정' where num=1;

--삭제
delete from board;
commit;
select * from member;

desc member;

drop table board;

select pw from board where id='작성자4';