import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/catatan.dart';
import 'form_catatan.dart';

class DetailCatatanPage extends StatelessWidget {
  final Catatan catatan;

  const DetailCatatanPage({super.key, required this.catatan});

  @override
  Widget build(BuildContext context) {
    final formatTanggalLengkap = DateFormat(
      'EEEE, d MMMM yyyy • HH:mm',
      'id_ID',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Catatan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final hasilEdit = await Navigator.push<Catatan>(
                context,
                MaterialPageRoute(
                  builder: (context) => FormCatatanPage(catatan: catatan),
                ),
              );

              if (hasilEdit != null && context.mounted) {
                Navigator.pop(context, hasilEdit);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              catatan.judul,
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 16,
                  color: Theme.of(context).colorScheme.outline,
                ),
                const SizedBox(width: 6),
                Text(
                  formatTanggalLengkap.format(catatan.waktu),
                  style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.outline),
                ),
              ],
            ),
            const Divider(height: 32),
            Text(
              catatan.isi,
              style: Theme.of(context).textTheme.bodyLarge
                  ?.copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
