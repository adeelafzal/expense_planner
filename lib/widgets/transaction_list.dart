import 'package:flutter/material.dart';
import 'package:expense_planner/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> userTransactions;
  Function onDelete;

  TransactionList(this.userTransactions,this.onDelete);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: FittedBox(
                      child: Text(
                          'Rs.${userTransactions[index].amount.toStringAsFixed(0)}')),
                ),
              ),
              title: Text(
                userTransactions[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(userTransactions[index].date),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  onDelete(userTransactions[index].id);
                },
                color: Colors.red,
              ),
            ),
          );
        },
        itemCount: userTransactions.length,
      ),
    );
  }
}
