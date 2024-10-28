import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
    this.onChanged,
  });

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Search',
      hintStyle: WidgetStatePropertyAll(
        TextStyle(
          color: Theme.of(context).disabledColor,
        ),
      ),
      leading: const Icon(Iconsax.search_normal),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(35)),
        ),
      ),
      padding:
          const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
      shadowColor: WidgetStatePropertyAll(Colors.black.withOpacity(0.1)),
      onChanged: onChanged,
    );
  }
}
