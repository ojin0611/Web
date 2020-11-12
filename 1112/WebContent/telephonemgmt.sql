CREATE TABLE Telephone
(
	seq			INT	AUTO_INCREMENT	PRIMARY KEY,			--오라클의 시퀀스(일련번호)와 동일.
	kind			TINYINT							NOT NULL,
	tel				CHAR(8)						NOT NULL,
	NAME			VARCHAR(20)				NOT NULL,
	quantity		SMALLINT						NOT NULL,
	defaultfee	INT,
	fee			INT,
	tax			INT,
	total			INT
)