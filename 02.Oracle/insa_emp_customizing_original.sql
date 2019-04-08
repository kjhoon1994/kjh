---------------------------------------------------
/*
작업 개요
insa 테이블에서 city, buseo, jikwi 컬럼은 중복된 요소가 많이 존재합니다.
city, buseo, jikwi 컬럼은 원본인 insa 테이블에서 분리 대상입니다.
insa 테이블에서 중복된 요소를 제거하고 유일한 값들을 별도의 테이블에 입력해야 한다.
*/

----------------------------------------------------
/*
insa 테이블 원본 상태
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
insa 테이블 원본 데이터
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1001, '홍길동', '771212-1022432', '1998-10-11', '서울', '011-2356-4528', '기획부', 
   '부장', 2610000, 200000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1002, '이순신', '801007-1544236', '2000-11-29', '경기', '010-4758-6532', '총무부', 
   '사원', 1320000, 200000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1003, '이순애', '770922-2312547', '1999-02-25', '인천', '010-4231-1236', '개발부', 
   '부장', 2550000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1004, '김정훈', '790304-1788896', '2000-10-01', '전북', '019-5236-4221', '영업부', 
   '대리', 1954200, 170000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1005, '한석봉', '811112-1566789', '2004-08-13', '서울', '018-5211-3542', '총무부', 
   '사원', 1420000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1006, '이기자', '780505-2978541', '2002-02-11', '인천', '010-3214-5357', '개발부', 
   '과장', 2265000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1007, '장인철', '780506-1625148', '1998-03-16', '제주', '011-2345-2525', '개발부', 
   '대리', 1250000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1008, '김영년', '821011-2362514', '2002-04-30', '서울', '016-2222-4444', '홍보부',    
'사원', 950000 , 145000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1009, '나윤균', '810810-1552147', '2003-10-10', '경기', '019-1111-2222', '인사부', 
   '사원', 840000 , 220400);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1010, '김종서', '751010-1122233', '1997-08-08', '부산', '011-3214-5555', '영업부', 
   '부장', 2540000, 130000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1011, '유관순', '801010-2987897', '2000-07-07', '서울', '010-8888-4422', '영업부', 
   '사원', 1020000, 140000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1012, '정한국', '760909-1333333', '1999-10-16', '강원', '018-2222-4242', '홍보부', 
   '사원', 880000 , 114000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1013, '조미숙', '790102-2777777', '1998-06-07', '경기', '019-6666-4444', '홍보부', 
   '대리', 1601000, 103000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1014, '황진이', '810707-2574812', '2002-02-15', '인천', '010-3214-5467', '개발부', 
   '사원', 1100000, 130000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1015, '이현숙', '800606-2954687', '1999-07-26', '경기', '016-2548-3365', '총무부', 
   '사원', 1050000, 104000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1016, '이상헌', '781010-1666678', '2001-11-29', '경기', '010-4526-1234', '개발부', 
   '과장', 2350000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1017, '엄용수', '820507-1452365', '2000-08-28', '인천', '010-3254-2542', '개발부', 
   '사원', 950000 , 210000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1018, '이성길', '801028-1849534', '2004-08-08', '전북', '018-1333-3333', '개발부', 
   '사원', 880000 , 123000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1019, '박문수', '780710-1985632', '1999-12-10', '서울', '017-4747-4848', '인사부', 
   '과장', 2300000, 165000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1020, '유영희', '800304-2741258', '2003-10-10', '전남', '011-9595-8585', '자재부', 
   '사원', 880000 , 140000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1021, '홍길남', '801010-1111111', '2001-09-07', '경기', '011-9999-7575', '개발부', 
   '사원', 875000 , 120000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1022, '이영숙', '800501-2312456', '2003-02-25', '전남', '017-5214-5282', '기획부', 
   '대리', 1960000, 180000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1023, '김인수', '731211-1214576', '1995-02-23', '서울', NULL           , '영업부', 
   '부장', 2500000, 170000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1024, '김말자', '830225-2633334', '1999-08-28', '서울', '011-5248-7789', '기획부', 
   '대리', 1900000, 170000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1025, '우재옥', '801103-1654442', '2000-10-01', '서울', '010-4563-2587', '영업부', 
   '사원', 1100000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1026, '김숙남', '810907-2015457', '2002-08-28', '경기', '010-2112-5225', '영업부', 
   '사원', 1050000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1027, '김영길', '801216-1898752', '2000-10-18', '서울', '019-8523-1478', '총무부', 
   '과장', 2340000, 170000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1028, '이남신', '810101-1010101', '2001-09-07', '제주', '016-1818-4848', '인사부', 
   '사원', 892000 , 110000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1029, '김말숙', '800301-2020202', '2000-09-08', '서울', '016-3535-3636', '총무부', 
   '사원', 920000 , 124000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1030, '정정해', '790210-2101010', '1999-10-17', '부산', '019-6564-6752', '총무부', 
   '과장', 2304000, 124000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1031, '지재환', '771115-1687988', '2001-01-21', '서울', '019-5552-7511', '기획부', 
   '부장', 2450000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1032, '심심해', '810206-2222222', '2000-05-05', '전북', '016-8888-7474', '자재부', 
   '사원', 880000 , 108000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1033, '김미나', '780505-2999999', '1998-06-07', '서울', '011-2444-4444', '영업부', 
   '사원', 1020000, 104000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1034, '이정석', '820505-1325468', '2005-09-26', '경기', '011-3697-7412', '기획부', 
   '사원', 1100000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1035, '정영희', '831010-2153252', '2002-05-16', '인천', NULL           , '개발부', 
   '사원', 1050000, 140000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1036, '이재영', '701126-2852147', '2003-08-10', '서울', '011-9999-9999', '자재부', 
   '사원', 960400 , 190000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1037, '최석규', '770129-1456987', '1998-10-15', '인천', '011-7777-7777', '홍보부', 
   '과장', 2350000, 187000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1038, '손인수', '791009-2321456', '1999-11-15', '부산', '010-6542-7412', '영업부', 
   '대리', 2000000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1039, '고순정', '800504-2000032', '2003-12-28', '경기', '010-2587-7895', '영업부', 
   '대리', 2010000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1040, '박세열', '790509-1635214', '2000-09-10', '경북', '016-4444-7777', '인사부', 
   '대리', 2100000, 130000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1041, '문길수', '721217-1951357', '2001-12-10', '충남', '016-4444-5555', '자재부', 
   '과장', 2300000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1042, '채정희', '810709-2000054', '2003-10-17', '경기', '011-5125-5511', '개발부', 
   '사원', 1020000, 200000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1043, '양미옥', '830504-2471523', '2003-09-24', '서울', '016-8548-6547', '영업부', 
   '사원', 1100000, 210000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1044, '지수환', '820305-1475286', '2004-01-21', '서울', '011-5555-7548', '영업부', 
   '사원', 1060000, 220000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1045, '홍원신', '690906-1985214', '2003-03-16', '전북', '011-7777-7777', '영업부', 
   '사원', 960000 , 152000);			
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1046, '허경운', '760105-1458752', '1999-05-04', '경남', '017-3333-3333', '총무부', 
   '부장', 2650000, 150000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1047, '산마루', '780505-1234567', '2001-07-15', '서울', '018-0505-0505', '영업부', 
   '대리', 2100000, 112000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1048, '이기상', '790604-1415141', '2001-06-07', '전남', NULL           , '개발부', 
   '대리', 2050000, 106000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1049, '이미성', '830908-2456548', '2000-04-07', '인천', '010-6654-8854', '개발부', 
   '사원', 1300000, 130000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1050, '이미인', '810403-2828287', '2003-06-07', '경기', '011-8585-5252', '홍보부', 
   '대리', 1950000, 103000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1051, '권영미', '790303-2155554', '2000-06-04', '서울', '011-5555-7548', '영업부', 
   '과장', 2260000, 104000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1052, '권옥경', '820406-2000456', '2000-10-10', '경기', '010-3644-5577', '기획부', 
   '사원', 1020000, 105000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1053, '김싱식', '800715-1313131', '1999-12-12', '전북', '011-7585-7474', '자재부', 
   '사원', 960000 , 108000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1054, '정상호', '810705-1212141', '1999-10-16', '강원', '016-1919-4242', '홍보부', 
   '사원', 980000 , 114000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1055, '정한나', '820506-2425153', '2004-06-07', '서울', '016-2424-4242', '영업부', 
   '사원', 1000000, 104000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1056, '전용재', '800605-1456987', '2004-08-13', '인천', '010-7549-8654', '영업부', 
   '대리', 1950000, 200000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1057, '이미경', '780406-2003214', '1998-02-11', '경기', '016-6542-7546', '자재부', 
   '부장', 2520000, 160000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1058, '김신제', '800709-1321456', '2003-08-08', '인천', '010-2415-5444', '기획부', 
   '대리', 1950000, 180000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1059, '임수봉', '810809-2121244', '2001-10-10', '서울', '011-4151-4154', '개발부', 
   '사원', 890000 , 102000);
INSERT INTO insa (num, name, ssn, ibsaDate, city, tel, buseo, jikwi, basicPay, sudang) VALUES
  (1060, '김신애', '810809-2111111', '2001-10-10', '서울', '011-4151-4444', '개발부', 
   '사원', 900000 , 102000);
COMMIT;
*/


---------------------------------------------------
/*
insa 테이블의 원시 데이터 출력 결과
1001	홍길동	771212-1022432	98/10/11	011-2356-4528	서울	기획부	부장	2610000	200000
1002	이순신	801007-1544236	00/11/29	010-4758-6532	경기	총무부	사원	1320000	200000
1003	이순애	770922-2312547	99/02/25	010-4231-1236	인천	개발부	부장	2550000	160000
1004	김정훈	790304-1788896	00/10/01	019-5236-4221	전북	영업부	대리	2100000	170000
1005	한석봉	811112-1566789	04/08/13	018-5211-3542	서울	총무부	사원	1420000	160000
1006	이기자	780505-2978541	02/02/11	010-3214-5357	인천	개발부	과장	2265000	150000
1007	장인철	780506-1625148	98/03/16	011-2345-2525	제주	개발부	대리	2200000	150000
1008	김영년	821011-2362514	02/04/30	016-2222-4444	서울	홍보부	사원	950000	145000
1009	나윤균	810810-1552147	03/10/10	019-1111-2222	경기	인사부	사원	840000	220400
1010	김종서	751010-1122233	97/08/08	011-3214-5555	부산	영업부	부장	2540000	130000
1011	유관순	801010-2987897	00/07/07	010-8888-4422	서울	영업부	사원	1020000	140000
1012	정한국	760909-1333333	99/10/16	018-2222-4242	강원	홍보부	사원	880000	114000
1013	조미숙	790102-2777777	98/06/07	019-6666-4444	경기	홍보부	대리	1601000	103000
1014	황진이	810707-2574812	02/02/15	010-3214-5467	인천	개발부	사원	1100000	130000
1015	이현숙	800606-2954687	99/07/26	016-2548-3365	경기	총무부	사원	1050000	104000
1016	이상헌	781010-1666678	01/11/29	010-4526-1234	경기	개발부	과장	2350000	150000
1017	엄용수	820507-1452365	00/08/28	010-3254-2542	인천	개발부	사원	950000	210000
1018	이성길	801028-1849534	04/08/08	018-1333-3333	전북	개발부	사원	880000	123000
1019	박문수	780710-1985632	99/12/10	017-4747-4848	서울	인사부	과장	2300000	165000
1020	유영희	800304-2741258	03/10/10	011-9595-8585	전남	자재부	사원	880000	140000
1021	홍길남	801010-1111111	01/09/07	011-9999-7575	경기	개발부	사원	875000	120000
1022	이영숙	800501-2312456	03/02/25	017-5214-5282	전남	기획부	대리	1960000	180000
1023	김인수	731211-1214576	95/02/23		        서울	영업부	부장	2500000	170000
1024	김말자	830225-2633334	99/08/28	011-5248-7789	서울	기획부	대리	1900000	170000
1025	우재옥	801103-1654442	00/10/01	010-4563-2587	서울	영업부	사원	1100000	160000
1026	김숙남	810907-2015457	02/08/28	010-2112-5225	경기	영업부	사원	1050000	150000
1027	김영길	801216-1898752	00/10/18	019-8523-1478	서울	총무부	과장	2340000	170000
1028	이남신	810101-1010101	01/09/07	016-1818-4848	제주	인사부	사원	892000	110000
1029	김말숙	800301-2020202	00/09/08	016-3535-3636	서울	총무부	사원	920000	124000
1030	정정해	790210-2101010	99/10/17	019-6564-6752	부산	총무부	과장	2304000	124000
1031	지재환	771115-1687988	01/01/21	019-5552-7511	서울	기획부	부장	2450000	160000
1032	심심해	810206-2222222	00/05/05	016-8888-7474	전북	자재부	사원	880000	108000
1033	김미나	780505-2999999	98/06/07	011-2444-4444	서울	영업부	사원	1020000	104000
1034	이정석	820505-1325468	05/09/26	011-3697-7412	경기	기획부	사원	1100000	160000
1035	정영희	831010-2153252	02/05/16		        인천	개발부	사원	1050000	140000
1036	이재영	701126-2852147	03/08/10	011-9999-9999	서울	자재부	사원	960400	190000
1037	최석규	770129-1456987	98/10/15	011-7777-7777	인천	홍보부	과장	2350000	187000
1038	손인수	791009-2321456	99/11/15	010-6542-7412	부산	영업부	대리	2100000	150000
1039	고순정	800504-2000032	03/12/28	010-2587-7895	경기	영업부	대리	2100000	160000
1040	박세열	790509-1635214	00/09/10	016-4444-7777	경북	인사부	대리	2100000	130000
1041	문길수	721217-1951357	01/12/10	016-4444-5555	충남	자재부	과장	2300000	150000
1042	채정희	810709-2000054	03/10/17	011-5125-5511	경기	개발부	사원	1020000	200000
1043	양미옥	830504-2471523	03/09/24	016-8548-6547	서울	영업부	사원	1100000	210000
1044	지수환	820305-1475286	04/01/21	011-5555-7548	서울	영업부	사원	1060000	220000
1045	홍원신	690906-1985214	03/03/16	011-7777-7777	전북	영업부	사원	960000	152000
1046	허경운	760105-1458752	99/05/04	017-3333-3333	경남	총무부	부장	2650000	150000
1047	산마루	780505-1234567	01/07/15	018-0505-0505	서울	영업부	대리	2100000	112000
1048	이기상	790604-1415141	01/06/07		        전남	개발부	대리	2200000	106000
1049	이미성	830908-2456548	00/04/07	010-6654-8854	인천	개발부	사원	1300000	130000
1050	이미인	810403-2828287	03/06/07	011-8585-5252	경기	홍보부	대리	1950000	103000
1051	권영미	790303-2155554	00/06/04	011-5555-7548	서울	영업부	과장	2260000	104000
1052	권옥경	820406-2000456	00/10/10	010-3644-5577	경기	기획부	사원	1020000	105000
1053	김싱식	800715-1313131	99/12/12	011-7585-7474	전북	자재부	사원	960000	108000
1054	정상호	810705-1212141	99/10/16	016-1919-4242	강원	홍보부	사원	980000	114000
1055	정한나	820506-2425153	04/06/07	016-2424-4242	서울	영업부	사원	1000000	104000
1056	전용재	800605-1456987	04/08/13	010-7549-8654	인천	영업부	대리	2100000	200000
1057	이미경	780406-2003214	98/02/11	016-6542-7546	경기	자재부	부장	2520000	160000
1058	김신제	800709-1321456	03/08/08	010-2415-5444	인천	기획부	대리	1950000	180000
1059	임수봉	810809-2121244	01/10/10	011-4151-4154	서울	개발부	사원	890000	102000
1060	김신애	810809-2111111	01/10/10	011-4151-4444	서울	개발부	사원	900000	102000
*/


-----------------------------------------------------
/*
작업 순서
1. 전용 테이블(employees, regions, departments, jobs 테이블) 준비
2. insa 테이블에서 값들을 전용 테이블(employees 테이블)에 대량 입력.
3. employees 테이블에서 지역, 부서, 직위에 대한 정보를 전용 테이블(regions, departments, jobs 테이블)에 대량 입력.
3. employees 테이블 구조 변경
4. employees, regions, departments, jobs 테이블에 대한 JOIN 구문 작성.
5. .sql 파일 생성 및 테스트
*/


-----------------------------------------------------
/*
문제1) 사본 테이블인 employees 테이블 준비
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
문제2) insa 테이블에 대한 자료를 employees 테이블로 대량 복사.
*/
INSERT INTO employees
    SELECT * FROM insa;





------------------------------------
/*
문제3) 지역명 저장용 전용 테이블 준비
*/
CREATE TABLE regions (
	regId VARCHAR2(6)   --일련번호 (reg001, reg002, ... )
	,reg_name  NVARCHAR2(2)  --중복되지 않은 도시명
);



------------------------------
/*
문제4) insa 테이블의 city 컬럼 정보를 중복되지 않게 읽어와서 regions 테이블의 reg_name 컬럼에 입력한다. 단, regId 컬럼에는 일련번호가 자동 입력되도록 한다.
*/
INSERT INTO regions(regId, reg_name)
    SELECT CONCAT('reg',LPAD(ROWNUM,3,'0')) regId, city FROM (SELECT DISTINCT city FROM insa);
    
-------------------------------------
/*
문제5) 부서명 저장용 테이블 준비
*/
CREATE TABLE departments (
	deptId VARCHAR2(7)   --일련번호 (dept001, dept002, ... )
	,dept_name  NVARCHAR2(3) NOT NULL
);

-------------------------
/*
문제6) insa 테이블에서 buseo 컬럼 데이터를 중복되지 않게 읽어와서 departments 테이블의 dept_name 컬럼에 입력한다. 단, deptId는 일련번호가 자동 입력되도록 한다.
*/
INSERT INTO departments(deptId, dept_name)
    SELECT CONCAT('dep',LPAD(ROWNUM,3,'0')) deptId, buseo FROM (SELECT DISTINCT buseo FROM insa);
-------------------------------
/*
문제7) 직위명 저장용 테이블 준비
*/
CREATE TABLE jobs (
	jobId VARCHAR2(6)   --일련번호 (job001, job002, ... )
	,job_title  NVARCHAR2(2) NOT NULL
);
-----------------------------
/*
문제8) insa 테이블에서 jikwi 컬럼 데이터를 중복되지 않게 읽어와서 jobs 테이블의 job_title 컬럼에 입력한다. 단, jobId는 일련번호가 자동 입력되도록 한다.
*/
INSERT INTO jobs(jobId, job_title)
    SELECT CONCAT('job',LPAD(ROWNUM,3,'0')) regId, jikwi FROM (SELECT DISTINCT jikwi FROM insa);

-----------------------------------
/*
문제9) employees 테이블에 regId, deptId, jobId 컬럼 추가. 자료형은 regions, departments, jobs 테이블의 컬럼 구조와 동일하게 지정.
*/
ALTER TABLE employees
    ADD(regId VARCHAR2(6 BYTE), deptId VARCHAR2(7 BYTE), jobId VARCHAR2(6 BYTE));


---------------------------------
/*
문제10) employees 테이블에서 기존 직원의 region, department, job_ 정보를 가지고
신규 컬럼인 regId, deptId, jobId 컬럼의 값을 일괄 수정한다.
*/
UPDATE employees e
    SET e.regId =(SELECT r.regId FROM regions r WHERE e.region = r.reg_name),
        e.deptId =(SELECT d.deptId FROM departments d WHERE e.department = d.dept_name),
        e.jobId = (SELECT j.jobId FROM jobs j WHERE e.job_ = j.job_title);
    COMMIT;
-----------------------------
/*
문제11) employees 테이블에서 region, department, job 컬럼 삭제.
*/
ALTER TABLE employees DROP(region, department, job_);





---------------------------
/*
문제12) region 테이블에 제약 조건 추가 (PK)
*/
ALTER TABLE regions
    ADD CONSTRAINT region_regid_PK PRIMARY KEY(regid);
---------------------------
/*
문제13) departments 테이블에 제약 조건 추가 (PK)
*/
ALTER TABLE departments
    ADD CONSTRAINT departments_deptid_PK PRIMARY KEY(deptid);
---------------------------
/*
문제14) jobs 테이블에 제약 조건 추가 (PK)
*/
ALTER TABLE jobs
    ADD CONSTRAINT jobs_jobid_PK PRIMARY KEY(jobid);


---------------------------
/*
문제15) employees 테이블에 제약 조건 추가 (PK, FK)
*/
ALTER TABLE employees  
    ADD (CONSTRAINT employees_empId_PK PRIMARY KEY(empId),
         CONSTRAINT employees_regId_FK FOREIGN KEY(regId) REFERENCES regions(regId),
         CONSTRAINT employees_deptId_FK FOREIGN KEY(deptId) REFERENCES departments(deptId),
         CONSTRAINT employees_jobId_FK FOREIGN KEY(jobId) REFERENCES jobs(jobId));
   
---------------------------------
/*
문제16) jobs 테이블에 min_basicPay 컬럼(최소 기본급) 추가. min_basicPay 컬럼의 자료형은 NUMBER로 지정.
*/
ALTER TABLE jobs ADD min_basicPay NUMBER; 






---------------------------------
/*
문제17) jobs 테이블의 min_basicPay 컬럼에 정보 입력. 직위별 최소 기본급 액수는 임의로 지정. 예를 들어, 사원의 최소 기본급은 1000000원.
*/
UPDATE jobs
    SET min_basicPay = DECODE(job_title, '사원', 1000000, '대리', 2000000, '과장', 3000000 ,'부장', 4000000); 
    
---------------------------------
/*
문제18) employees, regions, departments, jobs 테이블을 가지고, 원시 데이터 모습으로 출력할 수 있는 JOIN 쿼리 작성.
출력예)
empId name_ ssn hiredate phone reg_name dept_name job_title basicpay extrapay pay
1001	홍길동	771212-1022432	98/10/11	011-2356-4528	서울	기획부	부장	2610000	200000 2810000
1002	이순신	801007-1544236	00/11/29	010-4758-6532	경기	총무부	사원	1320000	200000 1520000
1003	이순애	770922-2312547	99/02/25	010-4231-1236	인천	개발부	부장	2550000	160000 2710000
...
*/
SELECT empId, name_, ssn, hiredate, phone, reg_name, dept_name, job_title, e.basicpay, e.extrapay,(e.basicpay +e.extrapay) pay
    FROM employees e INNER JOIN regions r ON e.regid = r.regid
    INNER JOIN departments d ON e.deptid = d.deptid
    INNER JOIN jobs j ON e.jobid = j.jobid
    ORDER BY empId;

------------------------------
/*
문제19)  employees, regions, departments, jobs 테이블을 가지고, 원시 데이터 모습으로 출력할 수 있는 JOIN 쿼리 작성 및 뷰 작성 (empView).
*/
CREATE OR REPLACE VIEW empView
AS SELECT empId, name_, ssn, hiredate, phone, reg_name, dept_name, job_title, e.basicpay, e.extrapay,(e.basicpay +e.extrapay) pay
    FROM employees e INNER JOIN regions r ON e.regid = r.regid
    INNER JOIN departments d ON e.deptid = d.deptid
    INNER JOIN jobs j ON e.jobid = j.jobid
    ORDER BY empId; 






-----------------------------------
/*
문제20) 일괄처리를 위한 insa_emp_customizing.sql 파일 작성.
*/






--------------------------------
/*
문제21) 테스트 계정 생성(관리자 액션) 및 테스트 계정 로그인, insa.sql, insa_emp_customizing.sql 파일 실행 테스트(사용자 액션).
@경로명/insa.sql
@경로명/insa_emp_customizing.sql
*/





----------------------------------------------------