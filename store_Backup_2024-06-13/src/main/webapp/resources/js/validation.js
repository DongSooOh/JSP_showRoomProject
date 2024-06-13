function CheckAddProd() {
	
	var prodId = document.getElementById("prodId");
	var name = document.getElementById("name");
	var price = document.getElementById("price");
	var instock = document.getElementById("instock");
	var description = document.getElementById("description");
	
	// 제품 아이디 체크
	if (!check(/^PROD[0-9]{4,11}$/, prodId, "[제품 코드]\nPROD과 숫자를 조합하여 5~12자까지 입력하세요.\n첫 글자는 반드시 PROD로 시작하세요.")) {
		return false;
	} 
		
	// 제품명 체크
	if (name.value.length < 2 || name.value.length > 15) {
		alert("[제품명]\n최소 2자애서 최대 15자까지 입력하세요.");
		name.focus();
		return false;
	}	
	
	// 제품 가격 체크
	if (price.value.length == 0 || isNaN(price.value)) {
		alert("[가격]\n숫자만 입력하세요.");
		price.focus();
		return false;
	}
	if (price.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다.");
		price.focus();
		return false;
	}
	
	// 재고 수 체크
	if (isNaN(instock.value)) {
		alert("[재고 수]\n숫자만 입력하세요.");
		instock.focus();
		return false;
	}
	
	// 제품 설명 체크
	if (description.value.length > 100) {
		alert("[상세설명]\n최대 100자 이하로 입력하세요.");
		description.focus();
		return false;
	}
	
	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.focus();
		return false;
	}
	
	document.newProd.submit();
}