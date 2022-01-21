window.addEventListener("load", resizeToRealEstateInfo);
window.addEventListener("load", loadVideo);
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

function loadVideo() {
    const locationArray = getPath();
    let element = document.getElementById("main_video");
    if(element && locationArray[locationArray.length - 3] === "real_estate") {
        const postId = locationArray[locationArray.length - 2];
        let url = "/api/posts/" + postId + "/main_video";
        let xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.onload = () => {
            if (xhr.readyState === 4 && xhr.status === 200 && xhr.response !== null) {
                let source = document.createElement('source');
                source.type = "video/" + xhr.response.split(".")[xhr.response.split(".").length - 1];
                source.src = xhr.response;
                element.appendChild(source);
            }
        };
        xhr.send(null);
    }
}
