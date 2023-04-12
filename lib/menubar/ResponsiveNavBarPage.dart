import 'package:flutter/material.dart';

import 'package:sellez_mobile/header_drawer.dart';
import 'package:sellez_mobile/LoginPage.dart';
import 'package:sellez_mobile/Supplier/Supplier.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sellez_mobile/TransaksiPage/TransaksiPage.dart';
import 'package:sellez_mobile/kelolaproduk/KelolaProdukPage.dart';
import 'package:sellez_mobile/kelolaproduk/MenuKelolaProdukPage.dart';

class ResponsiveNavBarPage extends StatefulWidget {
  const ResponsiveNavBarPage({Key? key}) : super(key: key);

  @override
  _ResponsiveNavBarPageState createState() => _ResponsiveNavBarPageState();
}

class _ResponsiveNavBarPageState extends State<ResponsiveNavBarPage> {
  bool _isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF19A7CE),
      appBar: AppBar(
        backgroundColor: Color(0xFF19A7CE),
        title: const Text("Beranda"),
        elevation: 0,
      ),
      drawer: Scrollbar(
        thumbVisibility: true,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const MyHeaderDrawer(),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Beranda"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.inventory),
                title: const Text("Kelola Produk"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.monetization_on),
                title: const Text("Transaksi"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.search_rounded),
                title: const Text("Riwayat Transaksi"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_shipping),
                title: const Text("Supplier"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Supplier()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.money_off),
                title: const Text("Pengeluaran"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.people_alt_rounded),
                title: const Text("Pegawai"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.receipt_rounded),
                title: const Text("Laporan"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title:
                    _isLoggedIn ? const Text("Log Out") : const Text("Log In"),
                onTap: () {
                  Navigator.pop(context);
                  if (_isLoggedIn) {
                    // Lakukan logout
                    setState(() {
                      _isLoggedIn = false;
                    });
                  } else {
                    // fungsionalitas untuk login
                    // Navigasi ke LoginPage()
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                    // Lakukan login
                    // ...
                    setState(() {
                      _isLoggedIn = true;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: Scrollbar(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 17, 96, 118),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Laporan',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Alef',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Lihat semua',
                              style: TextStyle(
                                fontFamily: 'Alef',
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Penjualan Bulan Ini',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff393646)
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Rp 10.000.000',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[800],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Penjualan Hari Ini',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff393646)
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Rp 1.000.000',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[800],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xFFFEFCF3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/svg/inventory.svg',
                                    height: 30),
                                SizedBox(height: 8),
                                Text(
                                  'Kelola Produk',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff393646)
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/svg/transaction.svg',
                                    height: 30),
                                SizedBox(height: 8),
                                Text(
                                  'Transaksi',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff393646)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [                
                                SvgPicture.asset('assets/svg/staff.svg',
                                    height: 30),
                                SizedBox(height: 8),
                                Text(
                                  'Pegawai',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff393646)
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                  SizedBox(height: 20),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/banner.svg',
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
              ]),
            )     
          ],
        ),
      ),
    );

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Beranda"),
        ),
        drawer: Scrollbar(
          thumbVisibility: true,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const MyHeaderDrawer(),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Beranda"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.inventory),
                  title: const Text("Kelola Produk"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MenuKelolaProdukPage();
                    }));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.monetization_on),
                  title: const Text("Transaksi"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.search_rounded),
                  title: const Text("Riwayat Transaksi"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.local_shipping),
                  title: const Text("Supplier"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.money_off),
                  title: const Text("Pengeluaran"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.people_alt_rounded),
                  title: const Text("Pegawai"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.receipt_rounded),
                  title: const Text("Laporan"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: _isLoggedIn
                      ? const Text("Log Out")
                      : const Text("Log In"),
                  onTap: () {
                    Navigator.pop(context);
                    if (_isLoggedIn) {
                      // Lakukan logout
                      setState(() {
                        _isLoggedIn = false;
                      });
                    } else {
                      // fungsionalitas untuk login
                      // Navigasi ke LoginPage()
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                      // Lakukan login
                      // ...
                      setState(() {
                        _isLoggedIn = true;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
