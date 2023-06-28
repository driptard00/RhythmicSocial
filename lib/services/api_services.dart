import 'package:dio/dio.dart';
import 'package:rhythmic_social/routes/api_route_names.dart';

class ApiServices {

  // ============= SIGN UP SERVICE ===========
  static Future<Response?> signUpUserService(String signUpRoute, Map<String, dynamic> signUpDetails) async {
    try {
      String fullUrl = "$baseUrl$signUpRoute";
      print("FULLURL=======$fullUrl");

      var response = await Dio().post(
        fullUrl,
        data: signUpDetails,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            // 'Authorization': token,
          }
        ),
      );
      return response;
      
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // ============= LOGIN SERVICE ===========
  static Future<Response?> loginService(String loginRoute, Map<String, dynamic> loginDetails) async {
    try {
      String fullUrl = "$baseUrl$loginRoute";
      print("FULLURL=======$fullUrl");

      var response = await Dio().post(
        fullUrl,
        data: loginDetails,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            // 'Authorization': token,
          }
        ),
      );
      return response;
      
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // ============= SET PROFILE SERVICE ===========
  static Future<Response?> setProfileService(String setProfileRoute, String id, String token, String filePath, String username, String bio, String userType, String musicGenre, String purpose) async {
    try {
      String fullUrl = "$baseUrl$setProfileRoute$id";
      print("FULLURL=======$fullUrl");

      String imagename = filePath.split("/").last;

      FormData _formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          filePath,
          filename: imagename,
        ),
        "username": username,
        "bio": bio,
        "user_type": userType,
        "music_genre": musicGenre,
        "purpose": purpose,
      });

      var response = await Dio().put(
        fullUrl,
        data: _formData,
        options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': token,
            }
        ),
      );
      return response;

    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // GET USER PROFILE SERVICE
  static Future<Response?> getUserProfileService(String urlRoute, String userId) async{
    try {
      String fullUrl = "$baseUrl$urlRoute$userId";

      var response = await Dio().get(
        fullUrl
      );
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // GET ALL USER PROFILE SERVICE
  static Future<Response?> getAllUserProfileService(String urlRoute) async{
    try {
      String fullUrl = "$baseUrl$urlRoute";

      var response = await Dio().get(
        fullUrl
      );
      return response;
    } on DioError catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }



}