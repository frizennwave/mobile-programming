import 'package:flutter/material.dart';

import '../models/catatan.dart';

class FormCatatanPage extends StatefulWidget {
  final Catatan? catatan;

  const FormCatatanPage({super.key, this.catatan});

  @override
  State<FormCatatanPage> createState() => _FormCatatanPageState();
}

class _FormCatatanPageState extends State<FormCatatanPage> {
  late final TextEditingController _judulController;
  late final TextEditingController _isiController;

  @override
  void initState() {
    super.initState();
    _judulController = TextEditingController(text: widget.catatan?.judul ?? '');
    _isiController = TextEditingController(text: widget.catatan?.isi ?? '');
  }

  @override
  void dispose() {
    _judulController.dispose();
    _isiController.dispose();
    super.dispose();
  }

  void _simpan() {
    final judul = _judulController.text.trim();
    final isi = _isiController.text.trim();

    if (judul.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Judul tidak boleh kosong!')),
      );
      return;
    }

    final catatanBaru = Catatan(
      id: widget.catatan?.id ?? DateTime.now().toIso8601String(),
      judul: judul,
      isi: isi.isEmpty ? '-' : isi,
      waktu: DateTime.now(),
    );

    Navigator.pop(context, catatanBaru);
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.catatan != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Catatan' : 'Catatan Baru'),
        actions: [
          IconButton(icon: const Icon(Icons.check), onPressed: _simpan),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _judulController,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                hintText: 'Judul Catatan',
                border: InputBorder.none,
              ),
            ),
            const Divider(),
            Expanded(
              child: TextField(
                controller: _isiController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  hintText: 'Tulis isi catatan di sini...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
