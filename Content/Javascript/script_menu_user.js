function toggleDropdown() {
    const menu = document.getElementById("dropdownMenu");
    menu.style.display = (menu.style.display === "block") ? "none" : "block";
}

// Ferme le menu si on clique ailleurs
document.addEventListener("click", function(e) {
    const dropdown = document.getElementById("dropdownMenu");
    const profile = document.querySelector(".profile-pic");

    if (dropdown && profile && !profile.contains(e.target) && !dropdown.contains(e.target)) {
        dropdown.style.display = "none";
    }
});
