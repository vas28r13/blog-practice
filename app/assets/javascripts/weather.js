var productSchoolLat = "37.796465";
var productSchoolLng = "-122.402492";

navigator.geolocation.getCurrentPosition(coords);

function coords(pos) {
  getWeatherData(pos.coords.latitude, pos.coords.longitude);
}

function getWeatherData(lat, lng) {
  $.ajax({
    url: '/api/v1/weather',
    type: 'GET',
    data: { lat: lat, lng: lng } ,
    contentType: 'application/json; charset=utf-8',
    success: displayWeatherData,
    error: displayNoWeather
  }); 
}

function displayWeatherData(data) {
    var temp = data.currently.temperature;
    var summary = data.minutely.summary;
    $('#location').text(data.timezone)
    $('#current_weather').text("The current temperature is " + temp + " F");
    $('#summary').text(summary);
}

function displayNoWeather() {
    $('#current_weather').text("No Weather!");
}
