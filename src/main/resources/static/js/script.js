

// Когда пользователь прокручивает вниз 50px от верхней части документа, измените размер шрифта заголовка

window.addEventListener("scroll", scrollFunction);
window.addEventListener("resize", scrollFunction);

window.addEventListener("scroll", scrollToRealEstateControl);
window.addEventListener("resize", scrollToRealEstateControl);

window.addEventListener("resize", resizeToRealEstateControl);
window.addEventListener("load", resizeToRealEstateControl);

window.addEventListener("load", findRealEstate);

function scrollFunction() {
    let navbar = document.getElementById("navbar-air");
    if(navbar !== null) {
        if (document.body.scrollTop > 1 || document.documentElement.scrollTop > 1) {
            navbar.id = "navbar-collapsed";
        } else if (window.innerWidth <= 991.98){
            navbar.id = "navbar-collapsed";
        } else {
            navbar.style.removeProperty('background');
        }
        
    }
    else {
        let navbar = document.getElementById("navbar-collapsed");
        if(navbar !== null) {
            if (document.body.scrollTop <= 1 && document.documentElement.scrollTop <= 1) {
                if(window.innerWidth <= 991.98) {
                    navbar.id = "navbar-collapsed";
                } else {
                    navbar.id = "navbar-air";
                }
            }
        }
    }
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
        loader.querySelector("div").setAttribute("id", "real_estate_loader");
        container.appendChild(loader);

        let real_estate_type = document.querySelector('input[name="real_estate_type"]:checked').id.split('_')[1].toUpperCase();
        let city = document.getElementById("dropdown_city").value;
        let search = document.getElementById("input_search").value;
        let price_from = Number(document.getElementById("input_price_from").value);
        let price_to = Number(document.getElementById("input_price_to").value);

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
            "city": city,
            "search": search,
            "real_estate_type": real_estate_type,
            "price_from": price_from,
            "price_to": price_to
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

function get_csrf() {
    let token = document.querySelector("meta[name='_csrf']").content;
    let header = document.querySelector("meta[name='_csrf_header']").content;
    return {"header": header, "token": token};
}

