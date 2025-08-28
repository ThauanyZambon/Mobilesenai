import 'package:flutter/material.dart';

class BookFormView extends StatefulWidget {
  const BookFormView({super.key});

  @override
  State<BookFormView> createState() => _BookFormViewState();
}

class _BookFormViewState extends State<BookFormView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

import 'package:flutter/material.dart';

/// Modelo de Livro
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

/// Widget de formulário para criar ou editar um livro
class BookListForm extends StatefulWidget {
  final void Function(Book) onSubmit;
  final Book? initialBook;

  const BookListForm({
    Key? key,
    required this.onSubmit,
    this.initialBook,
  }) : super(key: key);

  @override
  State<BookListForm> createState() => _BookListFormState();
}

class _BookListFormState extends State<BookListForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _coverUrlController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialBook?.title ?? '');
    _authorController = TextEditingController(text: widget.initialBook?.author ?? '');
    _coverUrlController = TextEditingController(text: widget.initialBook?.coverUrl ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _coverUrlController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newBook = Book(
        title: _titleController.text.trim(),
        author: _authorController.text.trim(),
        coverUrl: _coverUrlController.text.trim(),
      );

      widget.onSubmit(newBook);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Título'),
            validator: (value) =>
                value == null || value.trim().isEmpty ? 'Informe o título' : null,
          ),
          TextFormField(
            controller: _authorController,
            decoration: const InputDecoration(labelText: 'Autor'),
            validator: (value) =>
                value == null || value.trim().isEmpty ? 'Informe o autor' : null,
          ),
          TextFormField(
            controller: _coverUrlController,
            decoration: const InputDecoration(labelText: 'URL da capa'),
            validator: (value) =>
                value == null || value.trim().isEmpty ? 'Informe a URL da capa' : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text(widget.initialBook == null ? 'Cadastrar Livro' : 'Atualizar Livro'),
          ),
        ],
      ),
    );
  }
}


