import 'package:flutter/material.dart';
import 'shop_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sfondo base bianco per le sezioni di testo
      body: SingleChildScrollView(
        // ScrollView permette di fare una pagina lunga quanto vuoi
        child: Column(
          children: [

            // --- SEZIONE 1: HERO (L'impatto iniziale) ---
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.85, // 85% altezza schermo
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/hero_bg.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.3), BlendMode.darken),
                    ),
                  ),
                ),
                // Contenuto sopra l'immagine
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("A Tavoletta", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 20)),
                              IconButton(
                                icon: const Icon(Icons.person_outline, color: Colors.white, size: 30),
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const LoginPage())),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Text("RIDE THE\nFUTURE.", style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900, color: Colors.white, height: 0.9)),
                        const SizedBox(height: 10),
                        const Text("Lo store numero #1 per surfisti digitali.", style: TextStyle(fontSize: 20, color: Colors.white)),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD9FF00),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          ),
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const ShopPage())),
                          child: const Text("INIZIA A SURFARE", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // --- SEZIONE 2: FILOSOFIA (Testo + Immagine) ---
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              color: const Color(0xFF5F8D88), // Verde Salvia
              child: Column(
                children: [
                  const Text(
                    "Dagli Amatoriali ai Professionisti.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Non importa se è la tua prima onda o se stai cercando il tubo perfetto alle Hawaii. Abbiamo selezionato le migliori tavole per ogni livello di esperienza. Materiali eco-friendly e shape innovativi.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.5),
                  ),
                  const SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/lifestyle_1.jpg', // Assicurati di averla scaricata!
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (c,e,s) => Container(height: 200, color: Colors.black26, child: const Center(child: Icon(Icons.image, color: Colors.white))),
                    ),
                  ),
                ],
              ),
            ),

            // --- SEZIONE 3: I VANTAGGI (Icone) ---
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildFeatureIcon(Icons.bolt, "Veloci"),
                  _buildFeatureIcon(Icons.eco, "Eco"),
                  _buildFeatureIcon(Icons.verified, "Garantite"),
                ],
              ),
            ),

            // --- SEZIONE 4: CALL TO ACTION FINALE ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              color: Colors.black,
              child: Column(
                children: [
                  const Text("Pronto a entrare in acqua?", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD9FF00),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const ShopPage())),
                    child: const Text("VISITA LO STORE"),
                  ),
                  const SizedBox(height: 20),
                  const Text("Spedizione gratuita sopra i 500€", style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper per le icone
  Widget _buildFeatureIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: const Color(0xFF5F8D88).withValues(alpha: 0.1), shape: BoxShape.circle),
          child: Icon(icon, size: 30, color: const Color(0xFF5F8D88)),
        ),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
