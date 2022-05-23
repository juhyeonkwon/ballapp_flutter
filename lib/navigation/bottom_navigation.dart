import 'package:ballapp/screen/favorite/favorite_screen.dart';
import 'package:flutter/material.dart';
import '../screen/main/main_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    FavoriteScreen(),
    MainScreen(),
    FuckingWidget(),
    FuckingWidget(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => _widgetOptions.elementAt(_selectedIndex)),
      // );
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: '찜목록',
            tooltip: '찜목록'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline_outlined),
            activeIcon: Icon(Icons.bookmark),
            label: '스토어',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_laundry_service_outlined),
            activeIcon : Icon(Icons.local_laundry_service),
            label: '내세탁',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'MY',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black26,
        unselectedLabelStyle: const TextStyle(color: Colors.black26, fontSize: 8),
        selectedFontSize: 10,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,

      ),
    );
  }
}

class FuckingWidget extends StatelessWidget {
  const FuckingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text('We move under cover and we move as one'),
        const Text('Through the night, we have one shot to live another day'),
        const Text('We cannot let a stray gunshot give us away'),
        const Text('We will fight up close, seize the moment and stay in it'),
        const Text('It’s either that or meet the business end of a bayonet'),
        const Text('The code word is ‘Rochambeau,’ dig me?'),
        Text('Rochambeau!',
            style:
            DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0)),
      ],
    );
  }
}

class FuckingWidget2 extends StatelessWidget {
  const FuckingWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(children: const <Widget>[
        Text("dtdtdt"),
        Text("dtdtdt"),
        Text("dtdtdt"),
      ]),
    );
  }
}
