import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/book_model.dart';
import '../../viewmodels/book_vm.dart';
import 'book_form_dialog.dart';

class BookDetailView extends ConsumerStatefulWidget {
  final BookModel book;

  const BookDetailView({super.key, required this.book});

  @override
  ConsumerState<BookDetailView> createState() => _BookDetailViewState();
}

class _BookDetailViewState extends ConsumerState<BookDetailView> {
  late BookModel _currentBook;

  @override
  void initState() {
    super.initState();
    _currentBook = widget.book;
  }

  BookNotifier get _vm => ref.read(bookProvider.notifier);

  void _toast(String msg, {bool isError = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(msg),
          backgroundColor: isError ? Theme.of(context).colorScheme.error : null,
        ),
      );
  }

  Future<void> _openEditForm() async {
    final saved = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => BookFormDialog(
        book: _currentBook,
        onSubmit: (payload) => _vm.update(_currentBook.id, payload),
      ),
    );

    if (saved == true) {
      _toast('Perubahan disimpan');
      final updatedList = ref.read(bookProvider).books;
      final found = updatedList.where((b) => b.id == _currentBook.id);
      if (found.isNotEmpty) {
        setState(() {
          _currentBook = found.first;
        });
      }
    }
  }

  Future<void> _confirmDelete() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Hapus Buku'),
        content: Text('Hapus "${_currentBook.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogCtx, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (ok != true) return;

    final err = await _vm.delete(_currentBook.id);
    _toast(err ?? 'Buku dihapus', isError: err != null);

    if (err == null && mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentBook.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Buku',
            onPressed: _openEditForm,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.red,
            tooltip: 'Hapus Buku',
            onPressed: _confirmDelete,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 220,
                width: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.menu_book,
                  size: 64,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 32),

            Text(
              _currentBook.title,
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _buildDetailRow(context, 'Penulis', _currentBook.author),
            const Divider(height: 24),

            _buildDetailRow(
              context,
              'Publisher',
              _currentBook.publisher.toString(),
            ),
            const Divider(height: 24),

            _buildDetailRow(context, 'ISBN', _currentBook.isbn),
            const Divider(height: 24),

            _buildDetailRow(
              context,
              'Published Year',
              _currentBook.publishedYear.toString(),
            ),
            const Divider(height: 24),

            _buildDetailRow(context, 'Stock', _currentBook.stock.toString()),
            const Divider(height: 24),

            const Text(
              'Deskripsi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              _currentBook.description ??
                  'Tidak ada deskripsi yang tersedia untuk buku ini.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
