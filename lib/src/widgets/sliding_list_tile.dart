import 'package:calorie_tracker/src/home/search_res_dto.dart';
import 'package:flutter/material.dart';

class SlidingListTile extends StatefulWidget {
  const SlidingListTile({
    super.key,
    required this.singleItem,
    required this.index,
    this.onTap,
  });

  final Foods singleItem;
  final int index;
  final VoidCallback? onTap;

  @override
  State<SlidingListTile> createState() => _SlidingListTileState();
}

class _SlidingListTileState extends State<SlidingListTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
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
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(
        child: Text('${widget.singleItem.foodCategory?.substring(0, 1)}'),
      ),
      title: Text(
        '${widget.singleItem.description}',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
          'KCAL: ${widget.singleItem.foodNutrients?.where((e) => e.unitName == 'KCAL').firstOrNull?.value} : ${widget.singleItem.foodCategory}'),
      onTap: widget.onTap,
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
