let currentIndex = 0;
const totalImages = 5; 

function nextImage() {
    currentIndex = (currentIndex + 1) % totalImages;
    updateSlider();
}

function prevImage() {
    currentIndex = (currentIndex - 1 + totalImages) % totalImages;
    updateSlider();
}

function updateSlider() {
    const container = document.querySelector(".top_img_wrapper");
    const slideWidth = 20; 
    const transformValue = -currentIndex * slideWidth;
    container.style.transform = `translateX(${transformValue}%)`;
}

document.getElementById("prevButton").addEventListener("click", prevImage);

document.getElementById("nextButton").addEventListener("click", nextImage);
