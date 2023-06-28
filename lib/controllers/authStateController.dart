import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rhythmic_social/routes/api_route_names.dart';
import 'package:rhythmic_social/routes/app_route_names.dart';
import 'package:rhythmic_social/services/api_services.dart';
import 'package:rhythmic_social/storage/secureStorage.dart';

import '../models/userModel.dart';

class AuthStateController extends GetxController {

  // instant variables
  String _fullname = "";
  String _email = "";
  String _gender = "";
  String _dateOfBirth = "";
  String _phoneNumber = "";
  String _password = "";

  File? _selectedImage;
  String _username = "";
  String _bio = "";
  String _userType = "";
  String _musicGenre = "";
  String _purpose = "";

  bool _isLoading = false;
  bool _hidePassword = true; 
  
  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController _dateController = TextEditingController();

  List<String> _genres = [
    "Rnb",
    "Hiphop",
    "Jazz",
    "Afrobeat",
    "Pop"
  ];
  List<String> _userTypes = [
    "singer",
    "rapper",
    "producer"
  ];
  List<String> _genders = [
    "male",
    "female"
  ];

  User _user = User();

  List<dynamic> _allUsers = [];


  // GETTERS
  String get fullname => _fullname;
  String get email => _email;
  String get gender => _gender;
  String get dateOfBirth => _dateOfBirth;
  String get phoneNumber => _phoneNumber;
  String get password => _password;

  File? get selectedImage => _selectedImage;
  String get username => _username;
  String get bio => _bio;
  String get userType => _userType;
  String get musicGenre => _musicGenre;
  String get purpose => _purpose;

  bool get isLoading => _isLoading;
  bool get hidePassword => _hidePassword;

  TextEditingController get dateController => _dateController;

  List get genres => _genres;
  List get userTypes => _userTypes;
  List get genders => _genders;

  User get user => _user;

  List<dynamic> get allUsers => _allUsers;

  // SETTERS
  updateFullName(value) {
    _fullname = value;
    update();
  }
  updateEmail(value) {
    _email = value;
    update();
  }
  updateGender(value) {
    _gender = value;
    update();
  }
  updateDateOfBirth(value) {
    _dateOfBirth = value;
    update();
  }
  updatePhoneNumber(value) {
    _phoneNumber = value;
    update();
  }
  updatePassword(value) {
    _password = value;
    update();
  }
  
  updateImage(value) {
    _selectedImage = value;
    update();
  }
  updateUserName(value) {
    _username = value;
    update();
  }
  updateBio(value) {
    _bio = value;
    update();
  }
  updateUserType(value) {
    _userType = value;
    update();
  }
  updateMusicGenre(value) {
    _musicGenre = value;
    update();
  }
  updatePurpose(value) {
    _purpose = value;
    update();
  }
  updateAllUsersList(value) {
    _allUsers = value;
    update();
  }
  updateLoading(value) {
    _isLoading = value;
    update();
  }
  toggleHidePassword() {
    _hidePassword = !_hidePassword;
    update();
  }

  // GET IMAGE
  Future<void> getImage(ImageSource imageSource) async {
    try {
      var _pickedImage = await _imagePicker.pickImage(
        source: imageSource,
      );
      if (_pickedImage != null) {
        updateImage(File(_pickedImage.path));

      } else {
        Fluttertoast.showToast(
          msg: "No image selected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0
        );
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  // Date Picker
  Future<void> showDateTimePicker (BuildContext context) async{
    var dob = await showDatePicker(
      context: context, 
      initialDate: (_dateOfBirth != "") ? 
      (DateTime.parse(_dateOfBirth)) : 
      (DateTime.now()),
      firstDate: DateTime(1950, 01, 01), 
      lastDate: DateTime(2023, 01, 01).add(const Duration(days: 365)),
      builder:(context, child) => Theme(
        data: ThemeData().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: Color(0xffFEDC00),
            onPrimary: Colors.black,
            surface: Color(0xffFEDC00),
            onSurface: Colors.black,
          )
        ), 
        child: child!
      ),
    );
    if(dob != null){
      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
      String formattedDate = dateFormat.format(dob);

      updateDateOfBirth(formattedDate);
      _dateController.text = formattedDate;

       update();
    }

  }

  // SIGN UP USER
  Future<void> signUpUser() async{
    updateLoading(true);

    Map<String, dynamic> _signUpDetails = {
      "full_name": _fullname,
      "email": _email,
      "Gender": _gender,
      "dob": _dateOfBirth,
      "phone_number": _phoneNumber,
      "password": _password
    };

    var response = await ApiServices.signUpUserService(signUpRoute, _signUpDetails);
    var responseData = response!.data;
    var responseUser = responseData["data"]["user"];

    print(responseData);

    bool isSuccess = responseData["status"];
    if (isSuccess) {
      updateLoading(false);

      // STORE TOKEN AND ID
      await LocalStorage().storeUserId(responseUser["_id"]);
      await LocalStorage().storeUserToken(responseData["token"]);

      Fluttertoast.showToast(
        msg: "Sign up Successful!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );      
      
      Get.offAllNamed(usernameScreen);
    }else{
      updateLoading(false);

      Fluttertoast.showToast(
        msg: responseData["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }
  }

  // LOG IN USER
  Future<void> loginUser() async{
    updateLoading(true);

    Map<String, dynamic> _loginUserDetails = {
      "email": _email,
      "password": _password,
    };

    print(
      _loginUserDetails
    );

    var response = await ApiServices.loginService(loginRoute, _loginUserDetails);
    var responseData = response!.data;
    var responseUser = responseData["data"]["user"];

    bool isSuccess = responseData["status"];
    if (isSuccess) {
      updateLoading(false);

      String userId = responseUser["_id"];
      String token = responseData["token"];

      String userIdMain = await LocalStorage().fetchUserId();
      String tokenMain = await LocalStorage().fetchUserToken();

      if(userIdMain == "" && tokenMain == ""){
        await LocalStorage().storeUserId(userId);
        await LocalStorage().storeUserToken(token);
      }else{
        null;
      }

      Fluttertoast.showToast(
        msg: "Login Successful!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );      

      Get.offAllNamed(holderScreen);
    }else{
      updateLoading(false);

      Fluttertoast.showToast(
        msg: responseData["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }
  }

  // SET PROFILE
  Future<void> setProfile() async{
    updateLoading(true);

    // FETCH ID & TOKEN
    String userId = await LocalStorage().fetchUserId();
    String token = await LocalStorage().fetchUserToken();

    var response = await ApiServices.setProfileService(setProfileRoute, userId, token, selectedImage!.path, _username, _bio, _userType, _musicGenre, _purpose);
    var responseData = response!.data;
    var responseUser = responseData["user"];

    bool isSuccess = responseData["status"];
    if (isSuccess) {
      updateLoading(false);
      
      Fluttertoast.showToast(
        msg: "Profile Set Successful!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );      

      Get.offAllNamed(loginScreen);
    }else{
      updateLoading(false);

      Fluttertoast.showToast(
        msg: responseData["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }
  }

  // GET PROFILE
  Future<void> getUserProfile() async{
    updateLoading(true);

    String userId = await LocalStorage().fetchUserId();

    var response = await ApiServices.getUserProfileService(getUserProfileRoute, userId);
    var responseData = response!.data;

    print(responseData);

    bool isSuccess = responseData["status"];

    if(isSuccess){
      updateLoading(false);

      _user = User.fromMap(responseData["data"]);

    }else {
      updateLoading(false);

      Fluttertoast.showToast(
        msg: "Could not get details",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }

  // LOGOUT AUTH
  Future<void> logoutAuth() async{
    await LocalStorage().deleteUserStorage();

    Fluttertoast.showToast(
      msg: "Logout Successful!!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 15.0
    );

    Get.toNamed(loginScreen);
  }

  // GET ALL USERS PROFILE
  Future<void> getAllUserProfile() async{
    updateLoading(true);

    var response = await ApiServices.getAllUserProfileService(getAllUserProfileRoute);
    var responseData = response!.data;

    print(responseData);
    bool isSuccess = responseData["status"];

    if(isSuccess) {
      updateLoading(false);

      updateAllUsersList(responseData["data"]);


    }else{
      updateLoading(false);

      Fluttertoast.showToast(
        msg: "Error while getting users",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }
  }


}