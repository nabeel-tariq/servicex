$(document).ready(function() {
    $("#technician_form").hide();
    google.maps.event.addDomListener(window, 'load', initialize);
});

function show_hide_technician_form(){
    $("#technician_listing").hide();
    $("#technician_form").show();
}

function hide(){
    $("#technician_form").hide();
    $("#technician_listing").show();
}

function initialize() {
    var input = document.getElementById('searchTextField');
    var autocomplete = new google.maps.places.Autocomplete(input);

    google.maps.event.addListener(autocomplete, 'place_changed', function() {
        input.className = '';
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            // Inform the user that the place was not found and return.
            input.className = 'notfound';
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
        $("#contractor_location_attributes_latitude").val(place.geometry.location.lat());
        $("#contractor_location_attributes_longitude").val(place.geometry.location.lng());
    });
}