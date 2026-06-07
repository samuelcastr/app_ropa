import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../garments/garment_list_screen.dart';
import '../outfits/outfit_generator_screen.dart';
import '../dashboard/dashboard_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({
    super.key,
  });

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {

  int _selectedIndex = 0;

  late final List<Widget> _screens = [
    const HomeScreen(),
    const GarmentListScreen(),
    const OutfitGeneratorScreen(),
    const DashboardScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: _screens[_selectedIndex],

      bottomNavigationBar:
          BottomNavigationBar(

        currentIndex:
            _selectedIndex,

        type:
            BottomNavigationBarType.fixed,

        onTap: (index) {

          setState(() {

            _selectedIndex =
                index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Inicio',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.checkroom,
            ),
            label: 'Prendas',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.auto_awesome,
            ),
            label: 'Outfits',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
            ),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}