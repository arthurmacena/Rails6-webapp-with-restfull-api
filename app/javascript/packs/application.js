import 'bootstrap';
import '../stylesheets/application';
require('admin-lte');
import "@fortawesome/fontawesome-free/js/all";

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
});