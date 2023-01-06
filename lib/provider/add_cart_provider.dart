import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/theme.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ProductsVM with ChangeNotifier {
  String? iOSPlatform;
  String? androidPlatform;
  String? state;
  String? city;
  String? localArea;
  String? pincode;
  String? ipAddress;
  String _connectivityResult = '';
  final List _itemList = [];
  List _dataList = [];
  List _mainmenu = [];
  List<bool> _isFav = [];
  List _sliderimages = [];
  List _product = [];

  String get connectivityResult {
    return _connectivityResult;
  }

  List get itemList {
    return _itemList;
  }

  List get product {
    return _product;
  }

  List get sliderimages {
    return _sliderimages;
  }

  List get dataList {
    return _dataList;
  }

  List get mainmenu {
    return _mainmenu;
  }

  List<bool> get isFav {
    return _isFav;
  }
//======================================================================================

  Future<void> getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      iOSPlatform = iosDeviceInfo.identifierForVendor!;
      notifyListeners();
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      androidPlatform =
          "${androidDeviceInfo.brand} ${androidDeviceInfo.device}";
      notifyListeners();
    }
  }
//======================================================================================

  Future<void> getLocation() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? address;
    try {
      var ipAddress = IpAddress(type: RequestType.json);
      var data = await ipAddress.getIpAddress();
      address = data["ip"];
      pref.setString('inAddress', address!);
    } on IpAddressException catch (exception) {
      debugPrint("--------${exception.message}-----------");
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placeMarks[0];
    state = place.administrativeArea;
    city = place.subAdministrativeArea;
    localArea = place.street;
    pincode = place.postalCode;
    ipAddress = address;
    notifyListeners();
  }

//=======================================================================================

  void checkConnectivity2(context) async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.wifi) {
      null;
    } else if (result == ConnectivityResult.mobile) {
      null;
    } else if (result == ConnectivityResult.none) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppTheme.black,
          content: Text(
            "Please check your internet connection",
            style: AppTheme.textStyle14whitebold,
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppTheme.black,
          content: Text(
            "Please check your internet connection",
            style: AppTheme.textStyle14whitebold,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    _connectivityResult = result as String;
  }

//=======================================================================================
  increment(int i) {
    _itemList[i]['count']++;
    notifyListeners();
  }

  decrement(int i) {
    _itemList[i]['count']--;
    notifyListeners();
  }

//=======================================================================================
  add(
      {required String image,
      required String title,
      required String category,
      required String price}) {
    var abc = {
      'image': image,
      'title': title,
      'subtitle': category,
      'price': price,
      'count': 0,
    };
    _itemList.add(abc);
    notifyListeners();
  }

  delete(int index) {
    _itemList.removeAt(index);
    notifyListeners();
  }

//=======================================================================================

  func() async {
    Uri url = Uri.parse("http://ambro.deta.dev/images");
    final response = await http.get(url);
    var data = json.decode(response.body);
    //  List<bool> _likes = List.filled(data.length, false);
    _dataList = data;
    //   _isFav = _likes;
    notifyListeners();
  }

//=======================================================================================
  func2(int index) async {
    Uri url = Uri.parse("https://fabcurate.easternts.in/top.json");
    final response = await http.get(url);
    var data = json.decode(response.body);
    _mainmenu = data['main_sticky_menu'];
    List images = [];
    for (int i = 0; i < _mainmenu.length; i++) {
      images.addAll(_mainmenu[index]['slider_images']);
      _sliderimages = images;
    }
    notifyListeners();
  }

//=======================================================================================
  func3(int index) async {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(url);
    var data = json.decode(response.body);
    _product = data;
    List<bool> _likes = List.filled(_product.length, false);
    _isFav = _likes;
    notifyListeners();
  }
}
