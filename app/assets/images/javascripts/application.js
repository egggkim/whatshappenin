// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

function initialize() {
  
  var mapOptions = {
    center: new google.maps.LatLng(34.0500, -118.2500),
    zoom: 13
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
    mapOptions);

 var input = /** @type {HTMLInputElement} */(
      document.getElementById('pac-input'));

  var types = document.getElementById('type-selector');
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo('bounds', map);
  // console.log(document.getElementById('pac-input').innerHTML);

  var infowindow = new google.maps.InfoWindow();
  var marker = new google.maps.Marker({
    map: map,
    anchorPoint: new google.maps.Point(0, -29)
  });

  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    infowindow.close();
    marker.setVisible(false);
    var place = autocomplete.getPlace();
    if (!place.geometry) {
      return;
    }

    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(13);  // Why 17? Because it looks good.
    }
    marker.setIcon(/** @type {google.maps.Icon} */({
      url: place.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(35, 35)
    }));
    marker.setPosition(place.geometry.location);
    marker.setVisible(true);

    var address = '';
    if (place.address_components) {
      address = [
        (place.address_components[0] && place.address_components[0].short_name || ''),
        (place.address_components[1] && place.address_components[1].short_name || ''),
        (place.address_components[2] && place.address_components[2].short_name || '')
      ].join(' ');
    }

    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    infowindow.open(map, marker);


/// / Instagram + Twitter requests

    // D is the longitude
    console.log(place.geometry.location.D);
    // k is the latitude
    console.log(place.geometry.location.k);

    var name = place.name;
    var lng = place.geometry.location.D;
    var lat = place.geometry.location.k;
    var address = place.formatted_address;
    var types = place.types[0];
    console.log(lng);
    console.log(lng);
    console.log(lat);

     var request = $.ajax({
      type: "GET",
      dataType: 'jsonp',
      url: "https://api.instagram.com/v1/media/search?lat=" + lat + "&lng=" + lng + "&distance=5000&access_token=8240865.1fb234f.a791d5203eda498586fb802a698d3c02"
    });

     request.done(function (data) {
      instaData = data;
      // console.log(data)
      dataCount = instaData.data.length;

      $('#name').text(name);
      $('#longitude').text(lng);
      $('#latitude').text(lat);
      $('#address').text(address);
      $('#type').text(types);

      $('#picture-feed').empty();

      for(i=0; i<dataCount; i++) {
        postPixUrl = instaData.data[i].images.thumbnail.url;
          // console.log(postPixUrl);
        var instaDiv = '<li>';
        instaDiv += '<img src="' + postPixUrl + '" width="150px" height="150px">';
        $('#picture-feed').append(instaDiv);


      }
      // console.log(dataCount);

      var request = $.ajax({
      type: "GET",
      dataType: 'jsonp',
      url: "https://api.instagram.com/v1/media/search?lat=" + lat + "&lng=" + lng + "&distance=5000&access_token=8240865.1fb234f.a791d5203eda498586fb802a698d3c02"
    });
  
      });

      // end of Instagram request
        /////////////////// 

  // Sets a listener on a radio button to change the filter type on Places
  // Autocomplete.
  function setupClickListener(id, types) {
    var radioButton = document.getElementById(id);
    google.maps.event.addDomListener(radioButton, 'click', function() {
      autocomplete.setTypes(types);
    });
  }

  setupClickListener('changetype-all', []);
  setupClickListener('changetype-address', ['address']);
  setupClickListener('changetype-establishment', ['establishment']);
  setupClickListener('changetype-geocode', ['geocode']);
  }

 )};

  
