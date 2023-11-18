
	$("#customerSearch").on("click", function(){
		var animalName=$("#animalName").val();				
							
				$.ajax({
					url:"/hospitalize/customerList",
					data:{
						animalName:animalName
					},
					method: "POST",
					success : function(data){
							if(data.length==0){
										$("#animalName").val("");
										alert("일치하는 고객정보가 없습니다!다시 입력해주세요")										
									}else{									
										$("#listModal").modal("show");
										console.log(data);
										$("#customer").empty();
										
										//조회된 결과
										for(let i =0; i <data.length; i++){										
											let animal = data[i].animalName;
											let name = data[i].name;
											let no = data[i].customerNo;
										
											
										    let inputElement = $('<input>', { type: 'radio', name: 'cusCheck', value:no});
										
										    $("#customer").append($('<br>'))
	                  						$("#customer").append(inputElement);
	                  						$("#customer").append(name);                 					          				
                  						}								
									}
									
							
									}
									})
								});

	//보호자선택하고 등록 눌렀을때
	$('#submit').click(function() {
		var customerNo =  $("input[type=radio][name=cusCheck]:checked").val();
		console.log(customerNo);
		       								
		$("#customerNo").val(customerNo);
       								
       											
		$.ajax({
			url:"/hospitalize/customer",
			data:{
			customerNo:customerNo
			},
			method: "POST",
			success : function(data){
			console.log(data.gender);
														
			$("#gender").val(data.gender);
			$("#weight").val(data.weight);		       								
			$("#username").val(data.username);
					       								
			$("#listModal").modal("hide");
	       									
			}
		});	
	})
	
	$("#addHos").on("click",function(){
		var param = {"customerNo":$("#customerNo").val(), "username":$("#username").val(),
					"startDate":$("#startDate").val(),"lastDate":$("#lastDate").val(), 
					"cageNo":$("#cageNo").val(), "disease":$("#disease").val()}
		
		
		$.ajax({
			url:"/hospitalize/add",
			data: param,
			method:"POST",
			success: function(data){
				console.log(data)
				console.log("성공이다!")
				
				location.href="/hospitalize/list"
			}
			
		})		
		
	})
	
	
	$("#updateHos").on("click",function(){
		$.ajax({
			url:"/hospitalize/update",
			data: {
				historyNo: $("#historyNo").val(),
				cageNo: $("#cageNo").val(),
				startDate: $("#startDate").val(),
				lastDate: $("#lastDate").val(),
				disease: $("#disease").val()
			},
			method: "POST",
			success : function(rst){			
				if(rst==0){
					alert("이미 사용중인 입원실입니다!")
					$("#cageNo").focus()
				
				}else{
					location.href="/hospitalize/list";
				}
			}
		})
		
	})
	
