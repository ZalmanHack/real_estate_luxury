window.addEventListener("load", resizeToRealEstateInfo);
window.addEventListener("resize", resizeToRealEstateInfo);

function resizeToRealEstateInfo() {
    let title_container = document.getElementById("title_container");
    let title_info = document.getElementById("title_info");
    let title_image = document.getElementById("title_image");
    console.log(window.innerWidth)
    if(window.innerWidth <= 767.98) {
        console.log(11)
        // console.log(window.innerWidth)
        title_container.classList.remove("row");
        title_container.classList.add("col");

        title_image.classList.remove("col");
        title_image.classList.add("row");

        title_info.classList.remove("col");
        title_info.classList.add("row");

        title_info.classList.add("mt-5");
    } else {
        console.log(22)
        // console.log(window.innerWidth)
        title_container.classList.remove("col");
        title_container.classList.add("row");

        title_image.classList.remove("row");
        title_image.classList.add("col");

        title_info.classList.remove("row");
        title_info.classList.add("col");

        title_info.classList.remove("mt-5");
    }
}

function newPost(event) {
        event.target.setAttribute("disabled", "");
        let csrf = get_csrf();
        let url = "/api/posts/new_post";
        let xhr = new XMLHttpRequest();
        xhr.open('POST', url, true);
        xhr.setRequestHeader(csrf.header, csrf.token);
        xhr.onload = () => {
            if (xhr.readyState === 4 && xhr.status === 200) {
                location.href = JSON.parse(xhr.response).url;
            }
            event.target.removeAttribute("disabled");
        };
        xhr.send(null);
}

window.addEventListener("load", () => {
    let btn_profile_image = document.getElementById('upload_profile_img_input');
    if(btn_profile_image) {
        btn_profile_image.addEventListener('change', function () {
            console.log("IMAGE");
            if (!this.files[0]) {
                return;
            }
            if (this.files[0].size / 1024 / 1024 > 2) {
                return;
            }

            if (this.files && this.files[0]) {
                const locationArray = getPath();
                const user_id = locationArray[locationArray.length - 2];
                let formData = new FormData();
                formData.append("img", this.files[0]);
                let csrf = get_csrf();
                let url = "/api/users/" + user_id + "/change_profile_img";
                let xhr = new XMLHttpRequest();
                xhr.open('POST', url, true);
                xhr.setRequestHeader(csrf.header, csrf.token);
                xhr.onload = () => {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        location.reload();
                    }
                };
                xhr.send(formData);
            }
        });
    }
})