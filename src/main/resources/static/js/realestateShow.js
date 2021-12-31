window.addEventListener("load", resizeToRealEstateInfo);
window.addEventListener("resize", resizeToRealEstateInfo);

function resizeToRealEstateInfo() {
    let title_container = document.getElementById("title_container");
    let title_info = document.getElementById("title_info");
    let title_carousel = document.getElementById("title_carousel");

    if(window.innerWidth <= 575.98) {
        console.log(1)
        title_container.classList.remove("row");
        title_container.classList.add("col");

        title_carousel.classList.remove("col-8");
        title_carousel.classList.remove("col-6");
        title_carousel.classList.add("row");

        title_info.classList.remove("col");
        title_info.classList.add("row");


        title_info.classList.add("mt-5");
    } else if(window.innerWidth <= 767.98) {
        console.log(2)
        title_container.classList.remove("col");
        title_container.classList.add("row");

        title_carousel.classList.remove("row");
        title_carousel.classList.remove("col-8");
        title_carousel.classList.add("col-6");

        title_info.classList.remove("row");
        title_info.classList.add("col");


        title_info.classList.remove("mt-5");

    } else {
        console.log(3)
        title_container.classList.remove("col");
        title_container.classList.add("row");

        title_carousel.classList.remove("col-6");
        title_carousel.classList.remove("row");
        title_carousel.classList.add("col-8");

        title_info.classList.remove("row");
        title_info.classList.add("col");

        title_info.classList.remove("mt-5");



    }
}