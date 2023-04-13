import 'package:flutter/material.dart';
import 'package:sellez_mobile/main.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sellez_mobile/header_drawer.dart';
import 'package:sellez_mobile/LoginPage.dart';
import 'package:sellez_mobile/tambahprodukpage/TambahProdukPage.dart';

class KelolaProdukPage extends StatefulWidget {
  const KelolaProdukPage({Key? key}) : super(key: key);

  @override
  State<KelolaProdukPage> createState() => _KelolaProdukPageState();
}

class _KelolaProdukPageState extends State<KelolaProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Kelola Produk"),
        elevation: 0,
      ),
      body: Form(
        child: Center(
          child: Container(
            // padding: const EdgeInsets.all(32.0),
            constraints: const BoxConstraints(maxWidth: 350),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/box-kelolaproduk.png',
                    width: 310,
                    height: 269,
                  ),
                  _gap(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Kamu Belum Ada Produk :(",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Pilih “Tambah Produk” untuk menambahkan produk kamu ke dalam inventori",
                      style: Theme.of(context).textTheme.caption,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _gap(),
                  _gap(),
                  _gap(),
                  _gap(),
                  _gap(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        primary: Colors.blue,
                        onPrimary: Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Tambah Produk',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return TambahProdukPage();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
