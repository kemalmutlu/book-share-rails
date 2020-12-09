require('datatables.net-bs4')

let jQuery = require('jquery')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;
import $ from 'jquery';
global.$ = jQuery;


let table = $('#books').DataTable();

document.addEventListener("turbolinks:load", function() {
    $('#books_wrapper .form-control').on( 'keyup', function () {
        table
            .columns( 0 )
            .search( this.value )
            .draw();
    } );
})

document.addEventListener("turbolinks:before-cache", function() {
    if (table !== null) {
        table.destroy();
    }
})
