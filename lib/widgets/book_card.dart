// lib/widgets/book_card.dart

import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Map<String, dynamic> book;

  const BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
            image: DecorationImage(
              image: NetworkImage(book['image']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Иконка избранного
        Positioned(
          right: 8,
          top: 8,
          child: Icon(Icons.favorite_border, color: Colors.white),
        ),
        // Детали книги
        Positioned(
          bottom: 0,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book['title'], style: TextStyle(color: Colors.white)),
                Text(book['price'], style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
