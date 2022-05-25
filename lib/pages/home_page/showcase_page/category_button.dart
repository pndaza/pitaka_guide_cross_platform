import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String categoryName;
  final VoidCallback? onPressed;
  const CategoryButton({
    Key? key,
    required this.categoryName,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.transparent,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.background.withAlpha(100),
            Theme.of(context).colorScheme.onBackground.withAlpha(30),
          ],
          // gradient: LinearGradient(
          //   colors: [
          //     Color.fromARGB(255, 252, 85, 85),
          //     Color.fromARGB(255, 255, 76, 171),
          //   ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      margin: const EdgeInsets.all(0.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          categoryName,
          style: const TextStyle(fontSize: 20.0),
        ),
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
