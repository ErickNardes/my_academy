// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:my_academy/app/features/exercices/controller/exercice_controller.dart';

class CustomSearchHomeWidget extends StatefulWidget {
  final ExerciceController controller;
  const CustomSearchHomeWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomSearchHomeWidget> createState() => _CustomSearchHomeWidgetState();
}

class _CustomSearchHomeWidgetState extends State<CustomSearchHomeWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: SizedBox(
        height: size.height * 0.06,
        child: TextFormField(
          onChanged: (value) {
            widget.controller.getListExercices();
          },
          controller: widget.controller.filterExercice,
          decoration: InputDecoration(
            hoverColor: Colors.red,
            focusColor: Colors.red,
            fillColor: Colors.white,
            filled: true,
            labelText: 'Pesquisar',
            prefixIcon: const Icon(Icons.search_outlined),
            prefixIconColor: Colors.grey,
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Colors.white), // Cor das bordas
              borderRadius: BorderRadius.circular(22),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(22),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
      ),
    );
  }
}
