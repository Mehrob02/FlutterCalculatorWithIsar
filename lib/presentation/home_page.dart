import 'package:calculator/domain/models/calculation.dart';
import 'package:calculator/presentation/cubit/calculation_cubit.dart';
import 'package:calculator/presentation/cubit/settings_cubit.dart';
import 'package:calculator/presentation/history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calculator/presentation/cubit/calculator_cubit.dart';
import 'widgets/button_toolbar_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationCubit, List<Calculation>>(
      builder: (context, calculationState) {
        return BlocBuilder<CalculatorCubit, CalculatorState>(
          builder: (context, calculatorState) {
            final CalculatorCubit calculatorCubit =
                context.read<CalculatorCubit>();
            final TextEditingController textEditingController =
                TextEditingController(text: calculatorState.prompt);
            final SettingsCubit settingsCubit = context.read<SettingsCubit>();
            final CalculationCubit calculationCubit =
                context.read<CalculationCubit>();
            return SafeArea(
                child: Scaffold(
              // backgroundColor: Colors.black, // Темная тема
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "SwiftCalc",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Colors.green),
                        ),
                        Row(
                          children: [
                            
                            IconButton(
      onPressed: () {
        settingsCubit.changeTheme(); // Изменение темы
      },
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300), // Длительность анимации
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: settingsCubit.state[isDarkModeKey] // Проверяем, темная ли тема
            ? const Icon(Icons.light_mode, key: ValueKey('SunIcon')) // Солнце для светлой темы
            : const Icon(Icons.dark_mode, key: ValueKey('MoonIcon')), // Луна для темной темы
      ),
    ),IconButton(
                              icon: Icon(Icons.history),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                     PageRouteBuilder(
                            reverseTransitionDuration: const Duration(milliseconds: 200),
                              pageBuilder: (context, animation, secondaryAnimation)=>HistoryPage(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                               const begin = Offset(1.0, 0.0); // Начало справа
                               const end = Offset.zero; // Конец в нормальном положении
                                const curve = Curves.ease;
                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                               return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                                    );
                                     }
                             ));
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Поле для результата
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.all(20.0),
                      child: SelectableText(
                        calculatorState.result,
                        style: const TextStyle(
                          fontSize: 48,
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  TextFormField(
                    readOnly: true,
                    style: const TextStyle(fontSize: 25),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    controller: textEditingController,
                    maxLines: null,
                    focusNode: FocusNode(),
                  ),
                  ButtonToolBarBuilder(
                    calculatorCubit: calculatorCubit,
                    calculationCubit: calculationCubit,
                  )
                ],
              ),
            ));
          },
        );
      },
    );
  }
}
