const frm = document.getElementById("frm");
const animalName = document.getElementsByClassName("animalName");
const age = document.getElementsByClassName("age");
const weight = document.getElementsByClassName("weight");
const nameI = document.getElementsByClassName("name");
const phone = document.getElementsByClassName("phone");
const addressSearch = document.getElementById("addressSearch");
const input = document.getElementsByClassName("input");

const anMsg = document.getElementById("anMsg");
const ageMsg = document.getElementById("ageMsg");
const wMsg = document.getElementById("wMsg");
const nMsg = document.getElementById("nMsg");
const pMsg = document.getElementById("pMsg");
const aMsg = document.getElementById("aMsg");

const addBtn = document.getElementById("addBtn");

let phoneCheck = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

let checks = [false, false, false, false, false, false];


//주소찾기버튼 클릭했을때
addressSearch.addEventListener("click", function () {
    new daum.Postcode({
      oncomplete: function (data) {
        var addr = "";
        var extraAddr = "";
  
        if (data.userSelectedType === "R") {
          addr = data.roadAddress;
        } else {
          addr = data.jibunAddress;
        }
        if (data.userSelectedType === "R") {
            if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                extraAddr += data.bname;
            }
            if (data.buildingName !== "" && data.apartment === "Y") {
                extraAddr +=
                    extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
            }
            if (extraAddr !== "") {
                extraAddr = " (" + extraAddr + ")";
            }
          document.getElementById("address").value = extraAddr;
        } else {
          document.getElementById("address").value = "";
        }
        document.getElementById("postcode").value = data.zonecode;
        document.getElementById("address").value = addr;
        document.getElementById("detailAddress").value = "";
        document.getElementById("detailAddress").focus();
      },
    }).open();
});
  
//=======================================//

for(an of animalName){
  an.addEventListener("blur", function () {
      anMsg.innerHTML = '';
      if (an.value == '') {
          anMsg.innerHTML = "이름을 입력해주세요";
      } else {
          checks[0] = true;
      }
  });
}

for(ag of age){
  ag.addEventListener("blur", function () {
      ageMsg.innerHTML = '';
      if (ag.value == '') {
          ageMsg.innerHTML = "나이를 입력해주세요";
      } else {
          checks[1] = true;
      }
  });
}

for(w of weight){
  w.addEventListener("blur", function () {
      wMsg.innerHTML = '';
      if (w.value == '') {
          wMsg.innerHTML = "몸무게를 입력해주세요";
      } else {
          checks[2] = true;
      }
  });
}


for(n of nameI){
  n.addEventListener("blur", function () {
      nMsg.innerHTML = '';
      if (n.value == '') {
          nMsg.innerHTML = "보호자이름을 입력해주세요";
      } else {
          checks[3] = true;
      }
  });
}

for(p of phone){
  p.addEventListener("blur",function(){
      pMsg.innerHTML = '';
      if(p.value == ''){
          pMsg.innerHTML="전화번호를 입력해주세요.";
      }else if(!phoneCheck.test(p.value)){
          pMsg.innerHTML="010으로 시작하는 8자리를 입력해주세요.";
      }else{
          checks[4]=true;
      }
  });
}

for(addressInput of address){
  addressInput.addEventListener("blur", function () {
      aMsg.innerHTML = '';
      if (addressInput.value == '') {
          aMsg.innerHTML = "주소를 입력하세요.";
      }
  })
}

function emptyCheck(element) {
  if (element.value == null || element.value.length == 0) {
      return true;
  } else {
      return false;
  }
}

$("#addBtn").click(function () {
  let allCheck = checks.includes(false);
  if (!allCheck) {
      alert("정상적으로 등록되었습니다!")
      frm.submit();
  } else {
      for (let i = 0; i < checks.length; i++) {
          if (checks[i] == false) {
              input[i].focus();
              alert("모든 항목은 필수작성입니다. 빈칸을 채워주세요!")
              return;
          }
      }
  }
})
