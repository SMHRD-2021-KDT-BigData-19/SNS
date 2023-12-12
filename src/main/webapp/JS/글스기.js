const fileInput = document.getElementById('file-input');
const fileNameSpan = document.getElementById('file-name');

// 파일 선택 이벤트 처리
fileInput.addEventListener('change', () => {
    const file = fileInput.files[0];
    handleFile(file);
});

// 파일 처리 함수
function handleFile(file) {
    if (file) {
        fileNameSpan.textContent = `선택된 파일: ${file.name}`;
    } else {
        fileNameSpan.textContent = '선택된 파일: 없음';
    }
}
function rptlvks() {
alert("글이 게시되었습니다.");
window.location.href = "../HTML/게시판.html";
}
function ahrfhr() {
    window.location.href = "../HTML/게시판.html";
    }