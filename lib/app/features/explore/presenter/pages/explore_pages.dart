import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:my_academy/app/features/explore/presenter/controller/explore_controller.dart';

class ExplorePage extends StatefulWidget {
  final ExploreController exploreController;
  const ExplorePage({
    Key? key,
    required this.exploreController,
  }) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.exploreController.state.listCategory.length,
          itemBuilder: (context, index) {
            final category = widget.exploreController.state.listCategory[index];
            return InkWell(
              onTap: () async {
                widget.exploreController.selectedCategory(category.name);
                await widget.exploreController.getListExercicesWithCategory(
                    '${category.name[0].toUpperCase()}${category.name.substring(1)}');
                Modular.to.pushNamed('/list_exercice_with_category');
              },
              child: SizedBox(
                width: size.width,
                child: Stack(
                  children: [
                    Image.asset(
                      widget.exploreController.generateImageCategory(
                        category.name,
                      ),
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 20,
                      bottom: 10,
                      child: Text(
                        category.name.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.06,
                            fontFamily: 'Lato-Bold'),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
