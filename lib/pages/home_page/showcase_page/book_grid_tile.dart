import 'package:flutter/material.dart';

class BookGridTile extends StatelessWidget {
  const BookGridTile({
    Key? key,
    required this.title,
    required this.imagePath,
    this.onTap,
  }) : super(key: key);
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.background.withAlpha(100),
              Theme.of(context).colorScheme.onBackground.withAlpha(30),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                // width: 200,
                height: 260,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 4),
              FittedBox(
                  child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
