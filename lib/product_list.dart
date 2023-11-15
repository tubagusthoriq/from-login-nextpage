import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Map<String, dynamic>> dummyProducts = [
    {
      'name': 'Mobil',
      'jenis': 'Toyota Fortuner',
      'tahun': 2014,
      'price': 'IDR 509.950.000',
      'icon': Icons.star
    },
    {
      'name': 'Jasa',
      'jasa': 'Cuci Mobil',
      'price': 'IDR 100.000',
      'icon': Icons.person
    },
    {
      'name': 'Jasa',
      'jasa': 'Full Servis',
      'price': 'IDR 550.000',
      'icon': Icons.person
    },
    //menambahkan data
  ];

  bool isListVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WELCOME TO TBSHOWROOM',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.blue,
            ],
          ),
        ),
        //kolum untuk memasukan list
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isListVisible = true;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[800],
              ),
              child: Text('Show Products'),
            ),
            Visibility(
              visible: isListVisible,
              child: Card(
                margin: EdgeInsets.all(8.0),
                color: Colors.grey[800],
                child: Column(
                  children: [
                    for (var product in dummyProducts)
                      ExpansionTile(
                        tilePadding: EdgeInsets.all(8.0),
                        leading: Icon(
                          product['icon'],
                          color: Colors.white,
                        ),
                        title: Text(
                          product['name'],
                          style: TextStyle(color: Colors.white),
                        ),
                        children: [
                          if (product['jasa'] != null)
                            ListTile(
                              title: Text(
                                'Jasa: ${product['jasa']}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          if (product['jenis'] != null)
                            ListTile(
                              title: Text(
                                'Jenis: ${product['jenis']}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          if (product['tahun'] != null)
                            ListTile(
                              title: Text(
                                'Tahun: ${product['tahun']}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ListTile(
                            title: Text(
                              'Price: ${product['price']}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isListVisible = false;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[800],
              ),
              child: Text('Close'),
            ),
          ],
        ),
      ),
      //tombol logout
      floatingActionButton: Positioned(
        bottom: 16.0,
        right: 16.0,
        child: FloatingActionButton(
          onPressed: () {
            // Lakukan navigasi ke halaman awal
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          backgroundColor: Colors.black,
          child: Icon(Icons.logout),
        ),
      ),
    );
  }
}
