import 'package:flutter/material.dart';
import 'package:sellez_mobile/main.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sellez_mobile/header_drawer.dart';
import 'package:sellez_mobile/LoginPage.dart';
import 'package:sellez_mobile/kelolaproduk/KelolaProdukPage.dart';

class TambahProdukPage extends StatefulWidget {
  const TambahProdukPage({Key? key}) : super(key: key);

  @override
  State<TambahProdukPage> createState() => _TambahProdukPageState();
}

class _TambahProdukPageState extends State<TambahProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Tambah Produk"),
      ),
      body: Form(
        child: Container(
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 350),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    // add Nama Produk
                    if (value == null || value.isEmpty) {
                      return 'Tidak Boleh Kosong';
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nama Produk',
                    hintText: 'Masukan Nama Produk',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    // add Harga
                    if (value == null || value.isEmpty) {
                      return 'Tidak Boleh Kosong';
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Harga',
                    hintText: 'Masukan Harga',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    // Pilih merk
                    if (value == null || value.isEmpty) {
                      return 'Tidak Boleh Kosong';
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Pilih Merk',
                    hintText: 'Masukan Nama Merk',
                    prefixIcon: Icon(Icons.chevron_right),
                    border: OutlineInputBorder(),
                  ),
                ),

                // _gap(),
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
                      padding: EdgeInsets.all(16.0),
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
    );
  }
}
