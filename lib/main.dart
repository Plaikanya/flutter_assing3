import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller to retrieve the current value of the TextField.
  final myController = TextEditingController();
  String errorText = ''; // ตัวแปรสำหรับเก็บข้อความ error

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: myController,
              decoration: InputDecoration(
                hintText: 'Enter your text',
                errorText: errorText.isEmpty ? null : errorText, // แสดงข้อความ error ถ้ามี
              ),
            ),
            const SizedBox(height: 8), // เพิ่มระยะห่างระหว่าง TextField กับข้อความ
          ],
        ),
      ),
      // ปุ่ม Submit อยู่ที่มุมล่างซ้ายของหน้าจอ
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 16.0), // ระยะห่างจากขอบ
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              // ตรวจสอบว่า TextField ว่างหรือไม่
              if (myController.text.isEmpty) {
                errorText = 'Please Enter your text'; // ถ้าว่างแสดงข้อความ error
              } else {
                errorText = ''; // ถ้ามีข้อความให้ล้างข้อความ error
                // ถ้ามีข้อความใน TextField แสดง Dialog
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(myController.text),
                    );
                  },
                );
              }
            });
          },
          tooltip: 'Show me the value!',
          child: const Icon(Icons.text_fields),
        ),
      ),
    );
  }
}
