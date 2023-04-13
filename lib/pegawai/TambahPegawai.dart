import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TambahPegawai extends StatefulWidget {
  @override
  _TambahPegawaiState createState() => _TambahPegawaiState();
}

class _TambahPegawaiState extends State<TambahPegawai> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _genderList = ['Laki-Laki', 'Perempuan'];

  late String _nama, _noTelepon, _email, _gender = _genderList[0], _password;
  File? _image;
  final picker = ImagePicker();

  void showImagePicker() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  void showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.photo_library),
                  title: new Text('Pilih dari galeri'),
                  onTap: () {
                    showImagePicker();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('Daftar Pegawai'),
    );
  }

  Widget _buildAvatar() {
    return GestureDetector(
      onTap: () {
        showPicker(context);
      },
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: _image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  _image!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            : Icon(
                Icons.person,
                size: 100,
                color: Colors.grey,
              ),
      ),
    );
  }

  Widget _buildNama() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nama Lengkap'),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Nama tidak boleh kosong';
        }
        return null;
      },
      onSaved: (String? value) {
        _nama = value ?? '';
      },
    );
  }

  Widget _buildNoTelepon() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(labelText: 'Nomor Telepon'),
      validator: (String? value) {
        if (value?.isEmpty ?? true) {
          return 'Nomor Telepon tidak boleh kosong';
        }
        return null;
      },
      onSaved: (String? value) {
        _noTelepon = value ?? '';
      },
    );
  }


  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Email tidak boleh kosong';
        }
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return 'Email tidak valid';
        }
        return null;
      },
      onSaved: (String? value) {
        _email = value ?? '';
      },
    );
  }


  Widget _buildGender() {
    return DropdownButtonFormField(
      value: _gender,
      items: _genderList.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          _gender = value ?? '';
        });
      },
      decoration: InputDecoration(labelText: 'Jenis Kelamin'),
      validator: (value) =>
          value == null ? 'Jenis Kelamin tidak boleh kosong' : null,
      onSaved: (String? value) {
        _gender = value ?? '';
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Password'),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Password tidak boleh kosong';
        }
        if (value.length < 6) {
          return 'Password minimal 6 karakter';
        }
        return null;
      },

      onSaved: (String? value) {
        _password = value ?? '';
      },
    );
  }
  Widget _buildSubmitButton() {
    return ElevatedButton(
      key: Key('submit_button'),
      onPressed: () {
        if (!_formKey.currentState!.validate()) {
          return;
        }
        _formKey.currentState!.save();
        // TODO: save data to database or backend service
        print('Nama: $_nama');
        print('Nomor Telepon: $_noTelepon');
        print('Email: $_email');
        print('Jenis Kelamin: $_gender');
        print('Password: $_password');
      },
      child: Text('Daftar'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildAvatar(),
                SizedBox(height: 20.0),
                _buildNama(),
                _buildNoTelepon(),
                _buildEmail(),
                _buildGender(),
                _buildPassword(),
                SizedBox(height: 20.0),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


