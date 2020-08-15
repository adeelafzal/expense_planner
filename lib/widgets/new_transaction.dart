import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  Function onPress;

  NewTransaction(this.onPress);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedtime;

  void submitData() {
    final enterTitle = titleController.text;
    final enterAmount = amountController.text;

    if (enterTitle.isEmpty || enterAmount.isEmpty || enterAmount == 0 || selectedtime==null) {
      return;
    }
    widget.onPress(enterTitle, double.parse(enterAmount),selectedtime);
  }

  void datePickerDialog() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        selectedtime = value;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_) => submitData,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Colors.purple)),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => submitData,
              decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: Colors.purple)),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text(selectedtime==null? 'No Date Chosen!': 'Picked Date: ${DateFormat.yMd().format(selectedtime)}'),
                FlatButton(
                  onPressed: () {
                    datePickerDialog();
                  },
                  child: Text('Choose Date',
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold)),
                )
              ],
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              color: Colors.purple,
              textColor: Colors.white,
              onPressed: () {
                submitData();
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
