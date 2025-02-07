import 'package:app/models/currentUser.dart';
import 'package:app/models/transaction.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewTransactionModal extends StatefulWidget {
  final SocialIncomeTransaction _transaction;

  ReviewTransactionModal(this._transaction);

  @override
  State<ReviewTransactionModal> createState() => _ReviewTransactionModalState();
}

class _ReviewTransactionModalState extends State<ReviewTransactionModal> {
  List<String> _contestReasons = [
    "Phone stolen",
    "Incorrect amount",
    "Changed phone number",
    "Other reason"
  ];

  bool _contested = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUser>(builder: (context, currentUser, child) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
                  child: Text(
                    _contested
                        ? "What happened?"
                        : "Have you received your Social Income?",
                    textScaleFactor: 1.3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: _contested
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: _contestReasons.map((String reason) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: ElevatedButton(
                                onPressed: () {
                                  var transactionId = widget._transaction.id;
                                  if (transactionId != null) {
                                    currentUser.contestTransaction(
                                        transactionId, reason);
                                  }
                                  Navigator.pop(context);
                                },
                                child: Text(reason)),
                          );
                        }).toList(),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              var transactionId = widget._transaction.id;
                              if (transactionId != null) {
                                currentUser.confirmTransaction(transactionId);
                              }
                              Navigator.pop(context);
                            },
                            child: Text("YES"),
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(50, 50)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        siDarkBlue)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _contested = true;
                              });
                            },
                            child: Text("NO"),
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                    Size(50, 50)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red)),
                          ),
                        ],
                      ),
              ),
            ]),
      );
    });
  }
}
