import 'package:flutter/material.dart';
import 'TambahSupplier.dart';


class Supplier extends StatefulWidget {
  const Supplier({Key? key}) : super(key: key);

  @override
  _SupplierState createState() => _SupplierState();
}

class _SupplierState extends State<Supplier> {
  bool _hasData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Supplier"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari nama supplier',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(16.0),
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            _hasData
                ? Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Supplier ${index + 1}'),
                        );
                      },
                    ),
                  )
                : Expanded(
                    flex: 1,
                    child: Center(
                      child: Image.asset('assets/images/No supplier.png'),
                    ),
                  ),
            
            
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TambahSupplier(),
                  ),
                );
              },
              child: Text('Tambah Supplier'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
