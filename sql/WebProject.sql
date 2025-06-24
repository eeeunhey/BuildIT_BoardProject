CREATE TABLE tbl_job_post (
    post_id     NUMBER PRIMARY KEY,
    writer_id   VARCHAR2(20) NOT NULL,
    title       VARCHAR2(100) NOT NULL,
    content     CLOB NOT NULL,
    location    VARCHAR2(100),
    pay         NUMBER,
    work_time   VARCHAR2(100),
    reg_date    DATE DEFAULT SYSDATE,
    deadline    DATE
);


INSERT INTO tbl_job_post VALUES (
    1, 'boss01', '카페 주말 알바 모집', '분위기 좋은 카페에서 함께 일하실 분을 모집합니다.', '서울 강남구', 12000, '토,일 10:00~18:00', SYSDATE, TO_DATE('2025-07-15', 'YYYY-MM-DD')
);

INSERT INTO tbl_job_post VALUES (
    2, 'store88', '편의점 야간 알바', '야간 근무 가능자 우대. 근무환경 쾌적합니다.', '서울 마포구', 11000, '월~금 22:00~06:00', SYSDATE, TO_DATE('2025-07-10', 'YYYY-MM-DD')
);

INSERT INTO tbl_job_post VALUES (
    3, 'owner77', '학원 보조 선생님 모집', '초등학생 대상 학원 수업 보조.', '서울 노원구', 15000, '월~금 14:00~19:00', SYSDATE, TO_DATE('2025-07-20', 'YYYY-MM-DD')
);

INSERT INTO tbl_job_post VALUES (
    4, 'mart23', '마트 계산대 알바', '계산대 및 진열 업무 담당', '서울 송파구', 10000, '주말 09:00~18:00', SYSDATE, TO_DATE('2025-07-18', 'YYYY-MM-DD')
);

INSERT INTO tbl_job_post VALUES (
    5, 'hostel99', '게스트하우스 청소 알바', '객실 정리 및 청소 담당.', '서울 종로구', 13000, '매일 11:00~15:00', SYSDATE, TO_DATE('2025-07-12', 'YYYY-MM-DD')
);

INSERT INTO tbl_job_post VALUES (
    6, 'gym11', '헬스장 안내데스크 알바', '회원 응대 및 기구 관리.', '서울 동작구', 12500, '월~토 06:00~10:00', SYSDATE, TO_DATE('2025-07-25', 'YYYY-MM-DD')
);

INSERT INTO tbl_job_post VALUES (
    7, 'pcbang22', 'PC방 주말 알바 모집', '매장 관리 및 간단한 조리.', '서울 중랑구', 10500, '토,일 12:00~21:00', SYSDATE, TO_DATE('2025-07-16', 'YYYY-MM-DD')
);

INSERT INTO tbl_job_post VALUES (
    8, 'cinema01', '영화관 매점 알바', '매점 운영 및 청소.', '서울 구로구', 11000, '월~금 17:00~23:00', SYSDATE, TO_DATE('2025-07-22', 'YYYY-MM-DD')
);

INSERT INTO tbl_job_post VALUES (
    9, 'cvs202', '편의점 평일 알바', '물품 진열 및 손님 응대.', '서울 강서구', 10800, '월~금 09:00~15:00', SYSDATE, TO_DATE('2025-07-30', 'YYYY-MM-DD')
);

INSERT INTO tbl_job_post VALUES (
    10, 'studio88', '사진 스튜디오 보조', '촬영 보조 및 정리 업무.', '서울 성동구', 14000, '수~일 10:00~17:00', SYSDATE, TO_DATE('2025-08-01', 'YYYY-MM-DD')
);


SELECT *
  FROM tbl_job_post;
  
  commit;