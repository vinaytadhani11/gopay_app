// // ignore_for_file: avoid_print

// import 'package:get/get.dart';

// import '../apiModel/apis/api_response.dart';

// class SignupViewModel extends GetxController {
//   ApiResponse signupApiResponse = ApiResponse.initial('Initial');

//   /// login...
//   Future<void> signup(SignupRequestModel model) async {
//     signupApiResponse = ApiResponse.loading('Loading');
//     update();
//     print('Sign up Status :${signupApiResponse.status}');
//     try {
//       SignupResponseModel response = await SignupRepo().signupRepo(model);
//       signupApiResponse = ApiResponse.complete(response);
//       print("signupApiResponse RES:$response");
//     } catch (e) {
//       print('signupApiResponse.....$e');
//       SignupResponseModel response = await SignupRepo().signupRepo(model);
//       signupApiResponse = ApiResponse.complete(response);
//       print("signupApiResponse RES:$response");

//       signupApiResponse = ApiResponse.error('error');
//     }
//     update();
//   }
// }