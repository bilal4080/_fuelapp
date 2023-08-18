import 'package:app/user/success.dart';
import 'package:flutter/material.dart';

class Paymet_next extends StatefulWidget {
  final String fuelType;
  final double fuelAmount;

  Paymet_next({required this.fuelType, required this.fuelAmount});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<Paymet_next> {
  bool isCashOnDeliverySelected = false;
  bool isEasypaisaSelected = false;

  double getTotalCost() {
    //cost fuel ki
    double costPerLiter = 1;
    return widget.fuelAmount * costPerLiter * 273;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.local_gas_station,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.fuelType,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      ' Liters: ${widget.fuelAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Cost:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${getTotalCost().toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 100,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  ' Delivery Address',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose Payment Method',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Radio(
                              value: true,
                              groupValue: isCashOnDeliverySelected,
                              onChanged: (value) {
                                setState(() {
                                  isCashOnDeliverySelected = value as bool;
                                  isEasypaisaSelected = !value;
                                });
                              },
                              activeColor: Colors.orange,
                            ),
                            title: Text('Cash on Delivery'),
                          ),
                          ListTile(
                            leading: Radio(
                              value: true,
                              groupValue: isEasypaisaSelected,
                              onChanged: (value) {
                                setState(() {
                                  isEasypaisaSelected = value as bool;
                                  isCashOnDeliverySelected = !value;
                                });
                              },
                              activeColor: Colors.orange,
                            ),
                            title: Text('Easypaisa'),
                          ),
                          if (isEasypaisaSelected)
                            Text('We are working on it to Ease your assuarnce'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: getTotalCost() > 0
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Sucess()),
                          );
                          // Proceed button functionality
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: getTotalCost() > 0 ? Colors.orange : Colors.grey,
                  ),
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
