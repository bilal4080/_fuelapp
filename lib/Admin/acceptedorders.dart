import 'package:flutter/material.dart';

class AcceptedOrdersScreen extends StatefulWidget {
  @override
  _AcceptedOrdersScreenState createState() => _AcceptedOrdersScreenState();
}

class _AcceptedOrdersScreenState extends State<AcceptedOrdersScreen> {
  List<String> acceptedOrders = [];

  void _acceptOrder(String order) {
    setState(() {
      acceptedOrders.add(order);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accepted Orders'),
      ),
      body: ListView.builder(
        itemCount: acceptedOrders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(acceptedOrders[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newOrder = '';

              return AlertDialog(
                title: Text('Add Accepted Order'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Order'),
                      onChanged: (value) {
                        newOrder = value;
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      setState(() {
                        acceptedOrders.add(newOrder);
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
