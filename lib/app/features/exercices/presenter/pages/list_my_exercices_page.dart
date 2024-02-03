// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import 'package:my_academy/app/features/exercices/controller/exercice_controller.dart';
// import 'package:my_academy/app/features/home/presenter/widgets/custom_bottom_navbar_widget.dart';
// import 'package:my_academy/app/features/login/presenter/controller/login_controller.dart';

// class ListMyExercicesPage extends StatefulWidget {
//   final LoginController loginController;
//   final ExerciceController exerciceController;
//   const ListMyExercicesPage({
//     Key? key,
//     required this.loginController,
//     required this.exerciceController,
//   }) : super(key: key);

//   @override
//   State<ListMyExercicesPage> createState() => _ListMyExercicesPageState();
// }

// class _ListMyExercicesPageState extends State<ListMyExercicesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: TabBar(tabs: []),
//       bottomNavigationBar: CustomNavBarWidget(
//         loginController: widget.loginController,
//         exerciceController: widget.exerciceController,
//       ),
//     );
//   }
// }
