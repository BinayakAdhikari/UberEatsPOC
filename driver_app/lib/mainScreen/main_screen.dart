import 'package:driver_app/tabPages/home_tab.dart';
import 'package:driver_app/tabPages/profile_tab.dart';
import 'package:flutter/material.dart';

import '../tabPages/earnings_tab.dart';
import '../tabPages/ratings_tab.dart';
class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin
{
  TabController? tabController;
  int selectedIndex = 0; //basically gives user the idea of which pages they are in

  onItemClicked(int index)
  {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }
  @override
  void initState() { //it is called itself when user navigate with main screen
    // TODO: implement initState
    super.initState();

    tabController= TabController(length: 4 , vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(

        physics: const NeverScrollableScrollPhysics(),//is a scroll physics that does not allow the user to scroll.
        controller: tabController,
        children: const [ //includes our 4 pages
           HomeTabPage(),
          EarningsTabPage(),
          RatingsTabPage(),
          ProfileTabPage(),

        ],
      ),
       bottomNavigationBar: BottomNavigationBar(
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "Home",
       ),

          BottomNavigationBarItem(icon: Icon(Icons.credit_card),
            label: "Earnings",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.star),
            label: "Ratings",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person),
            label: "Profile",
          ),
      ],


         unselectedItemColor: Colors.white54,
         selectedItemColor: Colors.white,
         backgroundColor: Colors.black,
         type: BottomNavigationBarType.fixed,
         selectedLabelStyle: TextStyle(fontSize: 14),
         showUnselectedLabels: true,
         currentIndex: selectedIndex,
         onTap: onItemClicked,
    )

    );
  }
}
