// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@fortawesome/fontawesome-free"

const menu = document.getElementById('side-menu');

menu.addEventListener('click', () => {
    if (document.getElementById('sidenavSecExample').classList.contains('active')) {
        document.getElementById('sidenavSecExample').classList.remove('active');
        document.getElementById('sidenavSecExample').classList.add('non-active');

    }
    else if (document.getElementById('sidenavSecExample').classList.contains('non-active')) {
        document.getElementById('sidenavSecExample').classList.remove('non-active');
        document.getElementById('sidenavSecExample').classList.add('active');

    }
});
