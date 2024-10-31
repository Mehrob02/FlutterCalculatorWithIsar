import 'package:calculator/domain/models/calculation.dart';
import 'package:flutter/material.dart';

class HistoryOperationCard extends StatelessWidget {
  final Calculation calculation;
  final bool isSelected;
  final bool isSelectableMode;
  const HistoryOperationCard(
      {super.key,
      required this.calculation, this.isSelected=false, this.isSelectableMode=false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          calculation.propmt,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          calculation.result,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: isSelectableMode? AnimatedCrossFade(
          firstChild: Icon(Icons.check_circle_outline, color: Colors.green,), 
          secondChild: Icon(Icons.circle_outlined, color: Colors.green,), 
          crossFadeState: isSelected? CrossFadeState.showFirst:CrossFadeState.showSecond, 
          duration: Duration(milliseconds: 100)):SizedBox.shrink(),
      ),
    );
  }
}
