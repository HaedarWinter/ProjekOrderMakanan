import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Meja Restoran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderMejaScreen(),
    );
  }
}

class OrderMejaScreen extends StatefulWidget {
  @override
  _OrderMejaScreenState createState() => _OrderMejaScreenState();
}

class _OrderMejaScreenState extends State<OrderMejaScreen> {
  List<String> tables = ['Meja 1', 'Meja 2', 'Meja 3', 'Meja 4'];
  String? selectedTable;
  String customerName = '';

  void _orderTable() {
    if (selectedTable != null && customerName.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Pemesanan Berhasil'),
            content: Text('Nama: $customerName\nMeja: $selectedTable'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Menampilkan pesan kesalahan jika data tidak lengkap
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Kesalahan'),
            content: Text('Silakan masukkan nama pelanggan dan pilih meja.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order Meja Restoran'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Nama Pelanggan:',
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      customerName = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan nama pelanggan',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Pilih Meja:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                DropdownButton<String>(
                  hint: Text('Pilih Meja'),
                  value: selectedTable,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTable = newValue;
                    });
                  },
                  items: tables.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _orderTable,
                  child: Text('Pesan Meja'),
                ),
              ],
            ),
            ),
        );
    }
}

