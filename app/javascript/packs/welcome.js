require('datatables.net-bs4')

let jQuery = require('jquery')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;
import $ from 'jquery';
global.$ = jQuery;

$(document).ready(function(){
    let table = $('#books').DataTable();

    $('#books_wrapper .form-control').on( 'keyup', function () {
        table
            .columns( 0 )
            .search( this.value )
            .draw();
    } );
})
