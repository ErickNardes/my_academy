// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:my_academy/app/features/exercices/controller/exercice_controller.dart';
import 'package:my_academy/app/features/exercices/presenter/widgets/card_popularity_widget.dart';
import 'package:my_academy/app/features/home/presenter/widgets/custom_bottom_navbar_widget.dart';
import 'package:my_academy/app/features/home/presenter/widgets/custom_search_home_widget.dart';
import 'package:my_academy/app/features/login/presenter/controller/login_controller.dart';

class HomePage extends StatefulWidget {
  final LoginController loginController;
  final ExerciceController exerciceController;
  const HomePage({
    Key? key,
    required this.loginController,
    required this.exerciceController,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    widget.exerciceController.getListExercices();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Boa Noite',
                    style: TextStyle(
                      fontFamily: 'Lato-Bold',
                      fontSize: size.width * 0.06,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  SvgPicture.asset(
                    'lib/assets/icons/fire_icon.svg',
                    width: size.width * 0.06,
                  )
                ],
              ),
              SizedBox(
                height: size.width * 0.02,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.055),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.loginController.state.userModelAuth.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lato-Bold',
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.05),
                ),
              ),
              SizedBox(
                height: size.width * 0.07,
              ),
              CustomSearchHomeWidget(
                controller: widget.exerciceController,
              ),
              SizedBox(
                height: size.width * 0.07,
              ),
              Text(
                'Treinos Populares',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.05,
                ),
              ),
              SizedBox(
                height: size.width * 0.07,
              ),
              ScopedBuilder(
                  store: widget.exerciceController,
                  onState: (context, _) {
                    return SizedBox(
                      height: size.height * 0.3,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget
                              .exerciceController.state.listExercices.length,
                          itemBuilder: (context, index) {
                            final exercice = widget
                                .exerciceController.state.listExercices[index];
                            return CardPopularityWidget(
                                exerciceModel: exercice);
                          }),
                    );
                  })
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavBarWidget(),
    );
  }
}
