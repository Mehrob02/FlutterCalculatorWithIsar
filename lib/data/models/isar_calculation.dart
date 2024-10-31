import 'package:calculator/domain/models/calculation.dart';
import 'package:isar/isar.dart';
part 'isar_calculation.g.dart';

@collection
class CalculationIsar{
  late int id = DateTime.now().millisecondsSinceEpoch;
  late String propmt;
  late String result;
  late DateTime operationDateTime;

  Calculation toDomain(){
    return Calculation(id: id, propmt: propmt, result: result, operationDateTime: operationDateTime);
  }
  static CalculationIsar fromDomain(Calculation calculation){
    return CalculationIsar()
    ..id=calculation.id
    ..propmt=calculation.propmt
    ..result=calculation.result
    ..operationDateTime=calculation.operationDateTime;
  }
}