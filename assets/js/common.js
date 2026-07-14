document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll("a.abstract, a.bibtex").forEach(function(link) {
        var target = link.classList.contains("abstract") ? ".abstract.hidden" : ".bibtex.hidden";
        link.addEventListener("click", function() {
            link.parentElement.parentElement.querySelectorAll(target).forEach(function(el) {
                el.classList.toggle("open");
            });
        });
    });
});
