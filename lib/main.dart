import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  int selectedIndex = 0;

  buttonColor(int index) {
    selectedIndex = index;
    setState(() {});
  }

  showSnackBar(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Size: ${sizes[index]}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selector'),
      ),
      body: Center(
        child: Wrap(
          spacing: 8,
          children: [
            for (int i = 0; i < sizes.length; i++)
              ElevatedButton(
                onPressed: () {
                  buttonColor(i);
                  showSnackBar(i);
                },
                child: Text(
                  sizes[i],
                  style: TextStyle(
                    color: selectedIndex == i ? Colors.white : Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedIndex == i ? Colors.orange : Colors.grey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
