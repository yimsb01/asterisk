<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/assets/demo/demo.css" rel="stylesheet" />
<link href="/css/mypage/detail.css" rel="stylesheet" />

<style>
.remove-subject-button,
.subjectAddButton,
.remove-childId-button,
.childAddButton,
.photo-delete-button-div,
.photo-add-button {
  display: none !important;
}
</style>

<div class="page-header header-filter" data-parallax="true" style="background-image: url('/assets/img/bg3.jpg')">
  <div class="container">
    <div class="row">
      <div class="col-md-8 ml-auto mr-auto">
        <div class="brand text-center">
          <h1>관리자 페이지</h1>
          <h3 class="title text-center">회원 상세페이지</h3>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="main main-raised profile-page">
  <div class="container">
    <div class="row-fluid">
      <div class="col">
        <form id="mypage-form" action="update" method="POST" enctype="multipart/form-data">

          <div class="row">
            <div class="col-md-6 ml-auto mr-auto">
              <div class="profile">
                <div class="avatar">
                  <img src="/upload/join/${thisMember.profilePhoto}" alt="Circle Image"
                    class="img-raised rounded-circle img-fluid profile-photo">
                  <input id="profile-photo-upload" type="file" name="profilePhotoName" hidden>
                </div>
                <div class="name">
                  <h3 class="title mb-2">${thisMember.name}</h3>
                  <h6>
                    <i class="far fa-square student-ID-unchecked"></i><i
                      class="far fa-check-square student-ID-checked"></i>
                    <span class="student-ID-span">
                      학생증 인증&nbsp;&nbsp;&nbsp;
                    </span>
                    <i class="far fa-square tutor-certi-unchecked"></i><i
                      class="far fa-check-square tutor-certi-checked"></i>
                    <span class="tutor-certi-span">
                      신고서 인증
                    </span>
                  </h6>
                  <h6></h6>
                </div>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label for="inputId">아이디</label>
            <input type="text" class="form-control" id="inputId" value="${thisMember.id}" readonly>
          </div>

          <div class="form-group">
            <label for="inputPassword">비밀번호</label>
            <input type="password" class="form-control" id="inputPassword" name="password" readonly>
          </div>

          <div class="form-group">
            <label for="inputPasswordCheck">비밀번호확인</label>
            <input type="password" class="form-control" id="inputPasswordCheck" readonly>
          </div>

          <div class="form-group">
            <label for="inputEmail">이메일</label>
            <div class="row">
              <div class="col">
                <input type="text" class="form-control" id="inputEmail" value="${memberEmail[0]}" name="email1" readonly>
              </div>
              <div class="col">
                <div class="input-group">
                  <div class="input-group-prepend">
                    <div class="input-group-text">@</div>
                  </div>
                  <input type="text" class="form-control" id="inputEmail2" value="${memberEmail[1]}" name="email2" readonly>
                </div>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label for="inputDateOfBirth">생년월일</label>
            <input type="date" class="form-control" id="inputDateOfBirth" value="${thisMember.dateOfBirth}" readonly>
          </div>

          <label for="addressSearchButton">주소</label>
          <div class="form-group row pt-1 mb-0">
            <div class="col">
              <div class="d-flex">
                <div class="flex-item" style="flex-basis: 100%">
                  <input type="text" id="inputAddress" class="form-control" readonly value="${thisMember.addressCity}"
                    name="addressCity">
                </div>
                <div class="flex-item" style="flex-basis: 7%; display: none;">
                  <button class="btn btn-sm btn-outline-primary" type="button" id="addressSearchButton">주소검색</button>
                </div>
              </div>
            </div>
          </div>

          <div class="form-group pt-1">
            <label for="inputAddress2" id="address2-label" class="col-sm-2 col-form-label"></label>
            <input type="text" class="form-control" id="inputAddress2" value="${thisMember.addressSuburb}" readonly
              name="addressSuburb">
          </div>

          <div class="form-group">
            <label for="inputTel">전화번호</label>
            <input type="text" class="form-control" id="inputTel" value="${thisMember.tel}" name="tel" readonly>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputBankName">은행명</label>
            <select class="form-control selectpicker" data-style="btn btn-link" id="inputBankName" name="bankName" readonly>
              <option selected>은행선택</option>
              <option value="KB">국민은행</option>
              <option value="Woori">우리은행</option>
              <option value="Shinhan">신한은행</option>
              <option value="kakao">카카오뱅크</option>
            </select>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputAccountNo">계좌번호</label>
            <input type="text" class="form-control" id="inputAccountNo" value="${memberInfoMapForDetail.teacher.accountNo}"
              name="accountNo" readonly>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputHighSchool">고등학교</label>
            <c:forEach items="${memberInfoMapForDetail.teacher.schools}" var="school">
              <c:if test="${school.schoolTypeNo eq 3}">
                <input type="text" class="form-control" id="inputHighSchool" value="${school.schoolName}" readonly>
              </c:if>
            </c:forEach>
          </div>
          <div class="form-group teacherDisplay">
            <label for="inputUniversity">대학교</label>
            <c:forEach items="${memberInfoMapForDetail.teacher.schools}" var="school">
              <c:if test="${school.schoolTypeNo eq 4}">
                <c:set var="teacherUniversityConfirmation" value="${school.confirmed}" />
                <input type="text" class="form-control" id="inputUniversity" value="${school.schoolName}" readonly>
              </c:if>
            </c:forEach>
          </div>

          <div class="form-group row teacherDisplay">
            <div class="col">
              <label for="inputPhotos" class="mb-3">사진 업로드</label>
              <div class="d-flex photo-add-div">
                <div id="my-image-wrapper" class="col image-wrapper text-center">

                </div>
              </div>
              <div class="d-flex photo-add-button btn btn-outline-primary mx-0 my-0 px-0 py-0"
                style="border-top-left-radius: 0; border-top-right-radius: 0; border-top-width: 0px;">
                <button type="button" class="btn btn-outline-primary mx-0 my-0"
                  style="flex-basis: 100%; box-shadow: none; border: 0;">
                  사진 등록
                </button>
              </div>
            </div>
          </div>


          <div class="form-group row wantedSubjects subjectTemplate">
            <div class="col-sm-2 mt-1 mb-0 form-group">
              <label for="inputSubject" class="wantedSubjectLabel col-form-label">희망과목</label>&nbsp;&nbsp;
              <button type="button"
                class="btn btn-outline-primary btn-sm px-3 mb-1 remove-subject-button"><strong>&minus;</strong></button>
            </div>
            <div class="col-sm-10 d-flex">
              <select class="form-control pt-0 mx-1 wantedSubject-school" name="schoolTypeNo" readonly>
                <option value=1>초등학교</option>
                <option value=2>중학교</option>
                <option value=3>고등학교</option>
              </select>
              <select class="form-control pt-0 mx-1 wantedSubject-subject" name="subjectNo" readonly>
                <option value=1>국어</option>
                <option value=2>영어</option>
                <option value=3>수학</option>
                <option value=4>과학</option>
                <option value=5>사회</option>
              </select>
              <select class="form-control pt-0 ml-1 wantedSubject-fee" name="wantedFee" readonly>
                <option value=1>20만원이하</option>
                <option value=2>20만원~30만원</option>
                <option value=3>30만원~40만원</option>
                <option value=4>40만원이상</option>
              </select>
            </div>
          </div>
          <div class="subjectAddButtonDiv mb-3 teacherDisplay studentDisplay">
            <button type="button" class="btn btn-outline-primary subjectAddButton">추가</button>
          </div>

          <div class="form-group teacherDisplay studentDisplay">
            <label for="inputSubjectDay">과외가능 요일</label>
            <div class="subjectCheckboxDiv">
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_1" name="lessonDay" value="0" readonly> 일
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_2" name="lessonDay" value="1" readonly> 월
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_3" name="lessonDay" value="2" readonly> 화
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_4" name="lessonDay" value="3" readonly> 수
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_5" name="lessonDay" value="4" readonly> 목
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_6" name="lessonDay" value="5" readonly> 금
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
              <div class="form-check form-check-inline">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" id="OPTI_7" name="lessonDay" value="6" readonly> 토
                  <span class="form-check-sign">
                    <span class="check"></span>
                  </span>
                </label>
              </div>
            </div>
          </div>

          <div class="form-group teacherDisplay studentDisplay">
            <label for="subject-start-time">과외 시작시간</label><br>
            <input type='time' value='${thisMember.lessonStartTime}' id="subject-start-time" class="form-control"
              name="lessonStartTime" readonly />
          </div>

          <div class="form-group teacherDisplay studentDisplay">
            <label for="subject-end-time">과외 종료시간</label><br>
            <input type='time' value='${thisMember.lessonEndTime}' id="subject-end-time" class="form-control"
              name="lessonEndTime" readonly />
          </div>

          <div class="form-group studentDisplay">
            <label for="inputRequirements">과외 희망사항</label>
            <textarea class="form-control" id="inputRequirements" rows="8"
              name="requirementsToTeacher" readonly>${memberInfoMapForDetail.student.requirementsToTeacher}</textarea>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputIntro">자기소개</label>
            <textarea class="form-control" id="inputIntro" rows="8"
              name="teacherIntro" readonly>${memberInfoMapForDetail.teacher.teacherIntro}</textarea>
          </div>

          <div class="form-group teacherDisplay">
            <label for="inputIntroVideo">자기소개 동영상 주소</label>
            <input type="text" class="form-control" id="inputIntroVideo" value="${memberInfoMapForDetail.teacher.videoAddress}"
              name="videoAddress" readonly>
          </div>

          <div class="form-group row childId mb-2 pt-1 childIdTemplate">
            <div class="col-sm-2 mb-0 form-group">
              <label for="inputChildId" class="childIdLabel">자녀ID</label>&nbsp;&nbsp;
              <button type="button"
                class="btn btn-outline-primary btn-sm px-3 mb-1 remove-childId-button"><strong>&minus;</strong></button>
            </div>
            <div class="col-sm-10 mt-1 d-flex">
              <div class="flex-item pr-1" style="flex-basis: 100%;">
                <input type="text" class="form-control" readonly value="hong111" name="childrenId" readonly>
              </div>
              <div class="flex-item" style="flex-basis: 7%; display: none;">
                <input type="hidden" value="4">
                <button class="btn btn-sm btn-outline-primary childLessonButton" type="button">과외현황</button>
              </div>
            </div>
          </div>

          <div class="childAddButtonDiv mb-3 parentsDisplay">
            <button type="button" class="btn btn-outline-primary childAddButton">추가</button>
          </div>


          <div class="form-check kakaotalkDiv parentsDisplay">
            <label class="form-check-label">
              <input id="kakaotalkCheckbox" class="form-check-input" type="checkbox" name="kakaoCheck" readonly>
              과외 내용을 카톡으로 수신
              <span class="form-check-sign">
                <span class="check"></span>
              </span>
            </label>
          </div>

          <div class="modification-button-div pt-2 pb-2">
            <button class="btn btn-primary">수정</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- 프로필 사진 클릭 시 파일업로드 및 선택한 사진으로 변경 -->
<script src="/js/mypage/profile-photo.js"></script>

<!-- 학부모 자녀아이디의 값을 가져와 스크립트용 리스트에 넣는 부분 -->
<script>
    if ('${thisMember.memberTypeNo}' == 2) {
      var myParentsChildrenId = new Array();
      var myPatentsChildrenNo = new Array();
    }
  </script>
  <c:forEach items="${memberInfoMapForDetail.parents.students}" var="student">
    <script>
      if ('${thisMember.memberTypeNo}' == 2) {
        myParentsChildrenId.push('${student.id}');
        myPatentsChildrenNo.push(${student.studentNo});
      }
    </script>
  </c:forEach>
  
  <script src="/js/admin/admin-detail-init.js"></script>
  <script>
    let memberTypeNo = Number('${thisMember.memberTypeNo}');
    let teacherUniversityConfirmation = '${teacherUniversityConfirmation}';
    let teacherApprovementState = '${memberInfoMapForDetail.teacher.approvementState}';
  
    let mypageInit = new MypageInit(memberTypeNo);
    if (memberTypeNo == 3) {
      mypageInit.checkTeacherApprovement(teacherUniversityConfirmation, teacherApprovementState);
    }
  
    mypageInit.displayMemberInfo();
  
    if (memberTypeNo == 2) {
      mypageInit.setEventToRemoveChildIdButton();
      mypageInit.addEventToChildIdButton();
      mypageInit.addParentsChildrenNodes();
  
      let kakaotalk = '${memberInfoMapForDetail.parents.kakaotalk}';
      // 카톡 수신여부 체크박스 로딩
      if (kakaotalk == 'true') {
        $("input:checkbox[id='kakaotalkCheckbox']").prop("checked", true);
      }
    }
  
    // 수업 요일 체크박스 로딩
    let day = '${thisMember.lessonDays}';
    let array = day.split("");
    for (var i = 0; i < array.length; i++) {
      if (array[i] == 1) {
        $("input:checkbox[id='OPTI_" + (i + 1) + "']").prop("checked", true);
      }
    }
  </script>
  
  
  
  
  <!-- 선생님 사진들 로딩해서 출력-->
  <script>
    let teacherPhotos = new Array();
  
  </script>
  <c:forEach items="${memberInfoMapForDetail.teacherPhotos}" var="photo">
    <script>
      if ('${thisMember.memberTypeNo}' == 3) {
        teacherPhotos.push('${photo.teacherPhoto}');
      }
    </script>
  </c:forEach>
  
  <script src="/js/mypage/teacher-photo-controller.js"></script>
  <script>
    let teacherPhotoController = new TeacherPhotoController(teacherPhotos);
    teacherPhotoController.loadInitialTeacherPhotos();
    if (teacherPhotoController.teacherPhotoCount == 0)
      document.getElementById('my-image-wrapper').style.height = '343px';
  
  </script>
  
  
  
  
  
  
  <!-- 희망과목 제거 버튼 초기 세팅-->
  <script>
    let removeSubjectButton = document.getElementsByClassName('remove-subject-button')[0];
  
    // 희망과목을 0개 이하로 지울 수 없게 방지하는 카운트 설정
    let subjectCount = 0;
  
    let addRemoveEventTo = function (thisBtn) {
      thisBtn.addEventListener('click', (event) => {
        if (subjectCount == 1)
          return;
  
        let thisSubjectNode = thisBtn.parentNode.parentNode;
        thisSubjectNode.parentNode.removeChild(thisSubjectNode);
  
        subjectCount--;
      });
    }
  
    // 희망과목 삭제 버튼에 이벤트 등록
    addRemoveEventTo(removeSubjectButton);
  
  </script>
  
  <!-- 희망과목 추가 버튼 -->
  <script>
    let subjectAddButton = document.getElementsByClassName('subjectAddButton')[0];
  
    let addSubjectNode = function () {
      // 페이지 로딩 시에 기존에 만들어둔 원본 wantedSubjects를 복사하여 템플릿으로 보관
      let wantedSubjects = document.getElementsByClassName('wantedSubjects');
      let wantedSubjectTemplate = wantedSubjects[0].cloneNode(true);
  
      // 원본 wantedSubjects div에서 subjectTemplate를 제거하여 템플릿은 정상적으로 화면에 보이게 설정
      wantedSubjectTemplate.setAttribute('class', 'form-group row wantedSubjects');
  
      // 희망과목의 부모 노드 중에서 가장 마지막 자식의 앞에 준비해둔 wantedSubjectTemplate를 insert
      wantedSubjects[0].parentNode.insertBefore(wantedSubjectTemplate, wantedSubjects[wantedSubjects.length - 1].nextSibling);
      subjectCount++;
  
      // 새로 생긴 과목의 제거 버튼에 추가로 이벤트 리스너를 등록
      addRemoveEventTo(wantedSubjectTemplate.childNodes[1].childNodes[3]);
  
      // 새로 과목을 추가한 후 나중에 값을 세팅할 것을 대비해 이 템플릿을 리턴
      return wantedSubjectTemplate;
    }
  
    subjectAddButton.addEventListener('click', () => {
      addSubjectNode();
    });
  
  </script>
  
  <!-- 선생님 희망과목의 값을 가져와 스크립트용 리스트에 넣는 부분 -->
  <script>
    if ('${thisMember.memberTypeNo}' == 3) {
      var myTeacherLessonSchools = new Array();
      var myTeacherLessonSubjects = new Array();
      var myTeacherLessonFees = new Array();
    }
  </script>
  <c:forEach items="${memberInfoMapForDetail.lessonSubjects}" var="lessonSubject">
    <script>
      if ('${thisMember.memberTypeNo}' == 3) {
        myTeacherLessonSchools.push('${lessonSubject.subjects[0].schoolTypeNo}');
        myTeacherLessonSubjects.push('${lessonSubject.subjectNo}');
        myTeacherLessonFees.push('${lessonSubject.wantedFee}');
      }
    </script>
  </c:forEach>
  
  <!-- 선생님 희망과목에 초기값 세팅 -->
  <script>
    if ('${thisMember.memberTypeNo}' == 3) {
      for (let i = 0; i < myTeacherLessonSubjects.length; i++) {
        let addedSubjectObject = addSubjectNode();
        let options = addedSubjectObject.childNodes[3].childNodes;
  
        let selSchool = options[1];
        let selSubject = options[3];
        let selFee = options[5];
  
        selSchool.selectedIndex = myTeacherLessonSchools[i] - 1;
        selSubject.selectedIndex = (myTeacherLessonSubjects[i] % 3 == 0 ? 3 : myTeacherLessonSubjects[i] % 3) - 1;
        selFee.selectedIndex = myTeacherLessonFees[i] - 1;
      }
    }
  </script>
  
  <!-- 학생 희망과목의 값을 가져와 스크립트용 리스트에 넣는 부분 -->
  <script>
    if ('${thisMember.memberTypeNo}' == 1) {
      var myStudentLessonSchools = new Array();
      var myStudentLessonSubjects = new Array();
      var myStudentLessonFees = new Array();
    }
  </script>
  <c:forEach items="${memberInfoMapForDetail.wantedLessons}" var="wantedLesson">
    <script>
      if ('${thisMember.memberTypeNo}' == 1) {
        myStudentLessonSchools.push('${wantedLesson.subjects[0].schoolTypeNo}');
        myStudentLessonSubjects.push('${wantedLesson.subjectNo}');
        myStudentLessonFees.push('${wantedLesson.wantedFee}');
      }
    </script>
  </c:forEach>
  
  <!-- 학생 희망과목에 초기값 세팅 -->
  <script>
    if ('${thisMember.memberTypeNo}' == 1) {
      //fn:은 jstl의 라이브러리 이므로 import 하는 것 잊지 말것
      for (let i = 0; i < myStudentLessonSubjects.length; i++) {
        let addedSubjectObject = addSubjectNode();
        let options = addedSubjectObject.childNodes[3].childNodes;
  
        let selSchool = options[1];
        let selSubject = options[3];
        let selFee = options[5];
  
        selSchool.selectedIndex = myStudentLessonSchools[i] - 1;
        selSubject.selectedIndex = (myStudentLessonSubjects[i] % 3 == 0 ? 3 : myStudentLessonSubjects[i] % 3) - 1;
        selFee.selectedIndex = myStudentLessonFees[i] - 1;
      }
    }
  </script>