import 'package:calculator/domain/models/calculation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repository/calculation_repo.dart';

class CalculationCubit extends Cubit<List<Calculation>> {
  final CalculationRepo calculationRepo;
  CalculationCubit(this.calculationRepo) : super([]){
    loadCalculations();
  }
 Future<void> loadCalculations()async{
    final calculationList = await calculationRepo.getCalculations();
    emit(calculationList);
  }
  Future<void>addCalculation(String prompt, String result)async{
    final newCalculation = Calculation(id: DateTime.now().millisecondsSinceEpoch, propmt: prompt, result: result, operationDateTime: DateTime.now());
    await calculationRepo.addCalculation(newCalculation);
    loadCalculations();
  }
  Future<void>deleteCalculation(Calculation calculation)async{
    await calculationRepo.deleteCalculation(calculation);
    loadCalculations();
  }
  Future<void>deleteAllCalculation()async{
    await calculationRepo.deleteAllCalculation();
    loadCalculations();
  }
}