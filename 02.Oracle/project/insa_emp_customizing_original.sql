---------------------------------------------------
/*
�۾� ����
insa ���̺����� city, buseo, jikwi �÷��� �ߺ��� ��Ұ� ���� �����մϴ�.
city, buseo, jikwi �÷��� ������ insa ���̺����� �и� ����Դϴ�.
insa ���̺����� �ߺ��� ��Ҹ� �����ϰ� ������ ������ ������ ���̺��� �Է��ؾ� �Ѵ�.
*/

----------------------------------------------------
/*
insa ���̺� ���� ����
CREATE TABLE insa(
        num NUMBER(5) NOT NULL 
       ,name NVARCHAR2(20) NOT NULL
       ,ssn  VARCHAR2(14) NOT NULL
       ,ibsaDate DATE     NOT NULL
       ,tel   VARCHAR2(15)
       ,city  NVARCHAR2(10)
       ,buseo NVARCHAR2(15) NOT NULL
       ,jikwi NVARCHAR2(15) NOT NULL
       ,basicPay NUMBER(10) NOT NULL
       ,sudang NUMBER(10) NOT NULL
       ,CONSTRAINT insa_num_pk PRIMARY KEY (num)
);
*/

----------------------------------------------------
/*
insa ���̺� ���� ������
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1001, 'ȫ�浿', '771212-1022432', '1998-10-11', '����', '011-2356-4528', '��ȹ��', 
   '����', 2610000, 200000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1002, '�̼���', '801007-1544236', '2000-11-29', '���', '010-4758-6532', '�ѹ���', 
   '���', 1320000, 200000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1003, '�̼���', '770922-2312547', '1999-02-25', '��õ', '010-4231-1236', '���ߺ�', 
   '����', 2550000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1004, '������', '790304-1788896', '2000-10-01', '����', '019-5236-4221', '������', 
   '�븮', 1954200, 170000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1005, '�Ѽ���', '811112-1566789', '2004-08-13', '����', '018-5211-3542', '�ѹ���', 
   '���', 1420000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1006, '�̱���', '780505-2978541', '2002-02-11', '��õ', '010-3214-5357', '���ߺ�', 
   '����', 2265000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1007, '����ö', '780506-1625148', '1998-03-16', '����', '011-2345-2525', '���ߺ�', 
   '�븮', 1250000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1008, '�迵��', '821011-2362514', '2002-04-30', '����', '016-2222-4444', 'ȫ����',    
'���', 950000 , 145000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1009, '������', '810810-1552147', '2003-10-10', '���', '019-1111-2222', '�λ��', 
   '���', 840000 , 220400);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1010, '������', '751010-1122233', '1997-08-08', '�λ�', '011-3214-5555', '������', 
   '����', 2540000, 130000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1011, '������', '801010-2987897', '2000-07-07', '����', '010-8888-4422', '������', 
   '���', 1020000, 140000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1012, '���ѱ�', '760909-1333333', '1999-10-16', '����', '018-2222-4242', 'ȫ����', 
   '���', 880000 , 114000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1013, '���̼�', '790102-2777777', '1998-06-07', '���', '019-6666-4444', 'ȫ����', 
   '�븮', 1601000, 103000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1014, 'Ȳ����', '810707-2574812', '2002-02-15', '��õ', '010-3214-5467', '���ߺ�', 
   '���', 1100000, 130000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1015, '������', '800606-2954687', '1999-07-26', '���', '016-2548-3365', '�ѹ���', 
   '���', 1050000, 104000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1016, '�̻���', '781010-1666678', '2001-11-29', '���', '010-4526-1234', '���ߺ�', 
   '����', 2350000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1017, '�����', '820507-1452365', '2000-08-28', '��õ', '010-3254-2542', '���ߺ�', 
   '���', 950000 , 210000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1018, '�̼���', '801028-1849534', '2004-08-08', '����', '018-1333-3333', '���ߺ�', 
   '���', 880000 , 123000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1019, '�ڹ���', '780710-1985632', '1999-12-10', '����', '017-4747-4848', '�λ��', 
   '����', 2300000, 165000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1020, '������', '800304-2741258', '2003-10-10', '����', '011-9595-8585', '�����', 
   '���', 880000 , 140000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1021, 'ȫ�泲', '801010-1111111', '2001-09-07', '���', '011-9999-7575', '���ߺ�', 
   '���', 875000 , 120000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1022, '�̿���', '800501-2312456', '2003-02-25', '����', '017-5214-5282', '��ȹ��', 
   '�븮', 1960000, 180000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1023, '���μ�', '731211-1214576', '1995-02-23', '����', NULL           , '������', 
   '����', 2500000, 170000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1024, '�踻��', '830225-2633334', '1999-08-28', '����', '011-5248-7789', '��ȹ��', 
   '�븮', 1900000, 170000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1025, '�����', '801103-1654442', '2000-10-01', '����', '010-4563-2587', '������', 
   '���', 1100000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1026, '�����', '810907-2015457', '2002-08-28', '���', '010-2112-5225', '������', 
   '���', 1050000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1027, '�迵��', '801216-1898752', '2000-10-18', '����', '019-8523-1478', '�ѹ���', 
   '����', 2340000, 170000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1028, '�̳���', '810101-1010101', '2001-09-07', '����', '016-1818-4848', '�λ��', 
   '���', 892000 , 110000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1029, '�踻��', '800301-2020202', '2000-09-08', '����', '016-3535-3636', '�ѹ���', 
   '���', 920000 , 124000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1030, '������', '790210-2101010', '1999-10-17', '�λ�', '019-6564-6752', '�ѹ���', 
   '����', 2304000, 124000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1031, '����ȯ', '771115-1687988', '2001-01-21', '����', '019-5552-7511', '��ȹ��', 
   '����', 2450000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1032, '�ɽ���', '810206-2222222', '2000-05-05', '����', '016-8888-7474', '�����', 
   '���', 880000 , 108000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1033, '��̳�', '780505-2999999', '1998-06-07', '����', '011-2444-4444', '������', 
   '���', 1020000, 104000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1034, '������', '820505-1325468', '2005-09-26', '���', '011-3697-7412', '��ȹ��', 
   '���', 1100000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1035, '������', '831010-2153252', '2002-05-16', '��õ', NULL           , '���ߺ�', 
   '���', 1050000, 140000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1036, '���翵', '701126-2852147', '2003-08-10', '����', '011-9999-9999', '�����', 
   '���', 960400 , 190000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1037, '�ּ���', '770129-1456987', '1998-10-15', '��õ', '011-7777-7777', 'ȫ����', 
   '����', 2350000, 187000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1038, '���μ�', '791009-2321456', '1999-11-15', '�λ�', '010-6542-7412', '������', 
   '�븮', 2000000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1039, '������', '800504-2000032', '2003-12-28', '���', '010-2587-7895', '������', 
   '�븮', 2010000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1040, '�ڼ���', '790509-1635214', '2000-09-10', '���', '016-4444-7777', '�λ��', 
   '�븮', 2100000, 130000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1041, '�����', '721217-1951357', '2001-12-10', '�泲', '016-4444-5555', '�����', 
   '����', 2300000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1042, 'ä����', '810709-2000054', '2003-10-17', '���', '011-5125-5511', '���ߺ�', 
   '���', 1020000, 200000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1043, '��̿�', '830504-2471523', '2003-09-24', '����', '016-8548-6547', '������', 
   '���', 1100000, 210000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1044, '����ȯ', '820305-1475286', '2004-01-21', '����', '011-5555-7548', '������', 
   '���', 1060000, 220000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1045, 'ȫ����', '690906-1985214', '2003-03-16', '����', '011-7777-7777', '������', 
   '���', 960000 , 152000);			
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1046, '����', '760105-1458752', '1999-05-04', '�泲', '017-3333-3333', '�ѹ���', 
   '����', 2650000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1047, '�긶��', '780505-1234567', '2001-07-15', '����', '018-0505-0505', '������', 
   '�븮', 2100000, 112000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1048, '�̱��', '790604-1415141', '2001-06-07', '����', NULL           , '���ߺ�', 
   '�븮', 2050000, 106000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1049, '�̹̼�', '830908-2456548', '2000-04-07', '��õ', '010-6654-8854', '���ߺ�', 
   '���', 1300000, 130000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1050, '�̹���', '810403-2828287', '2003-06-07', '���', '011-8585-5252', 'ȫ����', 
   '�븮', 1950000, 103000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1051, '�ǿ���', '790303-2155554', '2000-06-04', '����', '011-5555-7548', '������', 
   '����', 2260000, 104000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1052, '�ǿ���', '820406-2000456', '2000-10-10', '���', '010-3644-5577', '��ȹ��', 
   '���', 1020000, 105000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1053, '��̽�', '800715-1313131', '1999-12-12', '����', '011-7585-7474', '�����', 
   '���', 960000 , 108000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1054, '����ȣ', '810705-1212141', '1999-10-16', '����', '016-1919-4242', 'ȫ����', 
   '���', 980000 , 114000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1055, '���ѳ�', '820506-2425153', '2004-06-07', '����', '016-2424-4242', '������', 
   '���', 1000000, 104000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1056, '������', '800605-1456987', '2004-08-13', '��õ', '010-7549-8654', '������', 
   '�븮', 1950000, 200000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1057, '�̹̰�', '780406-2003214', '1998-02-11', '���', '016-6542-7546', '�����', 
   '����', 2520000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1058, '�����', '800709-1321456', '2003-08-08', '��õ', '010-2415-5444', '��ȹ��', 
   '�븮', 1950000, 180000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1059, '�Ӽ���', '810809-2121244', '2001-10-10', '����', '011-4151-4154', '���ߺ�', 
   '���', 890000 , 102000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1060, '��ž�', '810809-2111111', '2001-10-10', '����', '011-4151-4444', '���ߺ�', 
   '���', 900000 , 102000);
COMMIT;
*/


---------------------------------------------------
/*
insa ���̺��� ���� ������ ��� ���
1001	ȫ�浿	771212-1022432	98/10/11	011-2356-4528	����	��ȹ��	����	2610000	200000
1002	�̼���	801007-1544236	00/11/29	010-4758-6532	���	�ѹ���	���	1320000	200000
1003	�̼���	770922-2312547	99/02/25	010-4231-1236	��õ	���ߺ�	����	2550000	160000
1004	������	790304-1788896	00/10/01	019-5236-4221	����	������	�븮	2100000	170000
1005	�Ѽ���	811112-1566789	04/08/13	018-5211-3542	����	�ѹ���	���	1420000	160000
1006	�̱���	780505-2978541	02/02/11	010-3214-5357	��õ	���ߺ�	����	2265000	150000
1007	����ö	780506-1625148	98/03/16	011-2345-2525	����	���ߺ�	�븮	2200000	150000
1008	�迵��	821011-2362514	02/04/30	016-2222-4444	����	ȫ����	���	950000	145000
1009	������	810810-1552147	03/10/10	019-1111-2222	���	�λ��	���	840000	220400
1010	������	751010-1122233	97/08/08	011-3214-5555	�λ�	������	����	2540000	130000
1011	������	801010-2987897	00/07/07	010-8888-4422	����	������	���	1020000	140000
1012	���ѱ�	760909-1333333	99/10/16	018-2222-4242	����	ȫ����	���	880000	114000
1013	���̼�	790102-2777777	98/06/07	019-6666-4444	���	ȫ����	�븮	1601000	103000
1014	Ȳ����	810707-2574812	02/02/15	010-3214-5467	��õ	���ߺ�	���	1100000	130000
1015	������	800606-2954687	99/07/26	016-2548-3365	���	�ѹ���	���	1050000	104000
1016	�̻���	781010-1666678	01/11/29	010-4526-1234	���	���ߺ�	����	2350000	150000
1017	�����	820507-1452365	00/08/28	010-3254-2542	��õ	���ߺ�	���	950000	210000
1018	�̼���	801028-1849534	04/08/08	018-1333-3333	����	���ߺ�	���	880000	123000
1019	�ڹ���	780710-1985632	99/12/10	017-4747-4848	����	�λ��	����	2300000	165000
1020	������	800304-2741258	03/10/10	011-9595-8585	����	�����	���	880000	140000
1021	ȫ�泲	801010-1111111	01/09/07	011-9999-7575	���	���ߺ�	���	875000	120000
1022	�̿���	800501-2312456	03/02/25	017-5214-5282	����	��ȹ��	�븮	1960000	180000
1023	���μ�	731211-1214576	95/02/23		        ����	������	����	2500000	170000
1024	�踻��	830225-2633334	99/08/28	011-5248-7789	����	��ȹ��	�븮	1900000	170000
1025	�����	801103-1654442	00/10/01	010-4563-2587	����	������	���	1100000	160000
1026	�����	810907-2015457	02/08/28	010-2112-5225	���	������	���	1050000	150000
1027	�迵��	801216-1898752	00/10/18	019-8523-1478	����	�ѹ���	����	2340000	170000
1028	�̳���	810101-1010101	01/09/07	016-1818-4848	����	�λ��	���	892000	110000
1029	�踻��	800301-2020202	00/09/08	016-3535-3636	����	�ѹ���	���	920000	124000
1030	������	790210-2101010	99/10/17	019-6564-6752	�λ�	�ѹ���	����	2304000	124000
1031	����ȯ	771115-1687988	01/01/21	019-5552-7511	����	��ȹ��	����	2450000	160000
1032	�ɽ���	810206-2222222	00/05/05	016-8888-7474	����	�����	���	880000	108000
1033	��̳�	780505-2999999	98/06/07	011-2444-4444	����	������	���	1020000	104000
1034	������	820505-1325468	05/09/26	011-3697-7412	���	��ȹ��	���	1100000	160000
1035	������	831010-2153252	02/05/16		        ��õ	���ߺ�	���	1050000	140000
1036	���翵	701126-2852147	03/08/10	011-9999-9999	����	�����	���	960400	190000
1037	�ּ���	770129-1456987	98/10/15	011-7777-7777	��õ	ȫ����	����	2350000	187000
1038	���μ�	791009-2321456	99/11/15	010-6542-7412	�λ�	������	�븮	2100000	150000
1039	������	800504-2000032	03/12/28	010-2587-7895	���	������	�븮	2100000	160000
1040	�ڼ���	790509-1635214	00/09/10	016-4444-7777	���	�λ��	�븮	2100000	130000
1041	�����	721217-1951357	01/12/10	016-4444-5555	�泲	�����	����	2300000	150000
1042	ä����	810709-2000054	03/10/17	011-5125-5511	���	���ߺ�	���	1020000	200000
1043	��̿�	830504-2471523	03/09/24	016-8548-6547	����	������	���	1100000	210000
1044	����ȯ	820305-1475286	04/01/21	011-5555-7548	����	������	���	1060000	220000
1045	ȫ����	690906-1985214	03/03/16	011-7777-7777	����	������	���	960000	152000
1046	����	760105-1458752	99/05/04	017-3333-3333	�泲	�ѹ���	����	2650000	150000
1047	�긶��	780505-1234567	01/07/15	018-0505-0505	����	������	�븮	2100000	112000
1048	�̱��	790604-1415141	01/06/07		        ����	���ߺ�	�븮	2200000	106000
1049	�̹̼�	830908-2456548	00/04/07	010-6654-8854	��õ	���ߺ�	���	1300000	130000
1050	�̹���	810403-2828287	03/06/07	011-8585-5252	���	ȫ����	�븮	1950000	103000
1051	�ǿ���	790303-2155554	00/06/04	011-5555-7548	����	������	����	2260000	104000
1052	�ǿ���	820406-2000456	00/10/10	010-3644-5577	���	��ȹ��	���	1020000	105000
1053	��̽�	800715-1313131	99/12/12	011-7585-7474	����	�����	���	960000	108000
1054	����ȣ	810705-1212141	99/10/16	016-1919-4242	����	ȫ����	���	980000	114000
1055	���ѳ�	820506-2425153	04/06/07	016-2424-4242	����	������	���	1000000	104000
1056	������	800605-1456987	04/08/13	010-7549-8654	��õ	������	�븮	2100000	200000
1057	�̹̰�	780406-2003214	98/02/11	016-6542-7546	���	�����	����	2520000	160000
1058	�����	800709-1321456	03/08/08	010-2415-5444	��õ	��ȹ��	�븮	1950000	180000
1059	�Ӽ���	810809-2121244	01/10/10	011-4151-4154	����	���ߺ�	���	890000	102000
1060	��ž�	810809-2111111	01/10/10	011-4151-4444	����	���ߺ�	���	900000	102000
*/


-----------------------------------------------------
/*
�۾� ����
1. ���� ���̺�(employees, regions, departments, jobs ���̺�) �غ�
2. insa ���̺����� ������ ���� ���̺�(employees ���̺�)�� �뷮 �Է�.
3. employees ���̺����� ����, �μ�, ������ ���� ������ ���� ���̺�(regions, departments, jobs ���̺�)�� �뷮 �Է�.
3. employees ���̺� ���� ����
4. employees, regions, departments, jobs ���̺��� ���� JOIN ���� �ۼ�.
5. .sql ���� ���� �� �׽�Ʈ
*/


-----------------------------------------------------
/*
����1) �纻 ���̺��� employees ���̺� �غ�
*/
CREATE TABLE employees (
        empId NUMBER(5) NOT NULL 
       ,name_ NVARCHAR2(20) NOT NULL
       ,ssn  VARCHAR2(14) NOT NULL
       ,hiredate DATE     NOT NULL
       ,phone   VARCHAR2(15)
       ,region  NVARCHAR2(2)
       ,department NVARCHAR2(3) NOT NULL
       ,job_ NVARCHAR2(2) NOT NULL
       ,basicpay NUMBER(10) NOT NULL
       ,extrapay NUMBER(10) NOT NULL
);




-----------------------------------------------------
/*
����2) insa ���̺��� ���� �ڷḦ employees ���̺��� �뷮 ����.
*/
INSERT INTO employees
    SELECT * FROM insa;





------------------------------------
/*
����3) ������ ����� ���� ���̺� �غ�
*/
CREATE TABLE regions (
	regId VARCHAR2(6)   --�Ϸù�ȣ (reg001, reg002, ... )
	,reg_name  NVARCHAR2(2)  --�ߺ����� ���� ���ø�
);



------------------------------
/*
����4) insa ���̺��� city �÷� ������ �ߺ����� �ʰ� �о�ͼ� regions ���̺��� reg_name �÷��� �Է��Ѵ�. ��, regId �÷����� �Ϸù�ȣ�� �ڵ� �Էµǵ��� �Ѵ�.
*/
INSERT INTO regions(regId, reg_name)
    SELECT CONCAT('reg',LPAD(ROWNUM,3,'0')) regId, city FROM (SELECT DISTINCT city FROM insa);
    
-------------------------------------
/*
����5) �μ��� ����� ���̺� �غ�
*/
CREATE TABLE departments (
	deptId VARCHAR2(7)   --�Ϸù�ȣ (dept001, dept002, ... )
	,dept_name  NVARCHAR2(3) NOT NULL
);

-------------------------
/*
����6) insa ���̺����� buseo �÷� �����͸� �ߺ����� �ʰ� �о�ͼ� departments ���̺��� dept_name �÷��� �Է��Ѵ�. ��, deptId�� �Ϸù�ȣ�� �ڵ� �Էµǵ��� �Ѵ�.
*/
INSERT INTO departments(deptId, dept_name)
    SELECT CONCAT('dep',LPAD(ROWNUM,3,'0')) deptId, buseo FROM (SELECT DISTINCT buseo FROM insa);
-------------------------------
/*
����7) ������ ����� ���̺� �غ�
*/
CREATE TABLE jobs (
	jobId VARCHAR2(6)   --�Ϸù�ȣ (job001, job002, ... )
	,job_title  NVARCHAR2(2) NOT NULL
);
-----------------------------
/*
����8) insa ���̺����� jikwi �÷� �����͸� �ߺ����� �ʰ� �о�ͼ� jobs ���̺��� job_title �÷��� �Է��Ѵ�. ��, jobId�� �Ϸù�ȣ�� �ڵ� �Էµǵ��� �Ѵ�.
*/
INSERT INTO jobs(jobId, job_title)
    SELECT CONCAT('job',LPAD(ROWNUM,3,'0')) regId, jikwi FROM (SELECT DISTINCT jikwi FROM insa);

-----------------------------------
/*
����9) employees ���̺��� regId, deptId, jobId �÷� �߰�. �ڷ����� regions, departments, jobs ���̺��� �÷� ������ �����ϰ� ����.
*/
ALTER TABLE employees
    ADD(regId VARCHAR2(6 BYTE), deptId VARCHAR2(7 BYTE), jobId VARCHAR2(6 BYTE));


---------------------------------
/*
����10) employees ���̺����� ���� ������ region, department, job_ ������ ������
�ű� �÷��� regId, deptId, jobId �÷��� ���� �ϰ� �����Ѵ�.
*/
UPDATE employees e
    SET e.regId =(SELECT r.regId FROM regions r WHERE e.region = r.reg_name),
        e.deptId =(SELECT d.deptId FROM departments d WHERE e.department = d.dept_name),
        e.jobId = (SELECT j.jobId FROM jobs j WHERE e.job_ = j.job_title);
    COMMIT;
-----------------------------
/*
����11) employees ���̺����� region, department, job �÷� ����.
*/
ALTER TABLE employees DROP(region, department, job_);





---------------------------
/*
����12) region ���̺��� ���� ���� �߰� (PK)
*/
ALTER TABLE regions
    ADD CONSTRAINT region_regid_PK PRIMARY KEY(regid);
---------------------------
/*
����13) departments ���̺��� ���� ���� �߰� (PK)
*/
ALTER TABLE departments
    ADD CONSTRAINT departments_deptid_PK PRIMARY KEY(deptid);
---------------------------
/*
����14) jobs ���̺��� ���� ���� �߰� (PK)
*/
ALTER TABLE jobs
    ADD CONSTRAINT jobs_jobid_PK PRIMARY KEY(jobid);


---------------------------
/*
����15) employees ���̺��� ���� ���� �߰� (PK, FK)
*/
ALTER TABLE employees  
    ADD (CONSTRAINT employees_empId_PK PRIMARY KEY(empId),
         CONSTRAINT employees_regId_FK FOREIGN KEY(regId) REFERENCES regions(regId),
         CONSTRAINT employees_deptId_FK FOREIGN KEY(deptId) REFERENCES departments(deptId),
         CONSTRAINT employees_jobId_FK FOREIGN KEY(jobId) REFERENCES jobs(jobId));
   
---------------------------------
/*
����16) jobs ���̺��� min_basicPay �÷�(�ּ� �⺻��) �߰�. min_basicPay �÷��� �ڷ����� NUMBER�� ����.
*/
ALTER TABLE jobs ADD min_basicPay NUMBER; 






---------------------------------
/*
����17) jobs ���̺��� min_basicPay �÷��� ���� �Է�. ������ �ּ� �⺻�� �׼��� ���Ƿ� ����. ���� ���, ����� �ּ� �⺻���� 1000000��.
*/
UPDATE jobs
    SET min_basicPay = DECODE(job_title, '���', 1000000, '�븮', 2000000, '����', 30000000 ,'����', 40000000); 
    
---------------------------------
/*
����18) employees, regions, departments, jobs ���̺��� ������, ���� ������ ������� ����� �� �ִ� JOIN ���� �ۼ�.
��¿�)
empId name_ ssn hiredate phone reg_name dept_name job_title basicpay extrapay pay
1001	ȫ�浿	771212-1022432	98/10/11	011-2356-4528	����	��ȹ��	����	2610000	200000 2810000
1002	�̼���	801007-1544236	00/11/29	010-4758-6532	���	�ѹ���	���	1320000	200000 1520000
1003	�̼���	770922-2312547	99/02/25	010-4231-1236	��õ	���ߺ�	����	2550000	160000 2710000
...
*/
SELECT empId, name_, ssn, hiredate, phone, reg_name, dept_name, job_title, e.basicpay, e.extrapay,(e.basicpay +e.extrapay) pay
    FROM employees e INNER JOIN regions r ON e.regid = r.regid
    INNER JOIN departments d ON e.deptid = d.deptid
    INNER JOIN jobs j ON e.jobid = j.jobid
    ORDER BY empId;








-----------------------------
/*
����19)  employees, regions, departments, jobs ���̺��� ������, ���� ������ ������� ����� �� �ִ� JOIN ���� �ۼ� �� �� �ۼ� (empView).
*/
/*CREATE OR REPLACE VIEW empView
AS SELECT empId, name_, ssn, hiredate, phone, reg_name, dept_name, job_title, e.basicpay, e.extrapay,(e.basicpay +e.extrapay) pay
    FROM employees e INNER JOIN regions r ON e.regid = r.regid
    INNER JOIN departments d ON e.deptid = d.deptid
    INNER JOIN jobs j ON e.jobid = j.jobid
    ORDER BY empId;*/






-----------------------------------
/*
����20) �ϰ�ó���� ���� insa_emp_customizing.sql ���� �ۼ�.
*/






--------------------------------
/*
����21) �׽�Ʈ ���� ����(������ �׼�) �� �׽�Ʈ ���� �α���, insa.sql, insa_emp_customizing.sql ���� ���� �׽�Ʈ(����� �׼�).
@��θ�/insa.sql
@��θ�/insa_emp_customizing.sql
*/





----------------------------------------------------