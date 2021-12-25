export function getPath() {
    return window.location.href.split("?")[0].split("/").filter(item => item);
}