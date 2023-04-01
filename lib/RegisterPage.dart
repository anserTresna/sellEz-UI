import 'package:sellez_mobile/main.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:sellez_mobile/menubar/ResponsiveNavBarPage.dart';
import 'package:sellez_mobile/screen/OnBoardingPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordVisible = false;
  String? _selectedValue = 'Kafe & Coffee Shop';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  DropdownButtonFormField<String>(
                    value: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
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

                  _gap(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ResponsiveNavBarPage();
                          }));
                        }
                      },
                    ),
                  ),
                  _gap(),
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
