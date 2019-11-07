import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_navonmesh/bloc/bottom_appbar_provider.dart';
import 'package:project_navonmesh/homepage/bottom_nav_bar_icons_icons.dart';
import 'package:project_navonmesh/values/colors.dart';
import 'package:provider/provider.dart';


// https://flatuicolors.com/palette/us

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var provider=Provider.of<BottomNavigationBarProvider>(context);
    return BottomNavyBar(

      selectedIndex: provider.currentIndex,
      backgroundColor:Colors.transparent,
      showElevation: false,
      // use this to remove appBar's elevation
      onItemSelected: (index){
        provider.currentIndex=index;
      },
      items: [
        BottomNavyBarItem(
          icon: Icon(BottomNavBarIcons.spotlight,),
          title: Text('Spotlight'),
          activeColor: Colors.deepOrangeAccent,
        ),
        BottomNavyBarItem(
          icon: Icon(BottomNavBarIcons.fireworks,),
          title: Text('Flagship'),
          activeColor: ColorValues.COLOR_ICON_FLAGSHIP,
        ),
        BottomNavyBarItem(
            icon: Icon(BottomNavBarIcons.ticket),
            title: Text('Proshows'),
            activeColor: ColorValues.COLOR_ICON_PROSHOWS
        ),
        BottomNavyBarItem(
            icon: Icon(BottomNavBarIcons.idea),
            title: Text('Workshop'),
            activeColor: ColorValues.COLOR_ICON_WORKSHOP
        ),
        BottomNavyBarItem(
            icon: Icon(BottomNavBarIcons.tent),
            title: Text('All Events'),
            activeColor: ColorValues.COLOR_ICON_EVENTS
        ),
      ],
    );
  }
}
