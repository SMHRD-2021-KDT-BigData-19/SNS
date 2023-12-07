function logout() {
    alert("회원정보가 변경되었습니다.");
    //window.location.href = "./게시글 목록1.html";
}
function logout1() {
    alert("비밀번호가 변경되었습니다.");
    //window.location.href = "./게시글 목록1.html";
}
function openImageDialog() {
    // input[type=file] 엘리먼트를 클릭하여 파일 선택 창을 엽니다.
    document.getElementById('imageInput').click();
}

// 파일 선택 시 호출되는 함수
document.getElementById('imageInput').addEventListener('change', function (event) {
    // 선택한 파일 정보를 가져옵니다.
    const file = event.target.files[0];

    if (file) {
        // FileReader를 사용하여 파일을 읽고 이미지를 표시합니다.
        const reader = new FileReader();
        reader.onload = function (e) {
            const image = document.querySelector('.profile-image');
            image.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
});