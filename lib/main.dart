import 'package:calculator/common/themes.dart';
import 'package:calculator/data/models/isar_calculation.dart';
import 'package:calculator/data/repository/isar_calculation_repo.dart';
import 'package:calculator/presentation/cubit/calculation_cubit.dart';
import 'package:calculator/presentation/cubit/calculator_cubit.dart';
import 'package:calculator/presentation/cubit/settings_cubit.dart';
import 'package:calculator/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(schemas: [CalculationIsarSchema], directory: dir.path);
  final isarCalculationRepo = IsarCalculationRepo(isar);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => CalculatorCubit()),
      BlocProvider(create: (_) => SettingsCubit()),
      BlocProvider(create: (_) => CalculationCubit(isarCalculationRepo))
    ],
    child: BlocBuilder<SettingsCubit, Map<String, dynamic>>(
      builder: (context, state) {
        return MaterialApp(
          theme: state[isDarkModeKey]?darkTheme:lightTheme,
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    ),
  ));
}
