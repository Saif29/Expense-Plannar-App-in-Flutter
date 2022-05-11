import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transaction.isEmpty
          ? Column(
              children: [
                Text('No transactions added yet!'),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                            child: Text('PKR\n${transaction[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 450
                        ? TextButton.icon(
                            onPressed: () => deleteTx(transaction[index].id),
                            icon: Icon(Icons.delete),
                            label: Text("Delete"),
                            style: TextButton.styleFrom(
                                primary: Theme.of(context).errorColor),
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.delete,
                            ),
                            color: Theme.of(context).errorColor,
                            onPressed: () => deleteTx(transaction[index].id),
                          ),
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
