$(function(){
	$.ajax({
		url:"/hospitalize/list",
		method:"POST",
		success:function(data){
			console.log("성공!리스트를 불러와라")
			console.log(data);
			for(let i =0; i <data.length; i++){	
				
				let historyNo = data[i].historyNo;								
				let cageNo = data[i].cageNo;
				let disease = data[i].disease;
				let animalName = data[i].animalName;
				let gender = data[i].gender;
				let weight = data[i].weight;
				let startDate = data[i].startDate;
				let lastDate = data[i].lastDate;
				let customerNo = data[i].customerNo;
			
				
				 arrNo = cageNo-1;
							
				 let cage = document.getElementsByClassName('cage');

				 let div = document.createElement("div");
				 let div2 = document.createElement("div");		
				 				 
				 let update = document.createElement("a");
				 let del = document.createElement("a");
				 let detail = document.createElement("a");
				 
				 
				 
				 update.innerText="수정"
				 update.href = '/hospitalize/update?historyNo='+historyNo;
				 update.classList.add('btn');
				 update.classList.add('btn-outline-info');
		
				 del.innerText="퇴원"
				 del.href= '/hospitalize/delete?historyNo='+historyNo;
				 del.classList.add('btn');
				 del.classList.add('btn-outline-success');
				 
				 detail.innerText="사용불가"
				 detail.href= '/customer/detail?customerNo='+customerNo;
				 detail.classList.add('btn-danger')
				 
				 div.classList.add('content')
				 div.innerText = "이름  :  "+animalName + "\n" +"증상  :  " + disease + "\n"
				 				+"성별  :  " + gender + "\n" +"몸무게  :  " + weight + "\n" +
				 				"입원일  :  " + startDate + "\n" +"퇴원예정일  :  " + lastDate + "\n"+"\n"; 
				 
				 div.append(update);													 
				 div.append(del);
				 div2.append(detail);
			 	 div2.classList.add('right')
			 	 
			 	 cage[arrNo].append(div2);
				 cage[arrNo].append(div);
				 cage[arrNo].classList.add('r');
				 
						 
			
			}
			 
			
			let cage= $('div.cage').not('div.r')
			
			 
			 //let cageNo =document.getElementsByClassName($('div.cage').not('div.r'))[0].id;
		
			 
			 for(let i=0; i<cage.length; i++){
				 let a = document.createElement("a");
				 let div = document.createElement("div");
				 
				 console.log(cage)
				 let cageNo = cage[i].id
				 
				 div.append(a)
			 	 div.classList.add('right')
			 
				 a.innerText="사용가능"
				 a.href = '/hospitalize/add?cageNo='+cageNo;
				 
				
				 let image = document.createElement("img");
				 image.src ="/resources/images/puppy3.png";
				 
				 cage[i].append(div);
				 cage[i].append(image);					 			 
			 }
			 $('div.cage').not('div.r').css( 'background-color', '#A9D0F5')
			 
			/*let r = document.getElementsByClassName('r');
			let cage = document.getElementsByClassName('cage');
			if(!r){
				for(let i=0; i<cage.length;i++){
				cage[i].classList.add('f');
				}
			}*/
						
			
		}
	})
	
	
})
	
	
	
