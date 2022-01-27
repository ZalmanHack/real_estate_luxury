window.addEventListener("resize", resizeToRealEstateControl);
window.addEventListener("load", resizeToRealEstateControl);
window.addEventListener("scroll", resizeToRealEstateControl);

window.addEventListener('load', function() {
    window.scrollTo(0, 0);

    let control_images_container = document.getElementById("control_images_container");
    let images_container = document.getElementById("images_container");
    let img_upload_progress_container = document.getElementById("img_upload_progress_container");
    let img_upload_progress = document.getElementById("img_upload_progress");
    let img_upload_control = document.getElementById("img_upload_control");
    let post_image_template = document.getElementById("post_image_template");
    document.getElementById('upload_img_input').addEventListener('change', function() {
        let uploaded_images = control_images_container.getElementsByTagName("img");
        // if(uploaded_images.length > 10) {
        //     console.log("Кол-во элементов > 10");
        //     return;
        // }
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

function resizeToRealEstateControl() {
    let radio_group = document.getElementById("real_estate_radio_group");
    if(radio_group) {
        if(window.innerWidth <= 575.98) {
            console.log(1)
            radio_group.classList.remove("btn-group");
            radio_group.classList.add("btn-group-vertical");
        } else {
            console.log(window.innerWidth)
            radio_group.classList.add("btn-group");
            radio_group.classList.remove("btn-group-vertical");
        }
    }
}

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

function changeProgressBar(percent, element) {
    element.setAttribute("aria-valuenow", String(percent));
    element.style.width = percent + "%";
}

function changeLocale(event, name) {
    let id_array = event.target.id.split("_");
    let locale = id_array[id_array.length - 1];

    let all_locale_elements = document.getElementById("locale_" + name).getElementsByTagName('a');
    Array.from(all_locale_elements).forEach( (el) => {
        el.classList.remove("active");
    });

    let all_description_container = document.getElementsByName("input_" + name + "_container");
    Array.from(all_description_container).forEach( (el) => {
        el.setAttribute("hidden", "");
    });

    let input_description_container = document.getElementById("input_" + name + "_container_" + locale);
    input_description_container.removeAttribute("hidden");

    event.target.classList.add("active");
}

function changeDescriptionLocale(event) {
    changeLocale(event, "description");
}

function changeFeaturesLocale(event) {
    changeLocale(event, "features");
}

function savePost() {

    let locale_tags = document.getElementById("locale_description").getElementsByTagName("a");

    let localizedBodies = [];
    Array.from(locale_tags).forEach( (el) => {
        const array_id = el.id.split("_");
        const locale = array_id[array_id.length - 1];
        localizedBodies.push({
            localeCode: locale,
            description: document.getElementById("input_description_" + locale).innerHTML.replace(/ +(?= )/g,''),
            features: document.getElementById("input_features_" + locale).innerHTML.replace(/ +(?= )/g,'')
        })
    });

    const locationArray = getPath();
    const postId = locationArray[locationArray.length - 2];
    let csrf = get_csrf();
    let url = "/api/posts/" + postId + "/save";
    let xhr = new XMLHttpRequest();
    xhr.open('POST', url, true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhr.setRequestHeader("Accept", "application/json;charset=UTF-8");
    xhr.setRequestHeader(csrf.header, csrf.token);
    xhr.onload = () => {
        if (xhr.readyState === 4 && xhr.status === 200) {
            location.href = "/real_estate/" + postId + "/show";
        }
    }

    xhr.send(JSON.stringify({
        id: postId,
        price: document.getElementById("inputPrice").value,
        cityValue: document.getElementById("dropdownLocationCityValue").value,
        name: document.getElementById("inputLocationName").value,
        latitude: document.getElementById("inputLocationLatitude").value,
        longitude: document.getElementById("inputLocationLongitude").value,
        realEstateType: document.querySelector('input[name="real_estate_type"]:checked').id.split("_")[1].toUpperCase(),
        area: document.getElementById("inputArea").value,
        bedrooms: document.getElementById("inputBedrooms").value,
        bathrooms: document.getElementById("inputBathrooms").value,
        guestBathrooms: document.getElementById("inputGuestBathrooms").value,
        terrace: document.getElementById("inputTerrace").value,
        swimmingPool: document.getElementById("inputSwimmingPool").value,
        parking: document.getElementById("inputParking").value,
        gym: document.getElementById("inputGym").value,
        golf: document.getElementById("inputGolf").value,
        tennis: document.getElementById("inputTennis").value,
        mall: document.getElementById("inputMall").value,
        beach: document.getElementById("inputBeach").value,
        kitchen: document.getElementById("inputKitchen").value,
        livingRoom: document.getElementById("inputLivingRoom").value,
        barbecueArea: document.getElementById("inputBarbecueArea").value,
        localizedBodies: localizedBodies
    }));
}

function disablePost() {
    changePostStatus("disable");
}

function soldOutPost() {
    changePostStatus("sold_out");
}

function changePostStatus(status) {
    const locationArray = getPath();
    const postId = locationArray[locationArray.length - 2];
    let csrf = get_csrf();
    let url = "/api/posts/" + postId + "/" + status;
    let xhr = new XMLHttpRequest();
    xhr.open('POST', url, true);
    xhr.setRequestHeader(csrf.header, csrf.token);
    xhr.onload = () => {
        if (xhr.readyState === 4 && xhr.status === 200) {
            location.href = "/real_estate/" + postId + "/show";
            console.log(true);
        } else {
            console.log(false);
        }
    }
    xhr.send(null);
}