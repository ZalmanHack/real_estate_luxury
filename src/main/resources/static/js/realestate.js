

window.addEventListener("load", init);
window.addEventListener("scroll", scrollToRealEstateControl);
window.addEventListener("resize", scrollToRealEstateControl);
window.addEventListener("resize", resizeToRealEstateControl);
window.addEventListener("load", resizeToRealEstateControl);
window.addEventListener("load", findRealEstate);

function init() {
    let input_search_name = document.getElementById("input_search_name");
    let dropdown_city = document.getElementById("dropdown_city");
    let real_estate_types = Array.from(document.getElementsByName("real_estate_type"));
    let input_price_from = document.getElementById("input_price_from");
    let input_price_to = document.getElementById("input_price_to");

    setParameterByName("price_from", input_price_from.value);
    setParameterByName("price_to", input_price_to.value);

    input_search_name.value = getParameterByName("name");
    if(getParameterByName("city")) {
        dropdown_city.value = getParameterByName("city");
    } else {
        dropdown_city.options.selectedIndex = 0;
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



    input_search_name.addEventListener("change", (e) => {
        setParameterByName("name", e.target.value);
        findRealEstate();
    });
    dropdown_city.addEventListener("change", (e) => {
        setParameterByName("city", e.target.value);
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
        let url = "/api/post";
        let xhr = new XMLHttpRequest();
        xhr.open('POST', url, true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xhr.setRequestHeader("Accept", "application/json;charset=UTF-8");
        xhr.setRequestHeader(csrf.header, csrf.token);
        xhr.onload = () => {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // console.log(JSON.parse(xhr.response));
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
            "size": 25,
            "page": 0,
            "city": getParameterByName("city"),
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
    if(data.postImages[0]) {
        image = item_image.content.cloneNode(true).querySelector("img");
        image.id += "_" + data.id;
        image.src = data.postImages[0];
        console.log(image);
    } else {
        image = item_alter_image.content.cloneNode(true).querySelector("div");
        image.id += "_" + data.id;
    }
    let card_image = item.getElementById("card_image");
    card_image.appendChild(image);

    let title = item.getElementById("card_title");
    title.id += "_" + data.id;
    title.innerHTML = data.locationName;

    let real_estate_type = item.getElementById("card_real_estate_type");
    real_estate_type.id += "_" + data.id;
    real_estate_type.innerHTML = data.realEstateType;

    let price = item.getElementById("card_price");
    price.id += "_" + data.id;
    price.innerHTML = data.price;

    let description = item.getElementById("card_description");
    description.id += "_" + data.id;
    if(data.localizedBodies[0]) {
        description.innerHTML = data.localizedBodies[0].features;
    }

    let card_open = item.getElementById("card_open");
    card_open.id += "_" + data.id;
    card_open.href = "real_estate/" + data.id;

    return item;
}


function resizeToRealEstateControl() {
    let radio_group = document.getElementById("real_estate_radio_group");
    let btn_group = document.getElementById("real_estate_btn_group");

    if(radio_group) {
        if(window.innerWidth <= 575.98) {
            radio_group.classList.remove("btn-group");
            radio_group.classList.add("btn-group-vertical");
        } else {
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