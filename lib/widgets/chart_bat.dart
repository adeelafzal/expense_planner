import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  String label;
  double spendingAmount;
  double totalAmount;

  ChartBar(this.label, this.spendingAmount, this.totalAmount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height:20,child: FittedBox(child: Text('Rs ${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromARGB(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: totalAmount,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
