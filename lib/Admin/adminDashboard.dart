import 'package:flutter/material.dart';

import 'fuelrates.dart';

class FuelAppDashboard extends StatefulWidget {
  @override
  _FuelAppDashboardState createState() => _FuelAppDashboardState();
}

class _FuelAppDashboardState extends State<FuelAppDashboard> {
  List<FuelStation> fuelStations = [
    FuelStation(name: 'Fuel Station 1', address: 'Address 1'),
    FuelStation(name: 'Fuel Station 2', address: 'Address 2'),
    FuelStation(name: 'Fuel Station 3', address: 'Address 3'),
    FuelStation(name: 'Fuel Station 4', address: 'Address 4'),
    FuelStation(name: 'Fuel Station 5', address: 'Address 5'),
  ];

  List<String> recentFuelOrders = [
    'Order 1',
    'Order 2',
    'Order 3',
    'Order 4',
    'Order 5',
  ];

  List<String> acceptedOrderList = [];

  void _deleteFuelStation(int index) {
    setState(() {
      fuelStations.removeAt(index);
    });
  }

  void _editFuelStation(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newName = fuelStations[index].name;
        String newAddress = fuelStations[index].address;

        return AlertDialog(
          title: Text('Edit Fuel Station'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  newName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Address'),
                onChanged: (value) {
                  newAddress = value;
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
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  fuelStations[index].name = newName;
                  fuelStations[index].address = newAddress;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteRecentFuelOrder(int index) {
    setState(() {
      recentFuelOrders.removeAt(index);
    });
  }

  void _editRecentFuelOrder(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newOrder = recentFuelOrders[index];

        return AlertDialog(
          title: Text('Edit Fuel Order'),
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
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  recentFuelOrders[index] = newOrder;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _addFuelStation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newName = '';
        String newAddress = '';

        return AlertDialog(
          title: Text('Add Fuel Station'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  newName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Address'),
                onChanged: (value) {
                  newAddress = value;
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
                  fuelStations
                      .add(FuelStation(name: newName, address: newAddress));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _acceptRecentFuelOrder(int index) {
    String acceptedOrder = recentFuelOrders[index];
    setState(() {
      acceptedOrderList.add(acceptedOrder);
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AcceptedOrdersScreen(acceptedOrderList: acceptedOrderList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fuel App'),
        backgroundColor: Colors.orange,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                'Admin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.check),
                title: Text('Fuel Rate'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminScreen()),
                  );
                }),
            Divider(
              thickness: 1,
              color: Colors.grey,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Accepted Orders'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AcceptedOrdersScreen(
                        acceptedOrderList: acceptedOrderList),
                  ),
                );
              },
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle logout feature
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'Fuel Stations',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Divider(
            thickness: 2,
            indent: 16,
            endIndent: 16,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: fuelStations.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(Icons.local_gas_station),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            fuelStations[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editFuelStation(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteFuelStation(index);
                          },
                        ),
                      ],
                    ),
                    subtitle: Text(
                      fuelStations[index].address,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    trailing: Text(
                      'Distance ${index + 1} km',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Recent Fuel Orders',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Divider(
            thickness: 2,
            indent: 16,
            endIndent: 16,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recentFuelOrders.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            recentFuelOrders[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.check_circle),
                          onPressed: () {
                            _acceptRecentFuelOrder(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editRecentFuelOrder(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteRecentFuelOrder(index);
                          },
                        ),
                      ],
                    ),
                    subtitle: Text(
                      'Date and time ${index + 1}',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    trailing: Text(
                      'Amount ${index + 1}',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _addFuelStation();
        },
        backgroundColor: Colors.orange,
      ),
    );
  }
}

class AcceptedOrdersScreen extends StatefulWidget {
  final List<String> acceptedOrderList;

  AcceptedOrdersScreen({required this.acceptedOrderList});

  @override
  _AcceptedOrdersScreenState createState() => _AcceptedOrdersScreenState();
}

class _AcceptedOrdersScreenState extends State<AcceptedOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accepted Orders'),
      ),
      body: ListView.builder(
        itemCount: widget.acceptedOrderList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(
                widget.acceptedOrderList[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FuelStation {
  String name;
  String address;

  FuelStation({required this.name, required this.address});
}

void main() {
  runApp(MaterialApp(
    home: FuelAppDashboard(),
  ));
}
