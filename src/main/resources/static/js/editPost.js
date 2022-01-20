window.addEventListener('load', function() {
    let control_images_container = document.getElementById("control_images_container");
    let images_container = document.getElementById("images_container");
    let img_upload_progress_container = document.getElementById("img_upload_progress_container");
    let img_upload_progress = document.getElementById("img_upload_progress");
    let img_upload_control = document.getElementById("img_upload_control");
    let post_image_template = document.getElementById("post_image_template");
    document.getElementById('upload_img_input').addEventListener('change', function() {
        let uploaded_images = control_images_container.getElementsByTagName("img");
        if(uploaded_images.length > 10) {
            console.log("Кол-во элементов > 10");
            return;
        }
        if(!this.files[0]) {
            return;
        }
        if( this.files[0].size / 1024 / 1024 > 2 ) {
            return;
        }

        if (this.files && this.files[0]) {
            console.log(this.files[0].size)
            img_upload_control.setAttribute("hidden", null);
            changeProgressBar(0, img_upload_progress);
            img_upload_progress_container.removeAttribute("hidden", null);
            const locationArray = getPath();
            const post_id = locationArray[locationArray.length - 2];
            let formData = new FormData();
            formData.append("img", this.files[0]);
            let csrf = get_csrf();
            let url = "/api/posts/" + post_id + "/add_img";
            let xhr = new XMLHttpRequest();
            xhr.open('POST', url, true);
            xhr.setRequestHeader(csrf.header, csrf.token);
            xhr.onload = () => {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    createPostImageItem(JSON.parse(xhr.response), post_image_template, images_container);
                }
                img_upload_control.removeAttribute("hidden", null);
                img_upload_progress_container.setAttribute("hidden", null);
            };
            xhr.upload.onprogress  = (event) => {
                if(event.lengthComputable) {
                    let percent = event.loaded / event.total * 100 | 0;
                    changeProgressBar(percent, img_upload_progress);
                }
            }
            xhr.send(formData);
        }
    });
});

function deleteImg(event) {
    const locationArray = getPath();
    const post_id = locationArray[locationArray.length - 2];
    let split_id = event.target.id.split("_");
    let post_img_id = Number.parseInt(split_id[split_id.length - 1]);

    let csrf = get_csrf();
    let url = "/api/posts/" + post_id + "/del_img";
    let xhr = new XMLHttpRequest();
    xhr.open('POST', url, true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhr.setRequestHeader("Accept", "application/json;charset=UTF-8");
    xhr.setRequestHeader(csrf.header, csrf.token);
    xhr.onload = () => {
        if (xhr.readyState === 4 && xhr.status === 200) {
            let img_container = document.getElementById("post_image_container_" +  post_img_id);
            img_container.remove();
        }
    }
    xhr.send(JSON.stringify({
        "imgId": post_img_id
    }));
}

function createPostImageItem(data, post_image_template, images_container) {
    let img_item = post_image_template.content.cloneNode(true);
    let container = img_item.getElementById("post_image_container");
    container.id += "_" + data.id;
    let img = img_item.getElementById("post_image");
    img.id += "_" + data.id;
    img.src = data.image;
    let btn_delete = img_item.getElementById("btn_delete_img");
    btn_delete.id += "_" + data.id;
    images_container.appendChild(img_item);
}

function changeProgressBar(percent, element) {
    element.setAttribute("aria-valuenow", String(percent));
    element.style.width = percent + "%";
}
