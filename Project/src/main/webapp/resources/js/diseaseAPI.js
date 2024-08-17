$(function(){	
	function searchDisFunction() {
		let url = "https://apis.data.go.kr/B551182/diseaseInfoService/getDissNameCodeList?serviceKey=k3sfLvK4Pu%2FQniuv44Dbxt%2FiyKSRzcXBmo0AAw%2BHPz3VNH2%2BWOiRAUACctePpTkPqiwiZ8cciBGeOIy3V7CJzA%3D%3D&numOfRows=10&pageNo=1&sickType=2&medTp=2&diseaseType=SICK_CD&searchText=";
		url += $("#searchD").val();
		$.ajax({
			url: url,
			type:"get",
			dataType : "xml",
			success: searchProcess,
			error: function(){alert("서버요청실패");}
		});
	}
	function searchProcess(data){
		let str = "<ul>";
		
		$(data).find("item").each(function() {		
			let sickCode = $(this).find("sickCd").text();
			let sickName = $(this).find("sickNm").text();
			str += "<li class='dInfo' value1='" + sickCode + "' value2='" + sickName + "'>" + sickCode + "  " + sickName + "</li>";
		})
		str += "</ul>";
		$("#sDisList").html(str);
	}
	function inputDInfoFunction() {
		const dList = document.querySelectorAll(".dInfo");
		let selectedValue1 = $(this).attr('value1');
		let selectedValue2 = $(this).attr('value2');
		$("#searchD").val(selectedValue1);
        $("#dName").html(selectedValue2);
        for(let cnt = 0; cnt < dList.length; cnt++) {
        	dList[cnt].remove();
        }
	}
	
	$("#searchD").on("keyup", searchDisFunction);
	$(document).on("click", ".dInfo", inputDInfoFunction);
});