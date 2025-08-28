import 'package:flutter/material.dart';

class BookListView extends StatefulWidget {
  const BookListView({super.key});

  @override
  State<BookListView> createState() => _BookListViewState();
}

class _BookListViewState extends State<BookListView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

import 'package:flutter/material.dart';

/// Modelo simples de Livro
class Book {
  final String title;
  final String author;
  final String coverUrl;

  Book({
    required this.title,
    required this.author,
    required this.coverUrl,
  });
}

/// Widget principal que exibe a lista de livros
class BookListView extends StatelessWidget {
  final List<Book> books;

  const BookListView({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return const Center(
        child: Text('Nenhum livro encontrado.'),
      );
    }

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return BookListItem(book: books[index]);
      },
    );
  }
}

/// Widget para exibir um item individual da lista de livros
class BookListItem extends StatelessWidget {
  final Book book;

  const BookListItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        book.coverUrl,
        width: 50,
        height: 80,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.book),
      ),
      title: Text(book.title),
      subtitle: Text(book.author),
      onTap: () {
        // Aqui você pode adicionar navegação ou outras ações
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Você selecionou "${book.title}"')),
        );
      },
    );
  }
}
