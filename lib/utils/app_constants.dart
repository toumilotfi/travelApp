class AppConstants {
  static const String APP_NAME = "Travellery";
  static const String WEATHER_API = "0ce5ed1f11b779193c3e3d4596c9d9c8";
  static const String APP_VERSION = '1.0.0';

  static const String BASE_URL =
      'http://192.168.1.9:80'; // change this value by your domaine
  static const String COUNTRIES_URI = "/api/v1/countries/country";
  static const String CITIES_URI = "/api/v1/cities/city";
  static const String CITY_OPTIONS_URI = "/api/v1/cities/cityOption";
  static const String FOOD_TYPE_URI = "/api/v1/foods/foodType";
  static const String FOOD_MUST_EAT = '/api/v1/foodsMustEat/foodMustEat';
  static const String HOTELS_URI = "/api/v1/hotels/hotel";
  static const String HOTEL_OPTIONS_URI = "/api/v1/hotels/hotelOption";
  static const String BEACHS_URI = "/api/v1/beachs/beach";
  static const String BEACH_OPTIONS_URI = "/api/v1/beachs/beachOption";
  static const String MOUNTAINS_URI = "/api/v1/mountains/mountain";
  static const String MOUNTAIN_OPTIONS_URI = "/api/v1/mountains/mountainOption";
  static const String PARKS_URI = "/api/v1/parks/park";
  static const String EVENTS_URI = "/api/v1/events/event";
  static const String CITY_SERVICES_URI = "/api/v1/cityServices/cityService";
  static const String GUEST_HOUSES_URI = "/api/v1/guestHouses/guestHouse";
  static const String GUEST_HOUSE_OPTIONS_URI =
      "/api/v1/guestHouses/guestHouseOption";
  static const String HISTORICAL_PLACES_URI =
      "/api/v1/historicalPlaces/historicalPlace";
  static const String CAMPS_URI = "/api/v1/camps/camp";
  static const String PARKINGS_URI = "/api/v1/parkings/parking";
  static const String RESTAURANTS_URI = "/api/v1/restaurants/restaurant";
  static const String SHOPPING_ITEMS_URI = "/api/v1/shoppingItems/shoppingItem";
  static const String STATIONS_URI = "/api/v1/stations/station";
  static const String TAXIS_URI = "/api/v1/taxis/taxi";
  static const String TRANSPORTS_URI = "/api/v1/transport/transport";
  static const String UPLOAD_URL = "/uploads/";

//google maps
  //auth
  static const String TOKEN = "";
  static const String REGISTRATION_URI = "/api/v1/auth/register";
  static const String LOGIN_URI = "/api/v1/auth/login";
  static const String PHONE = "";
  static const String PASSWORD = "";
  static const String USER_INFO_URI = "/api/v1/user/info";

  static const String POPULAR_DATA_URI = '/api/v1/dataInitialisation/popular';
  static const String RECOMMEBDED_DATA_URI =
      '/api/v1/dataInitialisation/recommended';
  static const String ALL_DATA_URI = '/api/v1/dataInitialisation/all';
}
