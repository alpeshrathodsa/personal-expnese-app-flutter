import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  TransactionList(this.transactionList);

  @override
  Widget build(BuildContext context) {
    return transactionList.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No transaction added yet.',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ))
            ],
          )
        : ListView.builder(
            itemBuilder: (_, index) {
              return Card(
                elevation: 6,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$ ${transactionList[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transactionList[index].title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          DateFormat('dd-MM-yyyy')
                              .format(transactionList[index].date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            itemCount: transactionList.length,
          );
  }
}
