import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _namaPemilik;
  String? _nomorHp;
  String? _email;
  String? _password;
  String? _alamat;
  String? _namaUsaha;
  String? _kategoriUsaha;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        await FirebaseFirestore.instance.collection('users').add({
          'nama_pemilik': _namaPemilik,
          'nomor_hp': _nomorHp,
          'email': _email,
          'password': _password,
          'alamat': _alamat,
          'nama_usaha': _namaUsaha,
          'kategori_usaha': _kategoriUsaha,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data berhasil disimpan'),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Terjadi kesalahan saat menyimpan data: $e'),
          ),
        );
      }
    }
  }
bool _isPasswordVisible = false;
String? _selectedValue = 'Kafe & Coffee Shop';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(32.0),
            constraints: const BoxConstraints(maxWidth: 350),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Data Diri Pemilik Usaha",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  _gap(),
                  TextFormField(
                    onSaved: (value) => _namaPemilik = value,
                    validator: (value) {
                      // add Nama Pemilik
                      if (value == null || value.isEmpty) {
                        return 'Tidak Boleh Kosong';
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nama Pemilik',
                      hintText: 'Masukan Nama Pemilik',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  _gap(),
                  TextFormField(
                    onSaved: (value) => _nomorHp = value,
                    validator: (value) {
                      // add Nomor Hp
                      if (value == null || value.isEmpty) {
                        return 'Tidak Boleh Kosong';
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'No. Handphone',
                      hintText: 'Masukan Nomor Handphone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  _gap(),
                  TextFormField(
                    onSaved: (value) => _email = value,
                    validator: (value) {
                      // add Email
                      if (value == null || value.isEmpty) {
                        return 'Tidak Boleh Kosong';
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Masukan Email Anda',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  _gap(),
                  TextFormField(
                    onSaved: (value) => _password = value,
                    validator: (value) {
                      //add password
                      if (value == null || value.isEmpty) {
                        return 'Tidak Boleh Kosong';
                      }

                      if (value.length < 6) {
                        return 'Password harus memiliki 6 karakter';
                      }
                      return null;
                    },
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Masukan Pasword Anda',
                        // prefixIcon: const Icon(Icons.lock_outline_rounded),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        )),
                  ),
                  _gap(),
                  TextFormField(
                    onSaved: (value) => _alamat = value,
                    validator: (value) {
                      // add Alamat
                      if (value == null || value.isEmpty) {
                        return 'Tidak Boleh Kosong';
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Alamat',
                      hintText: 'Masukan Alamat Anda',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  _gap(),
                  //Data Usaha
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Data Diri Usaha",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  _gap(),
                  TextFormField(
                    onSaved: (value) => _namaUsaha = value,
                    validator: (value) {
                      // add Nama Pemilik
                      if (value == null || value.isEmpty) {
                        return 'Tidak Boleh Kosong';
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nama Usaha',
                      hintText: 'Masukan Nama Usaha',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  _gap(),
                  DropdownButtonFormField(
                    value: _selectedValue,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedValue = newValue.toString();
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: 'Kafe & Coffee Shop',
                        child: Text('Kafe & Coffee Shop'),
                      ),
                      DropdownMenuItem(
                        value: 'Restoran',
                        child: Text('Restoran'),
                      ),
                      DropdownMenuItem(
                        value: 'Katering',
                        child: Text('Katering'),
                      ),
                      DropdownMenuItem(
                        value: 'Roti, Kue, & Camilan',
                        child: Text('Roti, Kue, & Camilan'),
                      ),
                      DropdownMenuItem(
                        value: 'Makanan Segar',
                        child: Text('Makanan Segar'),
                      ),
                      DropdownMenuItem(
                        value: 'Minuman',
                        child: Text('Minuman'),
                      ),
                      DropdownMenuItem(
                        value: 'Toko Kelontong & Retail',
                        child: Text('Toko Kelontong & Retail'),
                      ),
                      DropdownMenuItem(
                        value: 'Minimarket',
                        child: Text('Minimarket'),
                      ),
                      DropdownMenuItem(
                        value: 'Olahraga & Hobi',
                        child: Text('Olahraga & Hobi'),
                      ),
                      DropdownMenuItem(
                        value: 'Toko Elektronik & Seluler',
                        child: Text('Toko Elektronik & Seluler'),
                      ),
                      DropdownMenuItem(
                        value: 'Butik, Pakaian & Aksesoris',
                        child: Text('Butik, Pakaian & Aksesoris'),
                      ),
                      DropdownMenuItem(
                        value: 'Vape Store',
                        child: Text('Vape Store'),
                      ),
                      DropdownMenuItem(
                        value: 'Furnitur & Bahan Bangunan',
                        child: Text('Furnitur & Bahan Bangunan'),
                      ),
                      DropdownMenuItem(
                        value: 'Laundry',
                        child: Text('Laundry'),
                      ),
                      DropdownMenuItem(
                        value: 'Printing',
                        child: Text('Printing'),
                      ),
                      DropdownMenuItem(
                        value: 'Lainnya',
                        child: Text('Lainnya'),
                      ),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Pilih Tipe Bisnis',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Daftar'),
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
