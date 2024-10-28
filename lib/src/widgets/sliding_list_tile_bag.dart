import 'package:calorie_tracker/src/home/home_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SlidingListTileBag extends StatefulWidget {
  const SlidingListTileBag({
    super.key,
    required this.singleItem,
    required this.index,
    this.onTap,
    this.onQtyChanged,
    this.onAdd,
    this.onSubtract,
    this.onRemove,
  });

  final SelectedFoods singleItem;
  final int index;
  final VoidCallback? onTap;
  final Function(num)? onQtyChanged;
  final VoidCallback? onAdd;
  final VoidCallback? onSubtract;
  final VoidCallback? onRemove;

  @override
  State<SlidingListTileBag> createState() => _SlidingListTileBagState();
}

class _SlidingListTileBagState extends State<SlidingListTileBag>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  final TextEditingController qtyCtrl = TextEditingController();

  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    qtyCtrl.text = widget.singleItem.quantity.toString();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (widget.index * 200)),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(_animationController);
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    _animationController.forward();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.singleItem.quantity != widget.singleItem.quantity) {
      qtyCtrl.text = widget.singleItem.quantity.toString();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    qtyCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(
        child: Text('${widget.singleItem.food.foodCategory?.substring(0, 1)}'),
      ),
      title: Text(
        '${widget.singleItem.food.description}',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Row(
        children: [
          IconButton(
            icon: const Icon(Iconsax.minus),
            onPressed: widget.onSubtract,
          ),
          SizedBox(
            width: 40,
            height: 50,
            child: TextField(
              controller: qtyCtrl,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                widget.onQtyChanged?.call(num.tryParse(value) ?? 0);
              },
            ),
          ),
          IconButton(
            icon: const Icon(Iconsax.add),
            onPressed: widget.onAdd,
          ),
          Expanded(child: Text('KCAL=${widget.singleItem.totalCalories}')),
        ],
      ),
      onTap: widget.onTap,
      trailing: IconButton(
        icon: const Icon(Iconsax.trash),
        onPressed: widget.onRemove,
      ),
    );
    // return FadeTransition(
    //   opacity: _fadeAnimation,
    //   child: SlideTransition(
    //     position: _slideAnimation,
    //     child: ListTile(
    //       contentPadding: const EdgeInsets.all(0),
    //       leading: CircleAvatar(
    //         child: Text('${widget.singleItem.foodCategory?.substring(0, 1)}'),
    //       ),
    //       title: Text('${widget.singleItem.description}'),
    //       subtitle: Text(
    //           '${widget.singleItem.foodNutrients?.where((e) => e.unitName == 'KCAL').firstOrNull?.value} : ${widget.singleItem.foodCategory} : ${widget.singleItem.additionalDescriptions} '),
    //       onTap: () {},
    //     ),
    //   ),
    // );
  }
}
