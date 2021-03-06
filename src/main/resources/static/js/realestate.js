

window.addEventListener("load", init);
window.addEventListener("scroll", scrollToRealEstateControl);
window.addEventListener("resize", scrollToRealEstateControl);
window.addEventListener("resize", resizeToRealEstateControl);
window.addEventListener("load", resizeToRealEstateControl);
window.addEventListener("scroll", resizeToRealEstateControl);
window.addEventListener("load", findRealEstate);

function init() {
    let input_search_name = document.getElementById("input_search_name");
    let dropdown_city = document.getElementById("dropdown_city");
    let dropdown_company_name = document.getElementById("dropdown_company_name");
    let dropdown_post_status = document.getElementById("dropdown_post_status");
    let real_estate_types = Array.from(document.getElementsByName("real_estate_type"));
    let input_price_from = document.getElementById("input_price_from");
    let input_price_to = document.getElementById("input_price_to");

    input_search_name.value = getParameterByName("name");

    if(getParameterByName("city")) {
        dropdown_city.value = getParameterByName("city");
    } else {
        dropdown_city.options.selectedIndex = 0;
    }

    if(getParameterByName("company_name")) {
        dropdown_company_name.value = getParameterByName("company_name");
    } else {
        dropdown_company_name.options.selectedIndex = 0;
    }

    if(getParameterByName("post_status")) {
        dropdown_post_status.value = getParameterByName("post_status");
    } else {
        dropdown_post_status.options.selectedIndex = 0;
    }

    let real_estate_type = getParameterByName("real_estate_type");
    real_estate_types.forEach(input => {
        if (("radio_" + real_estate_type).toLowerCase() === input.id) {
            input.setAttribute("checked", "");
        } else {
            input.removeAttribute("checked", "");
        }
    });

    if(getParameterByName("price_from") !== '') {
        input_price_from.value = getParameterByName("price_from");
    }

    if(getParameterByName("price_to") !== '') {
        input_price_to.value = getParameterByName("price_to");
    }

    setParameterByName("price_from", input_price_from.value);
    setParameterByName("price_to", input_price_to.value);
    setParameterByName("company_name", dropdown_company_name.value);
    setParameterByName("post_status", dropdown_post_status.value);

    input_search_name.addEventListener("change", (e) => {
        setParameterByName("name", e.target.value);
        findRealEstate();
    });
    dropdown_city.addEventListener("change", (e) => {
        setParameterByName("city", e.target.value);
        findRealEstate();
    });
    dropdown_company_name.addEventListener("change", (e) => {
        setParameterByName("company_name", e.target.value);
        findRealEstate();
    });
    dropdown_post_status.addEventListener("change", (e) => {
        setParameterByName("post_status", e.target.value);
        findRealEstate();
    });
    real_estate_types.forEach(input => {
        input.addEventListener('click', e => {
            setParameterByName("real_estate_type", e.target.id.split("_")[1]);
            findRealEstate();
        }, false)
    })
    input_price_from.addEventListener("focusout", (e) => {
        setParameterByName("price_from", e.target.value);
        findRealEstate();
    });
    input_price_to.addEventListener("focusout", (e) => {
        setParameterByName("price_to", e.target.value);
        findRealEstate();
    });
}


// Real estate page ----------------------------------------------------------------------------------------------------

function findRealEstate() {
    let container = document.getElementById("real_estate_items_container");
    let items_container = document.getElementById("real_estate_items");
    let item_template = document.getElementById("real_estate_item");
    let item_image = document.getElementById("real_estate_card_image");
    let item_alter_image = document.getElementById("real_estate_card_alter_image");
    let table_template = document.getElementById("real_estate_table_body");
    let control = document.getElementById("real_estate_control");
    if(container && items_container && item_template && table_template && control) {
        items_container.innerHTML = "";
        let loader = document.getElementById("loader_template").content.cloneNode(true);

        if(document.getElementById("real_estate_loader")) {
            document.getElementById("real_estate_loader").remove();
        }
        loader.querySelector("div").setAttribute("id", "real_estate_loader");
        container.appendChild(loader);

        let csrf = get_csrf();
        let url = "/api/posts";
        let xhr = new XMLHttpRequest();
        xhr.open('POST', url, true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xhr.setRequestHeader("Accept", "application/json;charset=UTF-8");
        xhr.setRequestHeader(csrf.header, csrf.token);
        xhr.onload = () => {
            if (xhr.readyState === 4 && xhr.status === 200) {
                const response_body = JSON.parse(xhr.response);
                Object.keys(response_body.content).forEach(data => {
                    items_container.appendChild(create_real_estate_item(response_body.content[data], item_template, table_template, item_image, item_alter_image));
                })
            } else {
                console.log(false);
            }
            document.getElementById("real_estate_loader").remove();
        };
        xhr.send(JSON.stringify({
            "size": 10000,
            "page": 0,
            "city": getParameterByName("city"),
            "company_name": getParameterByName("company_name"),
            "post_status": getParameterByName("post_status"),
            "name": getParameterByName("name"),
            "real_estate_type": getParameterByName("real_estate_type"),
            "price_from": getParameterByName("price_from"),
            "price_to": getParameterByName("price_to")
        }));
    }
}



function create_real_estate_item(data, item_template, table_template, item_image, item_alter_image) {
    let item = item_template.content.cloneNode(true);
    let image;
    if(data.mainImage) {
        image = item_image.content.cloneNode(true).querySelector("img");
        image.id += "_" + data.id;
        image.src = data.mainImage;
    } else {
        image = item_alter_image.content.cloneNode(true).querySelector("div");
        image.id += "_" + data.id;
    }
    let card_image = item.getElementById("card_image");
    card_image.appendChild(image);

    let real_estate_type = item.getElementById("card_real_estate_type");
    real_estate_type.id += "_" + data.id;
    real_estate_type.innerHTML = data.realEstateType;

    let post_status = item.getElementById("card_post_status");
    post_status.id += "_" + data.id;
    post_status.innerHTML = data.postStatus;

    let title = item.getElementById("card_title");
    title.id += "_" + data.id;
    title.innerHTML = data.name;

    let area = item.getElementById("card_area");
    area.id += "_" + data.id;
    area.innerHTML = data.area;

    let bedrooms = item.getElementById("card_bedrooms");
    bedrooms.id += "_" + data.id;
    bedrooms.innerHTML = data.bedrooms;

    let bathrooms = item.getElementById("card_bathrooms");
    bathrooms.id += "_" + data.id;
    bathrooms.innerHTML = data.bathrooms;

    let pool = item.getElementById("card_swimming_pool");
    pool.id += "_" + data.id;
    pool.innerHTML = data.swimmingPool;

    let parking = item.getElementById("card_parking");
    parking.id += "_" + data.id;
    parking.innerHTML = data.parking;

    let features = item.getElementById("card_features");
    features.id += "_" + data.id;
    if(data.localizedBodies[0]) {
        features.innerHTML = data.localizedBodies[0].features;
    }

    let price = item.getElementById("card_price");
    price.id += "_" + data.id;
    price.innerHTML = data.price.toLocaleString();

    let card_open = item.getElementById("card_open");
    card_open.id += "_" + data.id;
    card_open.href = "/real_estate/" + data.id + "/show";

    if(!data.longitude || !data.latitude) {
        let card_map_container = item.getElementById("card_map_container");
        card_map_container.remove();
    } else {
        let card_map_container = item.getElementById("card_map_container");
        card_map_container.id += "_" + data.id;

        let card_map = item.getElementById("card_map");
        card_map.id += "_" + data.id;
        card_map.href = "https://www.google.com/maps/search/" + data.latitude + ",+" + data.longitude;
    }

    return item;
}


function resizeToRealEstateControl() {
    let radio_group = document.getElementById("real_estate_radio_group");
    let btn_group = document.getElementById("real_estate_btn_group");

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
    if(btn_group) {
        if(window.innerWidth <= 991.98) {
            btn_group.classList.remove("flex-row");
            btn_group.classList.add("flex-column");
        } else {
            btn_group.classList.add("flex-row");
            btn_group.classList.remove("flex-column");
        }
    }
}

function scrollToRealEstateControl() {
    let navbar = document.getElementsByTagName("nav")[0];
    let container = document.getElementById("real_estate_container");
    let control = document.getElementById("real_estate_control");

    if(window.innerWidth <= 991.98) {
        control.classList.remove("fixed-top");
        control.classList.add("shadow-none");
        navbar.classList.remove("shadow-none");
        navbar.style.marginTop = "0px";
        navbar.style.transition = 0.2 + "s";
    } else {
        const container_padding = parseInt(getComputedStyle(container, null).getPropertyValue('padding-top'));
        const container_pos = getOffset(container).top + container_padding;
        container.style.minHeight = control.offsetHeight + container_padding + "px";
        if(container_pos - navbar.offsetHeight <= 0) {
            if(container_pos <= 0) {
                navbar.style.marginTop = -(navbar.offsetHeight) + "px";
                control.classList.add("fixed-top");
                control.classList.remove("shadow-none");
            } else {
                navbar.style.marginTop = (container_pos - navbar.offsetHeight) + "px";
                control.classList.remove("fixed-top");
                control.classList.remove("shadow-none");
                navbar.classList.add("shadow-none");
            }
            navbar.style.transition = 0 + "s";
        } else {
            control.classList.remove("fixed-top");
            control.classList.add("shadow-none");
            navbar.classList.remove("shadow-none");
            navbar.style.marginTop = "0px";
            navbar.style.transition = 0.2 + "s";
        }
    }
}

function getOffset(el) {
    const rect = el.getBoundingClientRect();
    return {
        left: rect.left,
        top: rect.top
    };
}