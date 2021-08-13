<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> <%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources" scope="application" />
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="../include/static.jsp"%>
    <title>이루리 PT클래스 - 메인</title>
  </head>
  <body>
    <div class="iruri__wrapper">
      <%@ include file="../include/headerTemplate.jsp"%>

      <main>
        <div class="ptClassWrap">
          <h3 class="ptClassTitle">PT 클래스</h3>

          <div class="ptClassSuggest">
            <span class="suggestTitle">추천클래스</span>

            <div class="suggestWrap">
              <c:forEach var="recommend" items="${recommendList}">
                <div class="suggestImg" style="background: url(${CONTEXT_PATH}/iruri/display?fileName=${recommend.classImage}) no-repeat">
                  <div class="suggestPtPerson">1 : ${recommend.classTotalMember}</div>
                  <div class="suggestMetaData">
                    <span>트레이너 ${recommend.IUserVO.userNickname}</span>
                    <h5><a href="">${recommend.classTitle}</a></h5>
                    <div class="suggestData">
                      <span>${recommend.classStartDate} ~ ${recommend.classEndDate}</span>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>

          <ul class="ptClassNav">
            <li>
              <a href="#" id="all" onclick="ajaxClassList(1, this)"> 전체 클래스 </a>
            </li>
            <li>
              <a href="#" id="buy" onclick="ajaxClassList(1, this)"> 구매한 클래스 </a>
            </li>
            <li>
              <a href="#" id="interest" onclick="ajaxClassList(1, this)"> 관심 클래스 </a>
            </li>
            <li>
              <a href="#" id="past" onclick="ajaxClassList(1, this)"> 지난 클래스 </a>
            </li>
          </ul>

          <script>
            const ptClassNavList = document.querySelectorAll(".ptClassNav a");
            ptClassNavList.forEach(item => {
              item.addEventListener("click", function (e) {
                e.preventDefault();

                ptClassNavList.forEach(item => {
                  item.style.color = "#999";
                });

                item.style.color = "#185abd";
              });
            });
          </script>

          <div class="ptClassFilter">
            <div>
              <span class="ptClassFilter-label">강사성별</span>

              <div class="ptClassFilter-inputWrap">
                <input type="checkbox" name="gender" value="남성" id="g1" />
                <label for="g1">
                  <i class="iruri-check-no-icon"></i>
                  <span>남성</span>
                </label>
                <input type="checkbox" name="gender" value="여성" id="g2" />
                <label for="g2">
                  <i class="iruri-check-no-icon"></i>
                  <span>여성</span>
                </label>
              </div>
            </div>

            <div>
              <span class="ptClassFilter-label">운동종류</span>

              <div class="ptClassFilter-inputWrap">
                <input type="checkbox" name="exerciseKind" value="헬스" id="ek1" />
                <label for="ek1">
                  <i class="iruri-check-no-icon"></i>
                  <span>헬스</span>
                </label>
                <input type="checkbox" name="exerciseKind" value="필라테스" id="ek2" />
                <label for="ek2">
                  <i class="iruri-check-no-icon"></i>
                  <span>필라테스</span>
                </label>
                <input type="checkbox" name="exerciseKind" value="요가" id="ek3" />
                <label for="ek3">
                  <i class="iruri-check-no-icon"></i>
                  <span>요가</span>
                </label>
                <input type="checkbox" name="exerciseKind" value="바디프로필" id="ek4" />
                <label for="ek4">
                  <i class="iruri-check-no-icon"></i>
                  <span>바디프로필</span>
                </label>
                <input type="checkbox" name="exerciseKind" value="댄스" id="ek5" />
                <label for="ek5">
                  <i class="iruri-check-no-icon"></i>
                  <span>댄스</span>
                </label>
              </div>
            </div>

            <div>
              <span class="ptClassFilter-label">가격대</span>

              <div class="ptClassFilter-inputWrap">
                <input type="radio" name="pay" value="10" id="p1" />
                <label for="p1">
                  <i class="iruri-check-no-icon"></i>
                  <span>10만원 이하</span></label
                >
                <input type="radio" name="pay" value="20" id="p2" />
                <label for="p2">
                  <i class="iruri-check-no-icon"></i>
                  <span>20만원 이하</span>
                </label>
                <input type="radio" name="pay" value="30" id="p3" />
                <label for="p3">
                  <i class="iruri-check-no-icon"></i>
                  <span>30만원 이하</span>
                </label>
                <input type="radio" name="pay" value="31" id="p4" />
                <label for="p4">
                  <i class="iruri-check-no-icon"></i>
                  <span>30만원 이상</span>
                </label>
              </div>
            </div>

            <div>
              <span class="ptClassFilter-label">운동기간</span>

              <div class="ptClassFilter-inputWrap">
                <input type="radio" name="exerciseDate" value="1" id="ed1" />
                <label for="ed1">
                  <i class="iruri-check-no-icon"></i>
                  <span>1개월</span>
                </label>
                <input type="radio" name="exerciseDate" value="2" id="ed2" />
                <label for="ed2">
                  <i class="iruri-check-no-icon"></i>
                  <span>2개월</span>
                </label>
                <input type="radio" name="exerciseDate" value="3" id="ed3" />
                <label for="ed3">
                  <i class="iruri-check-no-icon"></i>
                  <span>3개월</span>
                </label>
                <input type="radio" name="exerciseDate" value="4" id="ed4" />
                <label for="ed4">
                  <i class="iruri-check-no-icon"></i>
                  <span>3개월 이상</span>
                </label>
              </div>
            </div>

            <div>
              <span class="ptClassFilter-label">운동요일</span>

              <div class="ptClassFilter-inputWrap">
                <input type="checkbox" name="exerciseDay" value="월" id="day1" />
                <label for="day1">
                  <i class="iruri-check-no-icon"></i>
                  <span>월</span>
                </label>
                <input type="checkbox" name="exerciseDay" value="화" id="day2" />
                <label for="day2">
                  <i class="iruri-check-no-icon"></i>
                  <span>화</span>
                </label>
                <input type="checkbox" name="exerciseDay" value="수" id="day3" />
                <label for="day3">
                  <i class="iruri-check-no-icon"></i>
                  <span>수</span>
                </label>
                <input type="checkbox" name="exerciseDay" value="목" id="day4" />
                <label for="day4">
                  <i class="iruri-check-no-icon"></i>
                  <span>목</span>
                </label>
                <input type="checkbox" name="exerciseDay" value="금" id="day5" />
                <label for="day5">
                  <i class="iruri-check-no-icon"></i>
                  <span>금</span>
                </label>
                <input type="checkbox" name="exerciseDay" value="토" id="day6" />
                <label for="day6">
                  <i class="iruri-check-no-icon"></i>
                  <span>토</span>
                </label>
                <input type="checkbox" name="exerciseDay" value="일" id="day7" />
                <label for="day7">
                  <i class="iruri-check-no-icon"></i>
                  <span>일</span>
                </label>
              </div>
            </div>

            <div>
              <span class="ptClassFilter-label">운동강도</span>

              <div class="ptClassFilter-inputWrap">
                <input type="checkbox" name="exerciseLevel" value="easy" id="el1" />
                <label for="el1">
                  <i class="iruri-check-no-icon"></i>
                  <span>easy</span>
                </label>
                <input type="checkbox" name="exerciseLevel" value="normal" id="el2" />
                <label for="el2">
                  <i class="iruri-check-no-icon"></i>
                  <span>normal</span>
                </label>
                <input type="checkbox" name="exerciseLevel" value="hard" id="el3" />
                <label for="el3">
                  <i class="iruri-check-no-icon"></i>
                  <span>hard</span>
                </label>
              </div>
            </div>

            <div>
              <span class="ptClassFilter-label">운동인원</span>

              <div class="ptClassFilter-inputWrap">
                <input type="checkbox" id="ep1" />
                <label for="ep1">
                  <i class="iruri-check-no-icon"></i>
                  <span>1 : 1</span>
                </label>
                <input type="checkbox" id="ep2" />
                <label for="ep2">
                  <i class="iruri-check-no-icon"></i>
                  <span>1 : 2</span>
                </label>
                <input type="checkbox" id="ep3" />
                <label for="ep3">
                  <i class="iruri-check-no-icon"></i>
                  <span>1 : 4</span>
                </label>
                <input type="checkbox" id="ep4" />
                <label for="ep4">
                  <i class="iruri-check-no-icon"></i>
                  <span>1 : 6</span>
                </label>
              </div>
            </div>
          </div>

          <!-- 나래님이 만드신 필터랑 챌린지 개설 버튼 -->
          <div class="ptClassSelect" id="select_wrap">
            <div id="select" class="select ptSelect">
              <div>
                <span>인기순</span>
                <i class="iruri-selectBox-arrow-icon"></i>
              </div>
              <ul id="ul" class="select_ul">
                <li data-value="value 1">인기순</li>
                <li data-value="value 2">시작일순</li>
                <li data-value="value 3">평점순</li>
              </ul>
            </div>

            <sec:authorize access="hasRole('TRAINER')">
              <button class="c_make_button">챌린지개설</button>
            </sec:authorize>
          </div>

          <!-- 클래스 리스트 -->
          <div class="ptClassList"></div>

          <div class="page_nation"></div>
        </div>
      </main>

      <%@ include file="../include/footerTemplate.jsp"%>
    </div>

    <script>
      function ajaxClassList(page, type) {
        $.ajax({
          url: "${CONTEXT_PATH}/ajax/class",
          type: "GET",
          cache: false,
          dataType: "json",
          data: {
            pageNum: page,
            type: type.id,
          },
          success: function (result) {
            const list = result["list"];
            const pagination = result["pageMaker"];
            let listHtmls = "";
            let pagingHtmls = "";

            const ptClassList = document.querySelector(".ptClassList");
            if (list.length < 1) {
              ptClassList.style.display = "flex";
              ptClassList.style.justifyContent = "center";
              ptClassList.style.alignItems = "center";
              ptClassList.style.color = "rgb(24, 90, 189)";
              listHtmls = "<p>해당하는 챌린지가 없습니다</p>";
            } else {
              ptClassList.removeAttribute("style");
              $(list).each(function () {
                listHtmls +=
                  //
                  `<div class="c_list_detail">
                            <div class="c_list_img">
                              <div class="ptListPerson">1:${"${this.classTotalMember}"}</div>
                              <img src="${CONTEXT_PATH}/iruri/display?fileName=${"${this.classImage}"}" />
                            </div>

                            <div class="ptListSubTitle">트레이너 ${"${this.iuserVO.userNickname}"}</div>
                            <div class="c_list_title ptListTitle"><a href="">${"${this.classTitle}"}</a></div>

                            <div class="c_list_date">${"${this.classStartDate}"} ~ ${"${this.classEndDate}"}</div>

                            <div class="data__tags">

                              <div class="data__tag-blue">
                                <i class="iruri-level-icon"></i>
                                <span>${"${this.classLevel}"}</span>
                                </div>

                                <div class="data__tag-blue">
                                  <i class="iruri-time-icon"></i>`;

                let dateStr = "";
                for (let date in this.exerciseDateList) {
                  dateStr += this.exerciseDateList[date].exerciseDate;
                }

                listHtmls += `<span>${"${dateStr}"}/${"${this.classTime}분"}</span>`;

                listHtmls +=
                  //
                  `</div>
                            </div>
                            <div class="data__tags">`;

                for (let kind in this.exerciseKindList) {
                  listHtmls += `<div class="data__tag-red">${"${this.exerciseKindList[kind].exerciseKind}"}</div>`;
                }

                listHtmls +=
                  //
                  `</div>

                            <div class="ptListBuyData">
                              <div class="ptListPrice">\ ${"${this.classPrice}"}</div>
                              <i class="iruri-heart-gray-icon" data-classId="${"${this.classId}"}"></i>`;
                listHtmls += `</div>
                          </div>`;
              });

              if (pagination["prev"]) {
                pagingHtmls += '<a class="arrow prev" href="javascript:ajaxClassList(' + (pagination["startPage"] - 1) + "," + type + ')"></a>';
              }

              for (var idx = pagination["startPage"]; idx <= pagination["endPage"]; idx++) {
                if (page !== idx) {
                  pagingHtmls += '<a class="pageNumLink" href="javascript:ajaxClassList(' + idx + "," + type.id + ')">' + idx + "</a>";
                } else {
                  pagingHtmls += '<a class="pageNumLink active" href="javascript:ajaxClassList(' + idx + "," + type + ')">' + idx + "</a>";
                }
              }

              if (pagination["next"]) {
                pagingHtmls += '<a class="arrow next" href="javascript:ajaxClassList(' + (pagination["endPage"] + 1) + "," + type.id + ')"></a>';
              }
            }

            $(".ptClassList").html(listHtmls);
            $(".page_nation").html(pagingHtmls);

            if (type.id !== "past") {
              const hearts = document.querySelectorAll(".ptListBuyData i");
              hearts.forEach(heart => {
                heart.style.cursor = "pointer";
                const classId = heart.dataset.classid;

                heart.addEventListener("click", e => {
                  const likeCheckNum = heart.className === "iruri-heart-red-icon" ? 1 : 0;

                  $.ajax({
                    url: "${CONTEXT_PATH}/ajax/ptClassLike",
                    type: "GET",
                    cache: false,
                    dataType: "json",
                    data: {
                      classId: classId,
                      checkNum: likeCheckNum,
                    },
                    success: function (result) {
                      if (result === 0) {
                        heart.className = "iruri-heart-gray-icon";
                      } else {
                        heart.className = "iruri-heart-red-icon";
                      }
                    },
                  }).then(() => {
                    const currentPage = parseInt(document.querySelector(".pageNumLink.active").innerText);
                    ajaxClassList(currentPage, type);
                  });
                });
              });
            }
          },
        }) //
          .then(result => {
            const hearts = document.querySelectorAll(".ptListBuyData i");
            hearts.forEach(heart => {
              const classId = heart.dataset.classid;

              $.ajax({
                url: "${CONTEXT_PATH}/ajax/ptClassLike",
                type: "GET",
                cache: false,
                dataType: "json",
                data: {
                  classId: classId,
                  checkNum: -1,
                },
                success: function (result) {
                  if (result === 1) {
                    heart.className = "iruri-heart-red-icon";
                  }
                },
              });
            });
          });
      }

      $(document).ready(() => {
        const all = document.querySelector("#all");
        ajaxClassList(1, all);
      });

      $(document).ready(() => {
        const filter = document.querySelector(".ptClassFilter");
        const filterInput = filter.querySelectorAll("input");
        const filterLabel = filter.querySelectorAll("label");
        console.log(filter, filterInput, filterLabel);

        // 라벨을 클릭했을때 해당 인풋의 checked 속성 제어하고 해당 인풋의 라벨 아이콘 바꾸기
        // 그리고 해당 인풋의 checked 속성의 값을 ajax 통신함
        filterInput.forEach(input => {
          console.log(input);
        });
      });
    </script>
  </body>
</html>
