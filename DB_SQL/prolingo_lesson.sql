--PROLINGO_SUBJECT					
DROP TABLE	PROLINGO_SUBJECT	;			
CREATE TABLE	PROLINGO_SUBJECT	(			
SUBJECT_ID	NUMBER	PRIMARY KEY		,	--과목 아이디(직접 넣기)
SUBJECT_NAME	VARCHAR2(20)	NOT NULL		);	--과목 이름
					
--USER_SUBJECT					
DROP TABLE	USER_SUBJECT	;			
CREATE TABLE	USER_SUBJECT	(			--유저의 관심 과목
USER_ID	NUMBER	REFERENCES PROLINGO_USER(USER_ID)	ON DELETE CASCADE	,	--멤버 아이디
SUBJECT_ID	NUMBER	REFERENCES PROLINGO_SUBJECT(SUBJECT_ID)	ON DELETE CASCADE	,	--과목 아이디
PRIMARY KEY(USER_ID, SUBJECT_ID)				);	--복합키
					
--PROLINGO_LESSON					
DROP TABLE	PROLINGO_LESSON	;			
CREATE TABLE	PROLINGO_LESSON	(			
LESSON_ID	NUMBER	PRIMARY KEY		,	--학습 아이디(직접?)
SUBJECT_ID	NUMBER	REFERENCES PROLINGO_SUBJECT(SUBJECT_ID)	ON DELETE CASCADE	,	--과목 아이디
GRADE	VARCHAR2(20)	CHECK(GRADE IN('INTRODUTION', 'BEGINNER'))	NOT NULL	,	--과정 등급
LESSON_CONTENTS	VARCHAR2(2000)		NOT NULL	);	--개념, 어떻게 넣을것인지? 이미지로?
					
--PROLINGO_QUESTION					
DROP TABLE	PROLINGO_QUESTION	;			
CREATE TABLE	PROLINGO_QUESTION	(			
QUESTION_ID	NUMBER	PRIMARY KEY		,	--문제 아이디
LESSON_ID	NUMBER	REFERENCES PROLINGO_LESSON(LESSON_ID)	ON DELETE CASCADE	,	--학습 아이디
QUESTION_CONTENTS	VARCHAR2(2000)		NOT NULL	,	--문제 내용
ANSWER	VARCHAR2(2000)			,	--정답(콘솔 출력 내용 객관식에서는 직접 만들기?)
KEYWORDS	VARCHAR2(1000)			);	--채점 할 때 들어가 있어야 하는 문구(객관식에선 문제로 만드는용도)
					
--PROLINGO_KEYWORD					
DROP TABLE	PROLINGO_KEYWORD	;			
CREATE TABLE	PROLINGO_KEYWORD	(			--키워드의 정보만 가지고 있고 다른 테이블이랑 관계 없는듯
KEYWORD_ID	NUMBER	PRIMARY KEY		,	--키워드 아이디
KEYWORD_NAME	VARCHAR2(20)		NOT NULL	,	--키워드 이름(FOR, WHILE 등)
KEYWORD_TYPE	VARCHAR2(20)		NOT NULL	);	--키워드 타입(반복문, 제어문 등)
					
--PROLINGO_HISTORY					
DROP TABLE	PROLINGO_HISTORY	;			
CREATE TABLE	PROLINGO_HISTORY	(			
HISTORY_ID	NUMBER	PRIMARY KEY		,	--풀이 내역 아이디
USER_ID	NUMBER	REFERENCES PROLINGO_USER(USER_ID)	ON DELETE CASCADE	,	--멤버 아이디
QUESTION_ID	NUMBER	REFERENCES PROLINGO_QUESTION(QUESTION_ID)	ON DELETE CASCADE	,	--문제 아이디
HISTORY_CONTENT	VARCHAR2(2000)		NOT NULL	);	--풀이 내용
				
--PROLINGO_HISTORY_SEQ					
DROP SEQUENCE	PROLINGO_HISTORY_SEQ	;			
CREATE SEQUENCE	PROLINGO_HISTORY_SEQ	;		

COMMIT;