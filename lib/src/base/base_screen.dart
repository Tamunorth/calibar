import 'package:calorie_tracker/src/bag/bag_screen.dart';
import 'package:calorie_tracker/src/home/home_ctrl.dart';
import 'package:calorie_tracker/src/home/home_screen.dart';
import 'package:calorie_tracker/src/home/home_service.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
  static const routeName = '/';

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final HomeController homeController = HomeController(HomeService());

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Container(),
          // Container(),
          HomeScreen(
            homeController: homeController,
          ),
          BagScreen(
            homeController: homeController,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            activeIcon: Icon(Iconsax.home_15),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ListenableBuilder(
              listenable: homeController,
              builder: (context, child) {
                return Badge(
                  label: Text('${homeController.selectedFoods.length}'),
                  child: const Icon(Iconsax.shopping_cart),
                );
              },
            ),
            activeIcon: ListenableBuilder(
              listenable: homeController,
              builder: (context, child) {
                return Badge(
                  label: Text('${homeController.selectedFoods.length}'),
                  child: const Icon(Iconsax.shopping_cart5),
                );
              },
            ),
            label: 'Bag',
          ),
        ],
      ),
    );
  }
}
