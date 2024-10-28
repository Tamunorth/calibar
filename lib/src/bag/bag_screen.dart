import 'package:calorie_tracker/src/home/home_ctrl.dart';
import 'package:calorie_tracker/src/widgets/sliding_list_tile_bag.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key, required this.homeController});
  static const routeName = '/bag';
  final HomeController homeController;

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListenableBuilder(
            listenable: widget.homeController,
            builder: (context, child) {
              return Text('Total: ${widget.homeController.totalCalories}');
            }),
        actions: [
          IconButton(
            onPressed: () {
              widget.homeController.clearSelectedFoods();
            },
            icon: const Icon(
              Iconsax.trash,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: ListenableBuilder(
              listenable: widget.homeController,
              builder: (context, child) {
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20),
                    itemCount: widget.homeController.selectedFoods.length,
                    itemBuilder: (context, index) {
                      final singleItem =
                          widget.homeController.selectedFoods[index];
                      return SlidingListTileBag(
                        key: ValueKey(singleItem.id),
                        index: index,
                        singleItem: singleItem,
                        onAdd: () {
                          widget.homeController.updateQuantity(
                              singleItem, singleItem.quantity + 1);
                        },
                        onSubtract: () {
                          widget.homeController.updateQuantity(
                              singleItem, singleItem.quantity - 1);
                        },
                        onQtyChanged: (value) {
                          widget.homeController
                              .updateQuantity(singleItem, value);
                        },
                        onRemove: () {
                          widget.homeController.removeFood(singleItem);
                        },
                      );
                    });
              }),
        ),
      ),
    );
  }
}
