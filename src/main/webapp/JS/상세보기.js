document.getElementById("upload-info").textContent = "작성일: " + getCurrentDateAndTime();
        // 닉네임, 조회수 등의 정보를 동적으로 업데이트하는 부분이 필요합니다.

        function addComment() {
            var commentInput = document.getElementById("comment-input").value;

            if (commentInput.trim() !== "") {
                var commentList = document.getElementById("comment-list");
                var commentItem = document.createElement("li");

                var commentTime = document.createElement("span");
                commentTime.textContent = getCurrentDateAndTime();
                commentItem.appendChild(commentTime);

                var commentContent = document.createElement("p");
                commentContent.textContent = commentInput;
                commentItem.appendChild(commentContent);

                commentList.appendChild(commentItem);

                // 댓글 입력 폼 초기화
                document.getElementById("comment-input").value = "";
            }
        }

        function getCurrentDateAndTime() {
            var now = new Date();
            var year = now.getFullYear();
            var month = now.getMonth() + 1; // 월은 0부터 시작하므로 1을 더함
            var day = now.getDate();
            var hours = now.getHours();
            var minutes = now.getMinutes();

            // 10 미만의 경우 0을 추가하여 두 자리로 표시
            month = month < 10 ? "0" + month : month;
            day = day < 10 ? "0" + day : day;
            hours = hours < 10 ? "0" + hours : hours;
            minutes = minutes < 10 ? "0" + minutes : minutes;

            // 현재 날짜와 시간을 YYYY-MM-DD HH:mm 형식으로 반환
            return "" + year + "-" + month + "-" + day + " " + hours + ":" + minutes + "";
        }