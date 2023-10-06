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
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: sizes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2
              ), itemBuilder: (_, index){
                return ElevatedButton(
                    onPressed: () {
                      buttonColor(index);
                      showSnackBar(index);
                    },
                    child: Text(
                      sizes[index],
                      style: TextStyle(
                        color: selectedIndex == index ? Colors.white : Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedIndex == index ? Colors.orange : Colors.grey,
                    ),
                  );
            }),
          ],
        ),
      ),
    );
  }
}