// // ignore_for_file: prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings, must_be_immutable, use_build_context_synchronously, no_leading_underscores_for_local_identifiers
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gopay_app/utils/loading.dart';
// import 'package:gopay_app/viewModel/login_view_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// bool login = true;

// class SignUpScreen extends StatefulWidget {
//   bool sign = true;

//   SignUpScreen({Key? key, required this.sign}) : super(key: key);

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   LoginViewModel loginViewModel = Get.find();
//   // LoginRequestModel loginReq = LoginRequestModel();
//   // LoginResponseModel loginRes = LoginResponseModel();

//   String code = '';
//   String countryCodes = '';

//   signin({
//     @required BuildContext? context,
//     @required String? phone,
//   }) async {
//     print(" -=-=-=-= Start signup function =-=-=-=-");
//     await SharedPreferences.getInstance();
//     bool isSuccess = false;
//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     try {
//       print("-=-=-=-= Start creating user to auth =-=-=-=-");
//       await _auth.verifyPhoneNumber(
//         phoneNumber: phone!,
//         timeout: Duration(seconds: 90),
//         verificationCompleted: (phoneAuthCredential) async {},
//         verificationFailed: (verificationFailed) async {
//           print("---------------verificationFailed----------------");
//           Get.showSnackbar(GetSnackBar(
//             backgroundColor: Color(0xffF2F3F2),
//             duration: Duration(seconds: 2),
//             snackPosition: SnackPosition.TOP,
//             messageText: Text(
//               'phoneNumber Verification Failed please check phoneNumber',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//           ));
//         },
//         codeSent: (verificationId, [resendingToken]) async {
//           print("----------------codeSent----------------");
//           hideLoadingDialog(context: context);

//           // Navigator.of(context!).push(MaterialPageRoute(
//           //     builder: (context) => OtpVarification(
//           //           code: '',
//           //           varificationId: verificationId,
//           //         )));
//         },
//         codeAutoRetrievalTimeout: (verificationId) async {
//           print("---------------OTP_TimeOut----------------");
//         },
//       );
//     } catch (e) {
//       print("Error --- $e");
//     }

//     print("End signup function");
//     return isSuccess;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height + 100,
//             width: MediaQuery.of(context).size.width,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xffFBB941),
//                   Color(0xffF58823),
//                   Color(0xffF58823),
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//             child: Column(
//               children: [

//                 Container(
//                   height: 190,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("asset/gascylinderback.png"),
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Spacer(),
//                       Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Text(
//                           widget.sign == true
//                               // ? AppLocalizations.of(context)!.createYourAccount
//                               // : AppLocalizations.of(context)!.signInText,
//                               ? 'createYourAccount'
//                               : 'signInText',
//                           style: const TextStyle(
//                             fontSize: 35,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height - 190,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(40),
//                           topRight: Radius.circular(40)),
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.all(35),
//                           height: 120,
//                           width: 120,
//                           decoration: const BoxDecoration(
//                             // color:Color(0xffF58823),
//                             image: DecorationImage(
//                                 image: AssetImage("asset/icons/create.png"),
//                                 fit: BoxFit.cover),
//                           ),
//                         ),
//                         CustomTextField(
//                           prefixIcon: SizedBox(
//                             height: 20,
//                             child: CountryCodePicker(
//                               padding: EdgeInsets.only(bottom: 3),
//                               initialSelection: '+91',
//                               favorite: ['+91', '+1'],
//                               textStyle: TextStyle(color: Colors.orange[900]),
//                               showFlag: true,
//                               showFlagDialog: true,
//                               onChanged: (CountryCode countryCode) {
//                                 countryCodes = countryCode.toString();
//                                 setState(() {});
//                                 print("New Country selected: " +
//                                     countryCode.toString());
//                               },
//                             ),
//                           ),
//                           controller: _phoneController,
//                           hintText: '+968 955 556 98',
//                           name: AppLocalizations.of(context)!.phoneNumber,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return AppLocalizations.of(context)!
//                                   .phoneNumberValidation;
//                             }
//                           },
//                           keyboardType: TextInputType.number,
//                         ),
//                         const SizedBox(height: 20),
//                         widget.sign == true
//                             ? CustomTextField(
//                                 controller: _emailController,
//                                 hintText: 'example@gmail.com',
//                                 validator: (value) {
//                                   if (!value!.contains("@") ||
//                                       !value.contains(".")) {
//                                     return AppLocalizations.of(context)!
//                                         .validEmail;
//                                   }
//                                   if (value.isEmpty) {
//                                     return AppLocalizations.of(context)!
//                                         .emptyEmail;
//                                   }
//                                 },
//                                 name:
//                                     AppLocalizations.of(context)!.emailAddress,
//                                 keyboardType: TextInputType.emailAddress,
//                               )
//                             : SizedBox(),
//                         const SizedBox(height: 50),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: const Size(200, 50),
//                             primary: const Color(0xff1C75BC),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                           ),
//                           onPressed: () async {
//                             if (_formKey.currentState!.validate()) {
//                               showLoadingDialog(context: context);

//                               SharedPreferences pref =
//                                   await SharedPreferences.getInstance();
//                               pref.setString(PrefString.phoneNumber,
//                                   _phoneController.text);
//                               pref.setString(
//                                   PrefString.email, _emailController.text);
//                               if (widget.sign == true) {
//                                 login = false;
//                                 setState(() {});

//                                 signin(
//                                     context: context,
//                                     phone:
//                                         countryCodes + _phoneController.text);
//                               } else {
//                                 login = true;
//                                 setState(() {});
//                                 loginReq.mobile = _phoneController.text;
//                                 FocusScope.of(context).unfocus();
//                                 await loginViewModel.login(loginReq);
//                                 if (loginViewModel.loginApiResponse.status ==
//                                     Status.COMPLETE) {
//                                   LoginResponseModel response =
//                                       loginViewModel.loginApiResponse.data;
//                                   print('LOGIN status ${response.success}');

//                                   if (response.success == false) {
//                                     hideLoadingDialog(context: context);

//                                     Get.showSnackbar(GetSnackBar(
//                                       backgroundColor: Color(0xffF2F3F2),
//                                       duration: Duration(seconds: 2),
//                                       snackPosition: SnackPosition.TOP,
//                                       messageText: Text(
//                                         response.message.toString(),
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 18),
//                                       ),
//                                     ));
//                                     return;
//                                   }
//                                   if (response.success == true) {
//                                     print('valid');
//                                     SharedPreferences pref =
//                                         await SharedPreferences.getInstance();
//                                     pref.setString(
//                                         PrefString.loggedIn, 'loggedIn');
//                                     pref.setString(PrefString.address, '');
//                                     pref.setString(PrefString.token,
//                                         response.data!.token.toString());
//                                     pref.setString(
//                                         PrefString.paymentCustomerId,
//                                         response.data!.user!.paymentCustomerId
//                                             .toString());
//                                     pref.setInt(
//                                         'id', response.data!.user!.id!.toInt());

//                                     var id = pref.getInt('id');
//                                     print('*********************$id');
//                                     pref.setString(PrefString.name,
//                                         response.data!.user!.name.toString());
//                                     pref.setString(PrefString.email,
//                                         response.data!.user!.email.toString());

//                                     pref.setString(
//                                         PrefString.countryCode, '+91');
//                                     pref.setString(PrefString.devicetype, ' ');
//                                     pref.setString(PrefString.deviceToken, ' ');
//                                     signin(
//                                         context: context,
//                                         phone: '+91' + _phoneController.text);
//                                   } else {
//                                     hideLoadingDialog(context: context);
//                                     print('invalid');
//                                   }
//                                 }
//                               }
//                             }
//                           },
//                           child: Text(
//                             AppLocalizations.of(context)!.getOtp,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 17,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Column(
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   widget.sign == true
//                                       ? "Already have account?"
//                                       : "Don't have account",
//                                   style: const TextStyle(
//                                     color: ColorConstants.grey,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       widget.sign = !widget.sign;
//                                       login = !login;
//                                       print(login);
//                                     });
//                                   },
//                                   child: Text(
//                                     widget.sign == true ? "SignIn" : "Signup",
//                                     style: const TextStyle(
//                                       color: Color(0xff212121),
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
              
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   String? validateMobile(String? value) {
//     if (value!.isEmpty) {
//       return "Number cannot be empty";
//     } else if (value.length < 10) {
//       return "Number length should be atleast 10";
//     }
//     return null;
//   }
// }
