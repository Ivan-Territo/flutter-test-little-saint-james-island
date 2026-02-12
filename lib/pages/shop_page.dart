import 'package:flutter/material.dart';
import '../models/board.dart';
import '../services/api_service.dart';
import '../widgets/surf_card.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final ApiService _apiService = ApiService();
  List<SurfBoard> carrello = [];

  double get totale => carrello.fold(0, (sum, item) => sum + item.prezzo);

  void _aggiungi(SurfBoard board) {
    setState(() => carrello.add(board));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("${board.modello} aggiunto!"),
      backgroundColor: const Color(0xFFD9FF00),
      duration: const Duration(milliseconds: 500),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F8D88),
      appBar: AppBar(
        title: const Text("SHOP ONLINE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(child: Text("Carrello: ${carrello.length}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<SurfBoard>>(
              future: _apiService.getBoards(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator(color: Color(0xFFD9FF00)));

                final boards = snapshot.data!;
                if (boards.isEmpty) return const Center(child: Text("Nessun prodotto", style: TextStyle(color: Colors.white)));

                // Resposivee
                return LayoutBuilder(
                  builder: (context, constraints) {
                    int colonne = 2;
                    double width = constraints.maxWidth;

                    if (width > 1200) {
                      colonne = 5;
                    } else if (width > 900) {
                      colonne = 4; // Desktop
                    } else if (width > 600) {
                      colonne = 3; // Tablet
                    } else {
                      colonne = 2; // Telefono
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: colonne,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15
                      ),
                      itemCount: boards.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => _aggiungi(boards[index]),
                        child: SurfCard(board: boards[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          if (carrello.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Totale: €${totale.toInt()}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
                    onPressed: () {
                      setState(() => carrello.clear());
                      showDialog(context: context, builder: (c) => const AlertDialog(title: Text("Grazie! Ordine inviato.")));
                    },
                    child: const Text("PAGA ORA"),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}