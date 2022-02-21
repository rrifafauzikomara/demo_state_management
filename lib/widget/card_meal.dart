import 'package:flutter/material.dart';

class CardMeal extends StatelessWidget {
  final String imageUrl, title;

  const CardMeal({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 2.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        margin: const EdgeInsets.all(10),
        child: GridTile(
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
          footer: Container(
            color: Colors.white70,
            padding: const EdgeInsets.all(5.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
