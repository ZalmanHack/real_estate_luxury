


function changePostSection(event) {
    let id_array = event.target.id.split("_");
    let section = id_array[id_array.length - 1];

    let all_section_elements = document.getElementById("post_sections").getElementsByTagName('a');
    Array.from(all_section_elements).forEach( (el) => {
        el.classList.remove("active");
    });

    let all_lists = document.getElementsByName("post_list");
    Array.from(all_lists).forEach( (el) => {
        el.setAttribute("hidden", "");
    });

    let current_section = document.getElementById("post_list_" + section);
    current_section.removeAttribute("hidden");
    event.target.classList.add("active");
}