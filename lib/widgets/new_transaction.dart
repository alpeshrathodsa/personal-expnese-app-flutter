import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTxHandler;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTxHandler);

  void saveTx() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTxHandler(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => saveTx(),
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => saveTx(),
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            FlatButton(
              textColor: Colors.purple,
              child: Text('Add Transaction'),
              onPressed: saveTx,
            )
          ],
        ),
      ),
    );
  }
}
