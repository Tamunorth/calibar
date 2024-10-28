import 'package:calorie_tracker/src/home/home_ctrl.dart';
import 'package:calorie_tracker/src/widgets/custom_search.dart';
import 'package:calorie_tracker/src/widgets/sliding_list_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.homeController});

  static const routeName = '/home';

  final HomeController homeController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget.homeController.getFood('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomSearch(
                onChanged: (value) async {
                  final debounce = DebounceClient(milliseconds: 100);
                  debounce.run(() async {
                    await widget.homeController.getFood(value);
                  });
                },
              ),
              ListenableBuilder(
                  listenable: widget.homeController,
                  builder: (context, child) {
                    if (widget.homeController.state == HomeState.loading) {
                      return LinearProgressIndicator(
                        backgroundColor: Theme.of(context).disabledColor,
                        color: Theme.of(context).primaryColor,
                      );
                    }

                    return const SizedBox();
                  }),
              ListenableBuilder(
                  listenable: widget.homeController,
                  builder: (context, child) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: widget.homeController.foods.length,
                          itemBuilder: (context, index) {
                            final singleItem =
                                widget.homeController.foods[index];
                            return SlidingListTile(
                              key: ValueKey(singleItem.fdcId),
                              index: index,
                              singleItem: singleItem,
                              onTap: () {
                                widget.homeController.addFood(singleItem);
                              },
                            );
                          }),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
