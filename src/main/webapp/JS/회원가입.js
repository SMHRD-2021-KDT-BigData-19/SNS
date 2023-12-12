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
    window.location.href = "../HTML/로그인.html";
}
