import 'package:food_delivery/models/address_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';

class LocationRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LocationRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getAddressfromGeocode(LatLng latLng) async {
    return await apiClient.getData('${AppConstants.GEOCODE_URI}'
      '?lat=${latLng.latitude}&lng=${latLng.longitude}'
    );
  }
  String getUserAddress(){
    return sharedPreferences.getString(AppConstants.USER_ADDRESS)??'';
  }
  Future<Response> addAddress(AddressModel addressModel)async{
    return await apiClient.postData(AppConstants.ADD_USER_ADDRESS, addressModel.toJson());
  }
}
