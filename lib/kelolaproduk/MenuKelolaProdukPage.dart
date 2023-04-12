import 'package:flutter/material.dart';
import 'package:sellez_mobile/main.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sellez_mobile/header_drawer.dart';
import 'package:sellez_mobile/LoginPage.dart';
import 'package:sellez_mobile/tambahprodukpage/TambahProdukPage.dart';
import 'package:sellez_mobile/kelolaproduk/KelolaProdukPage.dart';

class MenuKelolaProdukPage extends StatefulWidget {
  const MenuKelolaProdukPage({Key? key}) : super(key: key);

  @override
  State<MenuKelolaProdukPage> createState() => _MenuKelolaProdukPageState();
}

class _MenuKelolaProdukPageState extends State<MenuKelolaProdukPage> {
  final controller = TextEditingController();
  String? _selectedValue = 'Kategori';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Kelola Produk"),
      ),
      body: Form(
        child: Container(
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 350),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'Kategori',
                      child: Text('Kategori'),
                    ),
                    DropdownMenuItem(
                      value: 'Makanan',
                      child: Text('Makanan'),
                    ),
                    DropdownMenuItem(
                      value: 'Minuman',
                      child: Text('Minuman'),
                    ),
                    DropdownMenuItem(
                      value: 'Pakaian',
                      child: Text('Pakaian'),
                    ),
                    DropdownMenuItem(
                      value: 'Lainnya',
                      child: Text('Lainnya'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    // hintText: 'Kategori',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Cari Produk',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/kuepie.png',
                                height: 56,
                                width: 70,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Kue Pie',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    SizedBox(width: 90),
                                    Text(
                                      'Stok',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Rp. 3000',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(width: 100),
                                    Text(
                                      '20',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
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

  Widget _gap() => const SizedBox(height: 150);
}
