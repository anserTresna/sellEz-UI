import 'package:flutter/material.dart';
import 'package:sellez_mobile/header_drawer.dart';
import 'package:sellez_mobile/LoginPage.dart';
import 'package:sellez_mobile/Supplier/Supplier.dart';

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
      )
    );
  }
}
