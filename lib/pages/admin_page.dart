import 'package:flutter/material.dart';
import '../models/board.dart';
import '../services/api_service.dart';
import 'home_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _marcaController = TextEditingController();
  final _modelloController = TextEditingController();
  final _prezzoController = TextEditingController();
  final _urlController = TextEditingController();
  final ApiService _apiService = ApiService();

  // File locali da assets per delle immagini stock da testare
  final List<String> immaginiStock = [
    'assets/test/surf1.jpg',
    'assets/test/surf2.jpg',
    'assets/test/surf3.jpg',
    'assets/test/surf4.jpg',
  ];

  void _salvaProdotto() async {
    if (_urlController.text.isEmpty || _marcaController.text.isEmpty) return;

    SurfBoard nuovaTavola = SurfBoard(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      marca: _marcaController.text,
      modello: _modelloController.text,
      prezzo: double.tryParse(_prezzoController.text) ?? 0.0,
      urlImmagine: _urlController.text,
    );

    await _apiService.addBoard(nuovaTavola);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Salvato!'), backgroundColor: Color(0xFFD9FF00)));
      _marcaController.clear(); _modelloController.clear(); _prezzoController.clear(); _urlController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F8D88),
      appBar: AppBar(
        title: const Text("ADMIN DASHBOARD", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.exit_to_app, color: Colors.white), onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const HomePage()))),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.9), borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  TextField(controller: _marcaController, decoration: const InputDecoration(labelText: "Marca")),
                  TextField(controller: _modelloController, decoration: const InputDecoration(labelText: "Modello")),
                  TextField(controller: _prezzoController, decoration: const InputDecoration(labelText: "Prezzo"), keyboardType: TextInputType.number),
                  const SizedBox(height: 10),
                  TextField(controller: _urlController, decoration: const InputDecoration(labelText: "Percorso Immagine (URL o Asset)")),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("DAI TUOI ASSETS:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // ANTEPRIMA IMMAGINI LOCALI
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: immaginiStock.length,
                itemBuilder: (context, index) {
                  final path = immaginiStock[index];
                  return GestureDetector(
                    onTap: () => setState(() => _urlController.text = path),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 80,
                      decoration: BoxDecoration(
                          border: _urlController.text == path ? Border.all(color: const Color(0xFFD9FF00), width: 3) : null,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      // Qui usiamo Image.asset perché sappiamo che la lista 'immaginiStock' contiene solo file locali
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(path, fit: BoxFit.cover, errorBuilder: (c,e,s) => const Icon(Icons.error)),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD9FF00), foregroundColor: Colors.black),
                onPressed: _salvaProdotto,
                child: const Text("PUBBLICA"),
              ),
            )
          ],
        ),
      ),
    );
  }
}