import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/catatan.dart';
import 'detail_catatan.dart';
import 'form_catatan.dart';

class HalamanCatatan extends StatefulWidget {
  const HalamanCatatan({super.key});

  @override
  State<HalamanCatatan> createState() => _HalamanCatatanState();
}

class _HalamanCatatanState extends State<HalamanCatatan> {
  static const String _kunciStorage = 'daftar_catatan_modular_v1';
  List<Catatan> _catatan = [];
  List<Catatan> _catatanTampil = [];

  final TextEditingController _searchController = TextEditingController();
  final DateFormat _formatTanggal = DateFormat(
    'EEEE, d MMM yyyy • HH:mm',
    'id_ID',
  );

  @override
  void initState() {
    super.initState();
    _muatCatatan();
    _searchController.addListener(_cariCatatan);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _cariCatatan() {
    final query = _searchController.text.toLowerCase().trim();
    setState(() {
      if (query.isEmpty) {
        _catatanTampil = List.from(_catatan);
      } else {
        _catatanTampil = _catatan.where((c) {
          return c.judul.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  Future<void> _muatCatatan() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final dataStringList = prefs.getStringList(_kunciStorage) ?? [];

      final loadedCatatan = dataStringList.map((itemStr) {
        final Map<String, dynamic> jsonMap = jsonDecode(itemStr);
        return Catatan.fromJson(jsonMap);
      }).toList();

      setState(() {
        _catatan = loadedCatatan;
        _cariCatatan();
      });
    } catch (e) {
      debugPrint('Error memuat catatan: $e');
    }
  }

  Future<void> _simpanKeStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final dataStringList = _catatan
          .map((catatan) => jsonEncode(catatan.toJson()))
          .toList();

      await prefs.setStringList(_kunciStorage, dataStringList);
    } catch (e) {
      debugPrint('Error menyimpan catatan: $e');
    }
  }

  Future<void> _tambahAtauEditCatatan({Catatan? catatanEdit}) async {
    final hasil = await Navigator.push<Catatan>(
      context,
      MaterialPageRoute(
        builder: (context) => FormCatatanPage(catatan: catatanEdit),
      ),
    );

    if (hasil != null) {
      setState(() {
        if (catatanEdit == null) {
          _catatan.insert(0, hasil);
        } else {
          final index = _catatan.indexWhere((c) => c.id == hasil.id);
          if (index != -1) {
            _catatan[index] = hasil;
          }
        }
        _cariCatatan();
      });

      await _simpanKeStorage();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Catatan berhasil disimpan!')),
      );
    }
  }

  Future<void> _bukaDetail(Catatan catatan) async {
    final hasilEdit = await Navigator.push<Catatan>(
      context,
      MaterialPageRoute(
        builder: (context) => DetailCatatanPage(catatan: catatan),
      ),
    );

    if (hasilEdit != null) {
      setState(() {
        final index = _catatan.indexWhere((c) => c.id == hasilEdit.id);
        if (index != -1) {
          _catatan[index] = hasilEdit;
        }
        _cariCatatan();
      });

      await _simpanKeStorage();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Catatan berhasil diperbarui!')),
      );
    }
  }

  Future<void> _hapusCatatan(Catatan targetCatatan) async {
    final konfirmasi = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Catatan?'),
        content: const Text('Catatan ini akan dihapus permanen.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (konfirmasi != true) return;

    setState(() {
      _catatan.removeWhere((c) => c.id == targetCatatan.id);
      _cariCatatan();
    });

    await _simpanKeStorage();

    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Catatan berhasil dihapus')));
  }

  @override
  Widget build(BuildContext context) {
    final hariIni = DateFormat(
      'EEEE, d MMMM yyyy',
      'id_ID',
    ).format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catatan Harian',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.surfaceContainerHighest
                .withValues(alpha: 0.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hariIni,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari catatan...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                            },
                          )
                        : null,
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _catatanTampil.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.note_alt_outlined,
                          size: 70,
                          color: Theme.of(context).colorScheme.outline
                              .withValues(alpha: 0.5),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _catatan.isEmpty
                              ? 'Belum ada catatan'
                              : 'Pencarian tidak ditemukan',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _catatanTampil.length,
                    itemBuilder: (context, index) {
                      final c = _catatanTampil[index];
                      return Dismissible(
                        key: ValueKey(c.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        confirmDismiss: (_) async {
                          await _hapusCatatan(c);
                          return false;
                        },
                        child: Card(
                          elevation: 1,
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            title: Text(
                              c.judul,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .outline,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    _formatTanggal.format(c.waktu),
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () => _bukaDetail(c),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _tambahAtauEditCatatan(),
        icon: const Icon(Icons.add),
        label: const Text('Catatan Baru'),
      ),
    );
  }
}
