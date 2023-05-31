import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _editingController = TextEditingController();
   String? data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       appBar: AppBar(
        title: const Text(
          "Generator Qr Code",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
       ),
       body: Container(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            TextField(
              maxLength: 12,      
              decoration: InputDecoration(
                 hintStyle: const TextStyle(color: Colors.white , fontSize: 20 ,),
                 hintText: "Enter Data",
                 filled: true,
                 fillColor: Colors.black,
                 border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(50)
                  ),
                 contentPadding: const EdgeInsets.all(10),  
              ),
              controller: _editingController,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: (){
              setState(() {
                data = _editingController.text;
              });
            },
             child: const Text(
              'Generate QR'
             )
             ),
             const SizedBox(height: 10,),
             Center(
              child: QrImageView(
                data: "$data",
                version: QrVersions.auto,
                size: 200,
                )
             )
          ],
        ),
       ),
      ),
    );
  }
}