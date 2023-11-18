



const fdeletes = document.getElementsByClassName("fdeletes");

let fileMax = 4;
let fileCount = 0;

if(fdeletes != null) {
    fileCount = fdeletes.length;
}
let num = 0;


// del 버튼 클릭하면 삭제하겠다
for(fdel of fdeletes){
    del.addEventListener("click", function(){
        let fileNo = this.getAttribute("data-delete-fileNo");
        let check = confirm("정말로 삭제하시겠습니까?");

        if(check){
        console.log("1");
            fetch("./fileDelete?fileNo=" + fileNo, {method:"get"})
                .then((result)=>{return result.text()}) // result.text를 반환받겠다
                .then((r)=>{
                    //  console.log("삭제 결과", r) 
                    if(r.trim()=='1'){
                        $(this).parent().remove();
                        // this.remove();
                        fileCount--;
                    }
                })
        }
    })
}



// filePlus에 파일첨부 추가하기
$("#filePlus").click(function(){

    if(fileCount>=fileMax){
        alert("최대 5개까지 추가할 수 있습니다.");
        return;
    }
    fileCount++;    


  	let f = '<div class="input-group mb-3" id="file'+num+'">';
    
    f = f + '<input type="file" name="files" class="form-control" id="inputFile">';
    f = f + '<button type="button" class="btn btn-primary fdel"> X </button>';
    f = f + '</div>';
    num++;

    $("#fileList").append(f);

})

// add에 파일첨부 메뉴 추가한거 지우기
$("#fileList").on("click", ".fdel", function(){
    $(this).parent().remove();
    fileCount--;
})

