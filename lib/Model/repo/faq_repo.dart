// // ignore_for_file: avoid_print


// // FAQ Api Method


// import 'dart:developer';
// import 'package:getx_app_full_detail/Model/apiModel/services/base_service.dart';
// import '../responseModel/faq_response_model.dart';
// import '../services/api_service.dart';

// class FaqRepo extends BaseService {
//   Future<FaqResponseModel> faqRepo(String token) async {
//     print(token);
//     var response = await ApiService().getResponse(
//       apiType: APIType.aGet,
//       headers: {
//         'Authorization': token,
//       },
//       url: faqURL,
//     );
//     log('productes res :$response');
//     FaqResponseModel faqResponseModel = FaqResponseModel.fromJson(response);
//     print('faq res=================>>>$faqResponseModel');
//     return faqResponseModel;
//   }
// }
