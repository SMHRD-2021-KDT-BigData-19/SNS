function checkDuplicate() {
    const username = document.getElementById("username").value;
    const isDuplicate = false;
    if (isDuplicate) {
        alert("이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.");
    } else {
        alert("사용 가능한 아이디입니다.");
    }
}

function checkDuplicate_nick() {
    const username = document.getElementById("nickname").value;
    const isDuplicate = false;
    if (isDuplicate) {
        alert("이미 사용 중인 닉네임입니다. 다른 닉네임을 입력해주세요.");
    } else {
        alert("사용 가능한 닉네임입니다.");
    }
}

function showAlert() {
    alert("회원가입이 완료되었습니다!");
    window.location.href = "memberLogin.jsp";
}

function joinCheck() {
	if (document.frm.name.value.length == 0) {
		alert("이름을 써주세요.");
		frm.name.focus();
		return false;
	}
	if (document.frm.nick.value.length == 0) {
		alert("닉네임을 써주세요.");
		frm.name.focus();
		return false;
	}
	if (document.frm.id.value.length == 0) {
		alert("아이디를 써주세요");
		frm.id.focus();
		return false;
	}
	if (document.frm.id.value.length < 4) {
		alert("아이디는 4글자이상이어야 합니다.");
		frm.id.focus();
		return false;
	}
	if (document.frm.pw.value == "") {
		alert("암호는 반드시 입력해야 합니다.");
		frm.pw.focus();
		return false;
	}
	if (document.frm.pw.value != document.frm.pw_check.value) {
		alert("암호가 일치하지 않습니다.");
		frm.pw.focus();
		return false;
	}
	if (document.frm.reid.value.length == 0) {
		alert("중복 체크를 하지 않았습니다.");
		frm.id.focus();
		return false;
	}
	return true;
}
