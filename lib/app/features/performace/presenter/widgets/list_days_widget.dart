import 'package:flutter/material.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class ListPerfomaceDayWidget extends StatefulWidget {
  const ListPerfomaceDayWidget({Key? key}) : super(key: key);

  @override
  State<ListPerfomaceDayWidget> createState() => _ListPerfomaceDayWidgetState();
}

class _ListPerfomaceDayWidgetState extends State<ListPerfomaceDayWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<String> daysOfWeek = ['S', 'T', 'Q', 'Q', 'S', 'S', 'D'];

    return Scaffold(
      body: DefaultTabController(
        length: daysOfWeek.length,
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: size.height * 0.05, // Defina a altura desejada
                child: TabBar(
                  isScrollable: true, // Permite rolar horizontalmente
                  tabs: daysOfWeek
                      .map((day) => Container(
                            child: Center(
                              child: Text(
                                day,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            ),
                            width: size.width * 0.1, // Ajusta a largura do Tab
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ThemeColors.prymaryGreenColor,
                            ),
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: daysOfWeek
                      .map((day) => Container(
                            child: Center(
                              child: Text('Exercícios para o dia $day'),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
