// // ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ogas/Model/apiModel/requestModel/signup_request_model.dart';
// import 'package:ogas/Model/apiModel/responseModel/customre_response_model.dart';
// import 'package:ogas/Model/apis/api_response.dart';
// import 'package:ogas/home_screen/home.dart';
// import 'package:ogas/viewmodel/signup_view_model.dart';
// import 'package:ogas/utils/colors.dart';
// import 'package:ogas/widgets/custom_button.dart';
// import 'package:ogas/utils/loading_dialog.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // import '../Model/apiModel/requestModel/signUp_request_model.dart';
// import '../Model/apiModel/responseModel/signup_response_model.dart';
// import '../Model/apis/pref_string.dart';

// class NamePage extends StatefulWidget {
//   NamePage({Key? key}) : super(key: key);

//   @override
//   State<NamePage> createState() => _HomeState();
// }

// class _HomeState extends State<NamePage> {
//   final TextEditingController _nameController = TextEditingController();
//   SignupViewModel signupViewModel = Get.find();
//   SignupRequestModel signupReq = SignupRequestModel();
//   SignupResponseModel signupRes = SignupResponseModel();

//   String? phoneNumber;
//   String? name;
//   getPhoneNumber() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     phoneNumber = pref.getString(PrefString.phoneNumber);

//     setState(() {});
//     print("++++++++++++++++++++++++++++++");

//     print(phoneNumber);
//   }

//   CustomerResponseModel? customerRes;

//   createCustomer(String clientCustomerId) async {
//     try {
//       HttpClient httpClient = HttpClient();
//       HttpClientRequest request = await httpClient.postUrl(
//           Uri.parse('https://uatcheckout.thawani.om/api/v1/customers'));
//       request.headers.set('content-type', 'application/json');
//       request.headers.set('thawani-api-key', 'rRQ26GcsZzoEhbrP2HZvLYDbn9C9et');
//       request.add(
//           utf8.encode(json.encode({"client_customer_id": clientCustomerId})));
//       HttpClientResponse htttpResponse = await request.close();
//       String reply = await htttpResponse.transform(utf8.decoder).join();
//       print(reply);
//       httpClient.close();
//       Map<String, dynamic> map = json.decode(reply);
//       print('=========================');
//       print(map);
//       customerRes = CustomerResponseModel.fromJson(map);
//       if (mounted) {
//         setState(() {});
//       }
//       print('=========================');
//       print(customerRes!.data!.id);
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       pref.setString(
//           PrefString.paymentCustomerId, customerRes!.data!.id.toString());
//     } catch (e) {
//       print('Error=>.. $e');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getPhoneNumber();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xffFBB941),
//                 Color(0xffF58823),
//                 Color(0xffF58823),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: Column(
//             children: [
//               Container(
//                 height: 190,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("asset/gascylinderback.png"),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Spacer(),
//                     const Padding(
//                       padding: EdgeInsets.all(20.0),
//                       child: Text(
//                         "What's\nYour Name",
//                         style: TextStyle(
//                             fontSize: 35,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: "DMSans"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height - 190,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(40),
//                       topRight: Radius.circular(40)),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.all(50),
//                       height: 120,
//                       width: 120,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage("asset/icons/full name.png"),
//                             fit: BoxFit.cover),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.only(
//                         left: 20,
//                         right: 20,
//                       ),
//                       alignment: Alignment.topLeft,
//                       child: const Text("Full Name",
//                           style: TextStyle(
//                             color: Color(0xff212121),
//                             fontSize: 16,
//                             fontFamily: "DMSans",
//                             fontWeight: FontWeight.w500,
//                           )),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 20,
//                         right: 20,
//                       ),
//                       child: TextFormField(
//                         controller: _nameController,
//                         decoration: InputDecoration(
//                           hintStyle: TextStyle(
//                             fontFamily: "DMSans",
//                           ),
//                           hintText: 'John Smith',
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: ColorConstants.grey, width: 2),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                     CustomButton(
//                       text: 'ENTER',
//                       onPressed: () async {
//                         showLoadingDialog(context: context);
//                         SharedPreferences pref =
//                             await SharedPreferences.getInstance();
//                         pref.setString(PrefString.name, _nameController.text);
//                         var email = pref.getString(PrefString.email);

//                         createCustomer(email.toString());

//                         var customerId =
//                             pref.getString(PrefString.paymentCustomerId);

//                         signupReq.name = _nameController.text;
//                         signupReq.mobile = phoneNumber;
//                         signupReq.paymentCustomerId = customerId;
//                         signupReq.email = email;

//                         FocusScope.of(context).unfocus();
//                         await signupViewModel.signup(signupReq);
//                         if (signupViewModel.signupApiResponse.status ==
//                             Status.COMPLETE) {
//                           SignupResponseModel response =
//                               signupViewModel.signupApiResponse.data;
//                           print('SIGNUP status ${response.success}');

//                           if (response.success == false) {
//                             hideLoadingDialog(context: context);

//                             Get.showSnackbar(GetSnackBar(
//                               backgroundColor: Color(0xffF2F3F2),
//                               duration: Duration(seconds: 2),
//                               snackPosition: SnackPosition.TOP,
//                               messageText: Text(
//                                 response.message.toString(),
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 18),
//                               ),
//                             ));
//                             return;
//                           }
//                           if (response.success == true) {
//                             print('valid');
//                             Get.showSnackbar(GetSnackBar(
//                               backgroundColor: Color(0xffF2F3F2),
//                               duration: Duration(seconds: 2),
//                               snackPosition: SnackPosition.TOP,
//                               messageText: Text(
//                                 response.message.toString(),
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 18),
//                               ),
//                             ));
//                             SharedPreferences pref =
//                                 await SharedPreferences.getInstance();
//                             pref.setString(PrefString.loggedIn, 'loggedIn');
//                             pref.setString(PrefString.address, '');
//                             pref.setString(PrefString.token,
//                                 response.data!.token.toString());
//                             pref.setInt('id', response.data!.user!.id!.toInt());

//                             var id = pref.getInt('id');
//                             print('*********************$id');
//                             pref.setString(PrefString.name,
//                                 response.data!.user!.name.toString());
//                             pref.setString(
//                                 PrefString.paymentCustomerId,
//                                 response.data!.user!.paymentCustomerId
//                                     .toString());
//                             pref.setString(PrefString.countryCode, '+91');
//                             pref.setString(PrefString.devicetype, ' ');
//                             pref.setString(PrefString.deviceToken, ' ');
//                             hideLoadingDialog(context: context);

//                             Get.offAll(HomePage());
//                           } else {
//                             hideLoadingDialog(context: context);

//                             print('invalid');
//                           }
//                         } else {
//                           hideLoadingDialog(context: context);

//                           Get.showSnackbar(GetSnackBar(
//                             backgroundColor: Color(0xffF2F3F2),
//                             duration: Duration(seconds: 2),
//                             snackPosition: SnackPosition.TOP,
//                             messageText: Text(
//                               'Server Error',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 18),
//                             ),
//                           ));
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
