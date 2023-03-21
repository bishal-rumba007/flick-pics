import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/home_page.dart';
import 'package:movie_app/screens/search/search_page.dart';
import 'package:movie_app/screens/watch_list/watch_list_page.dart';
import 'package:movie_app/utils/color_manager.dart';



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List<Widget> screenList = [const HomePage(), const SearchMoviePage(), const WatchListPage() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Stack(
        children: [
          screenList.elementAt(currentIndex),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BottomNavigationBar(
                  currentIndex: currentIndex,
                    backgroundColor: Colors.black,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: ColorManager.iconGray,
                    showUnselectedLabels: false,
                    onTap: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    items: const [
                      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
                      BottomNavigationBarItem(icon: Icon(Icons.bookmark_outline), label: 'Watch List'),
                    ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
