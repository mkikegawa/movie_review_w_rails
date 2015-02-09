
function goBack() {
    window.history.back()
}

var video = document.getElementById("campy_vid");
function vidmute() {
  video.muted = true;
  video.load()
}
