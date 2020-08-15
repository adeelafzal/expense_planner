import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Transaction> userTransactions = [
//    Transaction(
//        id: 't1', title: 'New Shoes', amount: '890', date: DateTime.now()),
//    Transaction(
//        id: 't2',
//        title: 'Weekly Groceries',
//        amount: '3500',
//        date: DateTime.now()),
//    Transaction(
//        id: 't3', title: 'Gym fees', amount: '1500', date: DateTime.now())
  ];

  List<Transaction> get recenTransaction{
    return userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days:7)),);
    }).toList();
  }

  void AddNewTask(String titletx, double Amounttx,DateTime dateTime) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: titletx,
        amount: Amounttx,
        date: dateTime);

    setState(() {
      userTransactions.add(newTransaction);
    });
  }

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) {
      return NewTransaction(AddNewTask);
    });
  }

void deleteTransaction(String id){
    setState(() {
      userTransactions.removeWhere((element) {
        return element.id == id;
      } );
    });
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Expense Planner'),
        ),
        body: Column(
          children: <Widget>[
            Chart(recenTransaction),
            TransactionList(userTransactions,deleteTransaction)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            startAddNewTransaction(context);
          },
          child: Icon(Icons.add),
          foregroundColor: Colors.white,
        ),
      );

  }
}
