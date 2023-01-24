import 'secrets.dart' as secrets;

var unsplashApiUrlString =
    'https://api.unsplash.com/photos/random/?client_id=${secrets.unsplashApiAccessKey}&query=winter,snow,cold&count=30';
var unsplashApiUrl = Uri.parse(unsplashApiUrlString);

var pirateWeatherApiUrlString =
    'https://api.pirateweather.net/forecast/${secrets.pirateWeatherApiKey}/%lat%,%lon%?&units=ca';

var openWeatherApiUrlString =
    'https://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=%lat%&lon=%lon%&appid=${secrets.openWeatherApiKey}';
