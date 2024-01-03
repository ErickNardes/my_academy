import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_academy/app/features/exercices/controller/exercice_controller.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final controller = Modular.get<ExerciceController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  label: Text('categoria'), border: OutlineInputBorder()),
              controller: controller.categoryController,
            ),
            TextField(
              decoration: InputDecoration(
                  label: Text('nome'), border: OutlineInputBorder()),
              controller: controller.nameController,
            ),
            TextField(
              decoration: InputDecoration(
                  label: Text('descrição'), border: OutlineInputBorder()),
              controller: controller.descriptionController,
            ),
            TextField(
              decoration: InputDecoration(
                  label: Text('dificuldade'), border: OutlineInputBorder()),
              controller: controller.difficultyController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {},
              child: Text('cadastrar'),
            )
          ],
        ),
      ),
    );
  }
}
