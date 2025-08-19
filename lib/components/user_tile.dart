import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final void Function()? tap;
  final String text;
  UserTile({super.key, required this.text, required this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12)
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(Icons.person),
            const SizedBox(width: 20),
            Text(text)
          ],
        ),
      ),
    );
  }
}
