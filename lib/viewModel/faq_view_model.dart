// // ignore_for_file: avoid_print


// import 'package:get/get.dart';


// class FaqViewModel extends GetxController {
//   ApiResponse faqApiResponse = ApiResponse.initial('Initial');

//   /// login...
//   Future<void> faq(String token) async {
//     print(token);
//     faqApiResponse = ApiResponse.loading('Loading');
//     update();
//     print('faq Status :${faqApiResponse.status}');
//     try {
//       FaqResponseModel response = await FaqRepo().faqRepo(token);
//       faqApiResponse = ApiResponse.complete(response);
//       print("faqApiResponse RES:$response");
//     } catch (e) {
//       print('faqApiResponse.....$e');
//       faqApiResponse = ApiResponse.error('error');
//     }
//     update();
//   }
// }
