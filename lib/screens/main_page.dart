import 'package:flutter/material.dart';
import 'package:bookshop/data/book_data.dart';
import '../widgets/book_card.dart';

Widget _sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
  );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Bookstore")),
      body: CustomScrollView(
        slivers: [
          // 🔥 Заголовок популярных книг
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '🔥 Popular Books',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Горизонтальный список популярных книг
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle('Популярное'),
                SizedBox(
                  height: 250, // высота карточки
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bookList.length,
                    itemBuilder: (context, index) {
                      final book = bookList[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                        child: SizedBox(
                          width: 140, // ширина карточки
                          child: BookCard(book: book,
                              imageHeight: 160,
                            ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),



          // 📚 Заголовок всех книг
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '📚 All Books',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Сетка всех книг
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final book = bookList[index];
                  return BookCard(book: book,
                    imageHeight: 220,);
                },
                childCount: bookList.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.62,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
