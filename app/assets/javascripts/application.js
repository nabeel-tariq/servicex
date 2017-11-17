// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// //= require technician
//= require bootstrap.min
//= require cable
//= require custom
//= require technician
//= require modernizr.min
//= require map
//= require gmaps.min
//= require nested_form_fields
//= require owl.carousel.min


$(document).ready(function() {
    $("#technician_form").hide();
    // google.maps.event.addDomListener(window, 'load', initialize);
    initialize(".google_map")
});

function show_hide_technician_form(){
    $("#technician_listing").hide();
    $("#technician_form").show();
}

function hide(){
    $("#technician_form").hide();
    $("#technician_listing").show();
}

function initialize(selector,call_back) {
    var input2 = $(selector);
    input2.each(function (i,elem) {
    var autocomplete2 = new google.maps.places.Autocomplete(elem);
    google.maps.event.addListener(autocomplete2, 'place_changed', function() {
        autocomplete2.className = '';
        var place = autocomplete2.getPlace();
        if (!place.geometry) {
            // Inform the user that the place was not found and return.
            autocomplete2.className = 'notfound';
            return;
        }
        var address = '';
        if (place.address_components) {
            address = [
                (place.address_components[0] && place.address_components[0].short_name || ''),
                (place.address_components[1] && place.address_components[1].short_name || ''),
                (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
        }
        if(call_back)
        call_back.call(place);
        $("#technician_location_attributes_latitude").val(place.geometry.location.lat());
        $("#technician_location_attributes_longitude").val(place.geometry.location.lng());
        return;
    });
    });
}

$.fn.closestChild = function(selector) {
    var $children, $results;
    $children = void 0;
    $results = void 0;
    $children = this.children();
    if ($children.length === 0) {
        return $();
    }
    $results = $children.filter(selector);
    if ($results.length > 0) {
        return $results;
    } else {
        return $children.closestChild(selector);
    }
};
function open_tab_from_hash() {
    var hash = window.location.hash;

    if (hash && hash.split('_tab')[0]) {
        //$('li a[role="tab"][href="' + hash.split('_tab')[0] + '"]').addClass('active');
        $('li a[href="' + hash.split('_tab')[0] + '"]').tab('show')//.trigger('shown.bs.tab');
        $('.nav.nav-tabs li.active a').trigger('shown.bs.tab');
    } else {
        if ($('.nav.nav-tabs li.active').length == 0)
            $('li a[role="tab"]:first').tab('show');
        else {
            $('.nav.nav-tabs li.active a').trigger('shown.bs.tab');
        }
    }
}
function tab_open(){
    $('ul.nav.nav-tabs li a').on("shown.bs.tab", function(e) {
        var id = $(e.target).attr("href").substr(1);
        window.location.hash = id + "_tab";
    });

// on load of the page: switch to the currently selected tab
    open_tab_from_hash();
}
$(document).ready(tab_open);