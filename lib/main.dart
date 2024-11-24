import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DatabasePage(),
    );
  }
}

class DatabasePage extends StatefulWidget {
  const DatabasePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DatabasePageState createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  List<String> _data = [];
  bool _isLoading = false;

  Future<void> _fetchDataFromDatabase() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _data = [
          'Item 1 from Database',
          'Item 2 from Database',
          'Item 3 from Database',
          'Item 4 from Database',
          'Item 5 from Database',
        ];
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulated Database Query'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : _data.isEmpty
                ? ElevatedButton(
                    onPressed: _fetchDataFromDatabase,
                    child: const Text('Fetch Data from Database'),
                  )
                : ListView.builder(
                    itemCount: _data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_data[index]),
                      );
                    },
                  ),
      ),
    );
  }
}