import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseauth/provider/trades.dart';

class ListTrades extends StatefulWidget {
  const ListTrades({Key? key}) : super(key: key);

  @override
  _ListTradesState createState() => _ListTradesState();
}

class _ListTradesState extends State<ListTrades> {
  @override
  Widget build(BuildContext context) {
    // final tradeData = Provider.of<Trades>(context);
    final profit = Icon(FontAwesomeIcons.checkCircle, color: Colors.green);
    final loss = Icon(FontAwesomeIcons.timesCircle, color: Colors.red);

    return Consumer<Trades>(
      builder: (context, trades, child) {
        return Container(
          child: Card(
              child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: trades.trades[index].result == 'profit' ? profit : loss,
              title: Text(trades.trades[index].pair,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              subtitle: Row(
                children: [
                  Text(trades.trades[index].dateTime.day.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text("-",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text(trades.trades[index].dateTime.month.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text("-",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text(trades.trades[index].dateTime.year.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
              trailing: Icon(Icons.more_vert),
            ),
            itemCount: trades.trades.length,
          )),
        );
      },
    );
  }
}
