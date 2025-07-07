-- ��� ���� ������
INSERT INTO tbl_member (id, password, name, type)
VALUES ('cli', 'cli', '��浿', 'CLIENT');

INSERT INTO tbl_member (id, password, name, type)
VALUES ('user', 'user', '�̸���', 'PARTNER');

-- �±� ���� ������
INSERT INTO tbl_tag (tagid, tagname) VALUES (seq_tag_id.NEXTVAL, '�ڹ�');
INSERT INTO tbl_tag (tagid, tagname) VALUES (seq_tag_id.NEXTVAL, '�鿣��');
INSERT INTO tbl_tag (tagid, tagname) VALUES (seq_tag_id.NEXTVAL, '���̽�');
INSERT INTO tbl_tag (tagid, tagname) VALUES (seq_tag_id.NEXTVAL, '����Ʈ����');
INSERT INTO tbl_tag (tagid, tagname) VALUES (seq_tag_id.NEXTVAL, 'React');

-- ������Ʈ ���� ������
-- 1. ����Ʈ���� ����
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, '����Ʈ���� ������ ���� (Vue.js)', 'frontend01',
  'Vue.js�� ���� ���� UI�� �������� ����Ʈ���� �����ڸ� ã���ϴ�.', '���� ���α�',
  15000, '09:30 ~ 18:30', SYSDATE, TO_DATE('2025-07-31', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 2. �鿣�� ����
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, 'Spring �鿣�� ������ ä��', 'backend02',
  'Java/Spring ��� �� ���� �鿣�� �������� �� ��ȭ �����Դϴ�.', '���� ������',
  17000, '10:00 ~ 19:00', SYSDATE, TO_DATE('2025-08-10', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 3. ������ �м�
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, '������ �м� ������ (Python/Pandas)', 'data_analyst',
  '������ ������ ���� �� �ð�ȭ, ���� ������ ������ �м� ������ ���մϴ�.', '��� ������',
  16000, '09:00 ~ 17:00', SYSDATE, TO_DATE('2025-08-15', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 4. �ΰ�����(AI) ����
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, 'AI �𵨸� ���� ����', 'ai_team',
  '�ӽŷ��� �� �׽�Ʈ �� ���� ���� ������ ����� ������ ���մϴ�.', '���� ���Ǳ�',
  18000, '���� �ٹ���', SYSDATE, TO_DATE('2025-08-20', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 5. ���� �����Ͼ�
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, '�������� ������ŷ ������Ʈ ������ ����', 'sec_dev',
  '�� ����� �м� �� ���� �ý��� ���� ���� ���� �η� ����.', '���� ���ʱ�',
  20000, '09:00 ~ 18:00', SYSDATE, TO_DATE('2025-07-30', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 6. �� ���� (Android)
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, 'Android �� ������ �ܱ� ä��', 'android_hire',
  'Java/Kotlin ��� �� �����丵 �� UI ���� ����.', '�λ� �ؿ�뱸',
  14000, '10:00 ~ 17:00', SYSDATE, TO_DATE('2025-08-01', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 7. DevOps ����
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, 'DevOps �����Ͼ� ���� ä��', 'devops_intern',
  'CI/CD ���������� � �� ����͸� �ڵ�ȭ ���� ����.', '���� ������',
  16000, '09:00 ~ 18:00', SYSDATE, TO_DATE('2025-08-05', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 8. UI/UX �����̳�
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, 'UI/UX ������ ������ ����', 'ui_designer',
  'Figma�� Ȱ���� ���̾������� ���� �� ����� �ǵ�� �ݿ� �۾� ����.', '��õ ������',
  13000, '���� �ٹ���', SYSDATE, TO_DATE('2025-08-10', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 9. ������� �ۼ� ����
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, '������� ���� ������', 'doc_writer',
  '������ ���� �� API �� ���� ������ ������ ��ƮŸ�̸� ���մϴ�.', '���� ������',
  12000, '09:00 ~ 16:00', SYSDATE, TO_DATE('2025-07-29', 'YYYY-MM-DD'), EMPTY_BLOB()
);

-- 10. �׽�Ʈ �����Ͼ�
INSERT INTO tbl_project_post VALUES (
  seq_project_post.NEXTVAL, 'QA �׽�Ʈ �����Ͼ� �ܱ� ����', 'qa_test',
  '��/����� QA �׽�Ʈ �� �̽� ����Ʈ �ۼ��� ����� ������ ã���ϴ�.', '��� �Ⱦ��',
  14000, '10:00 ~ 18:00', SYSDATE, TO_DATE('2025-08-08', 'YYYY-MM-DD'), EMPTY_BLOB()
);

CREATE TABLE tbl_member (
    member_id   VARCHAR2(50) PRIMARY KEY,
    password    VARCHAR2(100) NOT NULL,
    name        VARCHAR2(50) NOT NULL,
    member_type VARCHAR2(20) CHECK (member_type IN ('CLIENT', 'PARTNER')) NOT NULL
);