import 'package:flutter/material.dart';
import 'package:masenger_app/models/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<ModelApp> listmodels = listmodel();
  List images = [
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
  ];

  // دالة لتحديث مؤشر الصفحة المحددة
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/5.png'),
            ),
            SizedBox(width: 10),
            Text(
              'Chats',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: const [
          CircleAvatar(
            child: Icon(Icons.camera_alt),
            backgroundColor: Color.fromARGB(255, 220, 220, 220),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            child: Icon(Icons.edit_outlined),
            backgroundColor: Color.fromARGB(255, 220, 220, 220),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: images.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, item) {
                    return Padding(
                        padding: EdgeInsets.only(left: 9),
                        child: CircleAvatar(
                          radius: 42,
                          backgroundColor: Colors.blue,
                          child: CircleAvatar(
                            radius: 38,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(images[item]),
                            ),
                          ),
                        ),
                        );                 }),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              physics:
                  NeverScrollableScrollPhysics(), // تعطيل التمرير داخل ListView
              shrinkWrap: true,
              itemCount: listmodels.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage(listmodels[i % listmodels.length].image),
                    ),
                    title: Text(listmodels[i].name),
                    subtitle: Text(listmodels[i].hide),
                    trailing: listmodels[i].icon,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
