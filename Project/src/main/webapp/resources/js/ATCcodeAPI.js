$(function(){	
    function searchATCFunction() {
        let url = "https://apis.data.go.kr/1471000/DrbBundleInfoService02/getDrbBundleList02?serviceKey=k3sfLvK4Pu%2FQniuv44Dbxt%2FiyKSRzcXBmo0AAw%2BHPz3VNH2%2BWOiRAUACctePpTkPqiwiZ8cciBGeOIy3V7CJzA%3D%3D&pageNo=1&numOfRows=10&type=json&cnsgnCancelName=%EC%A0%95%EC%83%81&trustAtcCode=";
        $.ajax({
            url: url + $("#ATCCd").val(),
            type: "get",
            dataType: "json",
            success: searchProcess,
            error: function(xhr, status, error) {
                console.error("서버 요청 실패: ", status, error);
                alert("서버 요청 실패");
            }
        });
    }

    function searchProcess(data) {
        let str = "<ul>";
        
        // 응답 데이터 구조 확인
        console.log("API 응답 데이터: ", data);      

        // 응답 데이터 구조에 맞게 접근
        if (data && data.body) {
            let items = data.body.items;
            let trustItemName;
            
            for (let i = 0; i < items.length; i++) {
                let obj = items[i];
                let result = obj.item;             
                let trustAtcCode = result.trustAtcCode;                
                let trustQntList = result.trustQntList;
				if(trustItemName != result.trustItemName) {
					trustItemName = result.trustItemName;
					let content = trustItemName + "--" + trustQntList;
					
	                str += "<li class='aInfo' value1='" + trustAtcCode + "' value2='" + content + "'>" + trustAtcCode + ", " + content + "</li>";
				}  
           	}       
        } else {
            str += "<li>No data found or invalid data structure</li>";
        }
        
        str += "</ul>";
        $("#sATCList").html(str);
    }
    
    function inputAInfoFunction() {
    	const aList = document.querySelectorAll(".aInfo");
		let selectedValue1 = $(this).attr('value1');
		let selectedValue2 = $(this).attr('value2');		
		$("#ATCCd").val(selectedValue1);
        $("#aName").html(selectedValue2);
        for(let cnt = 0; cnt < aList.length; cnt++) {
        	aList[cnt].remove();
        }
	}
    
    $("#ATCCd").on("keyup", searchATCFunction);
    $(document).on("click", ".aInfo", inputAInfoFunction);
});