import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  TextEditingController _dieselPriceController = TextEditingController();
  TextEditingController _petrolPriceController = TextEditingController();
  TextEditingController _gasPriceController = TextEditingController();

  double _dieselPrice = 0.0;
  double _petrolPrice = 0.0;
  double _gasPrice = 0.0;

  void _saveFuelPrices() {
    setState(() {
      _dieselPrice = double.parse(_dieselPriceController.text);
      _petrolPrice = double.parse(_petrolPriceController.text);
      _gasPrice = double.parse(_gasPriceController.text);
      // Save the fuel prices to your storage mechanism (e.g., database or shared preferences)
    });
  }

  @override
  void dispose() {
    _dieselPriceController.dispose();
    _petrolPriceController.dispose();
    _gasPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _dieselPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Diesel Price',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _petrolPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Petrol Price',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _gasPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Gas Price',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 6.0),
            ElevatedButton(
              onPressed: _saveFuelPrices,
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                minimumSize: Size(400, 40),
              ),
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Current Fuel Prices:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide()),
                    ),
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: TextFormField(
                      controller: TextEditingController(text: '$_dieselPrice'),
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: 'Diesel Price',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide()),
                    ),
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: TextFormField(
                      controller: TextEditingController(text: '$_petrolPrice'),
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: 'Petrol Price',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: TextEditingController(text: '$_gasPrice'),
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Gas Price',
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
