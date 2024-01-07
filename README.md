# 🐶 보듬 동물병원 그룹웨어 🐱 <br> (Bodeum Animal Medical Center)
<li>프로젝트 개요</li>
<li>개발 환경 및 도구</li>
<li>기능 구현</li>
<br>
<details>
  
<summary>접기/펼치기</summary>

  
교육원   : 구디아카데미


강  사   : 김대기 


과정명   : 클라우드 활용 자바개발자 양성과정


최종 Branch : master


</details>
<br>

# 프로젝트 개요 <br>

<img src="https://github.com/kimseeun10/AnimalHospital/assets/137882823/c8ec1f67-952a-4958-a88b-8c1fc42484ef" width="300px" height="200px"/> <br>

><p><strong>프로젝트</strong>: 동물병원 그룹웨어</p>
><p><strong>기획 및 제작</strong>: 김세은, 송지선, 송윤호, 최혜령 </p>
><p><strong>분류</strong>: 팀 프로젝트</p>
><p><strong>제작 기간</strong>: 2023.10.04 ~ 11.20</p>
><p><strong>배포일</strong>: 2023.11.20</p>
><p><strong>사용 기술</strong>: SPRING BOOT</p> 
<br>

# 개발 환경 및 도구 <br>

![FRAMEWORK](https://img.shields.io/badge/framework-000000.svg?style=for-the-badge&logo=framework1&logoColor=white) ![Spring Boot](https://img.shields.io/badge/springboot-6DB33F.svg?style=for-the-badge&logo=springboot&logoColor=white) 

![LIBRARY](https://img.shields.io/badge/library-000000.svg?style=for-the-badge&logo=library&logoColor=white) ![JQuery](https://img.shields.io/badge/jquery-0769AD.svg?style=for-the-badge&logo=jquery&logoColor=white) ![Lombok](https://img.shields.io/badge/lombok-FF5722.svg?style=for-the-badge&logo=lombok&logoColor=white) 

![IDE](https://img.shields.io/badge/ide-000000.svg?style=for-the-badge&logo=ide&logoColor=white) ![SpringToolSuite4](https://img.shields.io/badge/SpringToolSuite4-6DB33F.svg?style=for-the-badge&logo=spring&logoColor=white) ![visualstudiocode](https://img.shields.io/badge/visualstudiocode-007ACC.svg?style=for-the-badge&logo=visualstudiocode&logoColor=white) ![dbeaver](https://img.shields.io/badge/dbeaver-382923.svg?style=for-the-badge&logo=dbeaver&logoColor=white) 

![LANGUAGE](https://img.shields.io/badge/language-000000.svg?style=for-the-badge&logo=language&logoColor=white) ![Java](https://img.shields.io/badge/java-FF0000.svg?style=for-the-badge&logo=java&logoColor=white) ![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white) ![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white) ![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E) 

![DB](https://img.shields.io/badge/DB-000000.svg?style=for-the-badge&logo=DB&logoColor=white) ![mariadb](https://img.shields.io/badge/mariadb-003545.svg?style=for-the-badge&logo=mariadb&logoColor=white)

![SERVER](https://img.shields.io/badge/SERVER-000000.svg?style=for-the-badge&logo=SERVER&logoColor=white) ![apachetomcat](https://img.shields.io/badge/apachetomcat-F8DC75.svg?style=for-the-badge&logo=apachetomcat&logoColor=white)

![OS](https://img.shields.io/badge/OS-000000.svg?style=for-the-badge&logo=OS&logoColor=white) ![windows](https://img.shields.io/badge/windows-0078D4.svg?style=for-the-badge&logo=windows&logoColor=white)

![HOSTING](https://img.shields.io/badge/HOSTING-000000.svg?style=for-the-badge&logo=HOSTING&logoColor=white) ![AWS](https://img.shields.io/badge/aws-232F3E.svg?style=for-the-badge&logo=amazonaws&logoColor=white)

![OTHER](https://img.shields.io/badge/OTHER-000000.svg?style=for-the-badge&logo=OTHER&logoColor=white) ![docker](https://img.shields.io/badge/docker-2496ED.svg?style=for-the-badge&logo=docker&logoColor=white) ![slack](https://img.shields.io/badge/slack-4A154B.svg?style=for-the-badge&logo=slack&logoColor=white) ![github](https://img.shields.io/badge/github-181717.svg?style=for-the-badge&logo=github&logoColor=white)

<br>

# 내 담당 기능 <br>

- Git 관리 담당
- AWS 배포 담당
- Spring Security를 사용한 로그인, 로그아웃 구현
- 이메일 인증을 통한 비밀번호 찾기
- 마이페이지와 전자 서명 관리
- 사원 관리 페이지에서 사원 등록, 상세, 수정, 목록 페이징 처리 및 검색기능
- 사원 등록 시 이메일로 생성된 사원번호와 비밀번호 전송
- 부서 관리 페이지에서 부서 생성, 상세, 수정, 삭제
- 부서 관리 페이지에서 직급 생성, 삭제
- 부서 관리 페이지에서 해당 부서에 재직중인 사원 목록 출력, 페이징 처리
- 공지사항 게시판 목록, 등록, 상세, 수정, 삭제
- 공지사항 상세에서 첨부파일 다운로드, 조회수 업데이트

<br>

# 기능 구현 <br>

### 🔒 로그인
<img src="https://github.com/kimseeun10/AnimalHospital/assets/137882823/a0e83807-95df-4278-b104-9a676b398b52" width="700px" height="500px"/>

**- 로그인 화면**

사원번호와 비밀번호를 사용하여 로그인을 하며 사원번호가 존재하지 않는 경우, 비밀번호가 일치하지 않는 경우<br>
JSP에 <spring:message>를 사용하여 메세지가 로그인 실패 문구로 나오도록 구현하였습니다.

<br>
<img src="https://github.com/kimseeun10/AnimalHospital/assets/137882823/c1473657-4ac5-4a5d-b1ef-998eb26295a2" width="700px" height="500px"/>

**- 비밀번호 찾기 화면**

DB에 입력한 정보와 일치하는 사원이 존재하는지 확인 후 이메일 인증을 통해 비밀번호 변경 페이지로 이동됩니다. <br> 발송된 인증번호와 입력한 인증번호가 일치하지 않으면 비밀번호 변경 페이지로 이동되지 않습니다.

<br>
<img src="https://github.com/kimseeun10/AnimalHospital/assets/137882823/708b5621-2b0e-40eb-a5cc-d662f858754e" width="700px" height="500px"/>

**- 마이페이지 화면**

- 마이페이지에서 내 정보 수정, 비밀번호 변경, 전자서명 관리를 할 수 있습니다.
- 마이페이지는 수정사항이 바로 적용되며 topbar의 프로필은 재로그인 후 반영됩니다.
- 전자서명은 1개의 이미지 파일을 무조건 등록하여야 하기 때문에 DB에 전자서명 값이 존재하는지 확인 후 존재하지 않는다면 insert, 존재하는 값이 있다면 update처리할 수 있도록 “INSERT INTO ... ON DUPLICATE KEY UPDATE“를 사용한 sql문을 작성하였습니다.

---

### 👨‍💼 관리자 - 사원관리
<img src="https://github.com/kimseeun10/AnimalHospital/assets/137882823/c1b589f9-a5bc-4a46-af7a-954917854745" width="700px" height="500px"/>

**사원추가 화면**

- 오른쪽 하단 추가 버튼을 클릭하면 사원 등록 modal창이 나타나며 새로 등록할 사원의 정보를 정규식에 맞게 입력, 이메일 중복확인 후 사원을 추가할 수 있습니다.
- modal창에서 추가 버튼을 클릭하면 신규 직원을 추가와 동시에 입력한 이메일로 사원번호와 초기 비밀번호를 안내하는 메일이 자동으로 발송됩니다.
- 최초 로그인 시 비밀번호 변경을 필수로 진행해야하며 비밀번호 변경 시 변경 가능한 비밀번호라면(정규식에 부합한다면) 체크표시가 나옵니다.

<br>
<img src="https://github.com/kimseeun10/AnimalHospital/assets/137882823/db36fe15-ff80-483b-82e9-72f239e227f9" width="700px" height="500px"/>

**사원 목록, 상세, 수정, 검색 화면**

- 사원 목록에서 사원번호 또는 사원의 이름을 클릭하면 해당 사원의 정보를 확인할 수 있습니다.
- 신규 직원 등록 시 기본 프로필 이미지 및 가발령 상태이며 수정을 통해 부서와 직급 배정이 가능합니다.
- 사원 상세에서 오른쪽 하단 수정버튼을 클릭하여 사원의 이름, 부서와 직급, 상태를 변경할 수 있으며 부서를 1차 선택하면 2차 선택값인 직급이 부서에 존재하는 직급만 나오도록 구현하였습니다.
- 사원 목록에서 이름과 사원번호로 사원을 검색할 수 있습니다.

<br>
<img src="https://github.com/kimseeun10/AnimalHospital/assets/137882823/480acd7b-94f5-4d5e-8398-62722c33b9e4" width="700px" height="500px"/>

**직원상세페이지**

직원이 마이페이지를 통해 수정한 사진 및 개인정보 확인이 가능하다.

---

### ⚙ 관리자 - 부서 및 직급 관리
<img src="https://github.com/kimseeun10/AnimalHospital/assets/137882823/1f5612a1-f216-4030-9c96-594594ecb54f" width="700px" height="500px"/>

**부서 및 직급 화면**

- 조직도는 JStree를 사용하여 상위부서와 하위부서를 한눈에 볼 수 있도록 구현하였습니다.
- 조직도에서 특정 부서를 클릭하면 그 부서의 정보와 재직중인 사원의 목록을 확인 할 수 있으며 직급 확인 버튼을 클릭하여 부서에 존재하는 직급을 확인할 수 있습니다.

<br>
<img src="https://github.com/kimseeun10/AnimalHospital/assets/137882823/97ed0a34-5dbb-409f-9bff-9c89055dc72c" width="700px" height="500px"/>

**부서 및 직급 관리 화면**

- 조직도 상단 부서등록 버튼을 클릭하여 부서명과 상위부서를 입력하여 신규 부서를 등록할 수 있습니다.
- 부서 상세 페이지에서 수정버튼을 클릭하면 해당 부서를 수정할 수 있는 페이지로 이동합니다.
- 부서 관리 페이지에서 직급을 추가, 삭제 할 수 있으며 부서명과 상위부서를 변경할 수 있습니다.
- 부서 상세에서 새로 추가된 직급을 확인 할 수 있으며 부서 삭제 버튼을 클릭하여 삭제가 가능합니다. 

---

### 📢 공지사항 게시판
<img src="https://github.com/kimseeun10/AnimalHospital/assets/137882823/769cd669-34e9-42b6-9c1a-06711a0e8817" width="700px" height="500px"/>

**공지사항 목록 화면**

- 중요와 일반으로 분류하여 중요글이 공지사항 목록 상단에 위치합니다.
- 제목과 내용으로 글을 검색할 수 있습니다.
- 오른쪽 하단 등록 버튼을 클릭하여 새로운 글을 등록할 수 있습니다.
  
<br>
<img src="https://github.com/kimseeun10/AnimalHospital/assets/137882823/4781b42a-14be-4e42-9574-6a8a4103e85f" width="700px" height="500px"/>

**공지사항 작성, 수정 화면**
공지사항 게시글 등록 및 수정 시 summernote 에디터 사용하여 본문 내용 작성 및 수정이 가능하며 <br> FILES에 이미지가 아닌 다른 파일들을 추가로 업로드, 삭제 할 수 있습니다.
  
<br>
<img src="https://github.com/kimseeun10/AnimalHospital/assets/137882823/c47b0b01-bc4f-405c-b992-d745c1af9151" width="700px" height="500px"/>

**공지사항 상세 화면**

Files의 파일명을 클릭하면 파일 다운로드가 가능합니다. <br>
공지사항 글 수정, 삭제가 가능합니다.

