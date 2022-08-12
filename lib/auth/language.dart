// // ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:ogas/main.dart';
// import 'package:ogas/widgets/background.dart';
// import 'package:ogas/utils/language_constants.dart';
// import 'package:ogas/utils/language.dart';

// import '../widgets/custom_textfield.dart';

// class LanguagePage extends StatefulWidget {
//   LanguagePage({Key? key}) : super(key: key);

//   @override
//   State<LanguagePage> createState() => _LanguagePageState();
// }

// class _LanguagePageState extends State<LanguagePage> {
//   int? ggvalue = 0;
//   Language? language;

//   @override
//   Widget build(BuildContext context) {
//     return Background(
//       imagename: "asset/icons/drawerList_icon/leftarrow2x.png",
//       text: "LANGUAGE",
//       onTap: () {
//         Navigator.pop(context);
//       },
//       child: Container(
//         padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
//         child: Column(
//           children: [
//             LanguageModel(
//               lname: "English",
//               hisize: 50,
//               wisize: 340,
//               onnTap: (() async {
//                 ggvalue = 0;
//                 Locale _locale = await setLocale(ENGLISH);
//                 MyApp.setLocale(context, _locale);
//                 setState(() {});
//               }),
//               lansize: 15,
//               gvalue: ggvalue,
//               vvalue: 0,
//               borderr: ggvalue == 0
//                   ? Border.all(color: const Color(0xffF58823), width: 1.5)
//                   : null,
//               lonChanged: (value) {
//                 setState(() {
//                   ggvalue = 0;
//                 });
//               },
//             ),
//             SizedBox(height: 15),
//             LanguageModel(
//               lname: "عَمّان",
//               onnTap: () async {
//                 ggvalue = 1;
//                 Locale _locale = await setLocale(ARABIC);
//                 MyApp.setLocale(context, _locale);
//                 setState(() {});
//               },
//               hisize: 50,
//               wisize: 340,
//               lansize: 15,
//               gvalue: ggvalue,
//               vvalue: 1,
//               borderr: ggvalue == 1
//                   ? Border.all(color: const Color(0xffF58823), width: 1.5)
//                   : null,
//               lonChanged: (value) {
//                 setState(() {
//                   ggvalue = 1;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
