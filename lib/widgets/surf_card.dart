import 'package:flutter/material.dart';
import '../models/board.dart';

class SurfCard extends StatelessWidget {
  final SurfBoard board;
  const SurfCard({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    // Logica Intelligente: È un URL online o un file locale?
    bool isNetworkImage = board.urlImmagine.startsWith('http');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // immagine dinamica con gestione errori
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: isNetworkImage
                  ? Image.network(
                board.urlImmagine,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator(color: Color(0xFFD9FF00)));
                },
                errorBuilder: (context, error, stackTrace) => _buildErrorIcon(),
              )
                  : Image.asset(
                board.urlImmagine,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => _buildErrorIcon(),
              ),
            ),
          ),

          // dati e prezzo
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(board.marca.toUpperCase(), style: const TextStyle(color: Color(0xFF5F8D88), fontSize: 10, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(board.modello, style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w900), maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("€${board.prezzo.toInt()}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(color: Color(0xFFD9FF00), shape: BoxShape.circle),
                        child: const Icon(Icons.add, size: 18, color: Colors.black),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorIcon() {
    return Container(
      color: Colors.grey[300],
      child: const Center(child: Icon(Icons.broken_image, size: 40, color: Colors.grey)),
    );
  }
}