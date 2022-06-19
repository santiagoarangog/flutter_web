import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  final PageController pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* App Bar
      appBar: AppBar(
        title: Text('Home'),
        elevation: 10,
        backgroundColor: Colors.blueAccent,
        shadowColor: Colors.blue,
      ),

      //* Page View
      body: PageView(
        controller: this.pageController,
        children: [
          CustomScreen(color: Colors.black38),
          CustomScreen(color: Colors.green)
        ],
      ),
      //* Tabs
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          this.currentPage = index;

          pageController.animateToPage(index,
              duration: Duration(milliseconds: 900), curve: Curves.easeOut);

          setState(() {});
        },
        selectedItemColor: Colors.black38,
        unselectedItemColor: Colors.blueAccent.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }
}

class CustomScreen extends StatelessWidget {
  final Color color;

  const CustomScreen({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.color,
      child: Center(
        child: Text('Custom Element'),
      ),
    );
  }
}
