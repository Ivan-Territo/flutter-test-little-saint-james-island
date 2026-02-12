import 'package:flutter/material.dart';
import 'shop_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // colori
  final Color _bgDark = const Color(0xFF5F8D88); // Verde Salvia Scuro
  final Color _accentLime = const Color(0xFFD9FF00); // Lime Neon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgDark, // sfondo
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNavBar(context),
            _buildHeroSection(context),
            _buildInfoSection(),
            _buildTiltedGallery(context),
            _buildPackagesList(),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  // navbar (ho fatto header semplice)
  Widget _buildNavBar(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "A Tavoletta",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),

            // bottone contatti (ripota al login admin)
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
              ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const LoginPage())),
              child: const Text("LOGIN"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titoli (FIXATO CON FITTEDBOX PER EVITARE OVERFLOW)
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text("LEARN", style: TextStyle(fontSize: 80, height: 0.9, fontWeight: FontWeight.w900, color: Colors.white)),
          ),

          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                const Text("TO", style: TextStyle(fontSize: 80, height: 0.9, fontWeight: FontWeight.w900, color: Colors.white)),
                const SizedBox(width: 15),
                // Cerchio
                Container(
                  width: 70, height: 70,
                  decoration: BoxDecoration(color: _accentLime, shape: BoxShape.circle),
                  child: const Icon(Icons.surfing, size: 45, color: Colors.black),
                ),
                const SizedBox(width: 10),
                const Text("SURF", style: TextStyle(fontSize: 80, height: 0.9, fontWeight: FontWeight.w900, color: Colors.white)),
              ],
            ),
          ),

          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text("LIKE A PRO", style: TextStyle(fontSize: 80, height: 0.9, fontWeight: FontWeight.w900, color: Colors.white)),
          ),

          const SizedBox(height: 30),

          // botone
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _accentLime,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: const StadiumBorder(),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const ShopPage())),
                child: const Text("GET STARTED", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const Spacer(),
              const Row(
                children: [
                  Icon(Icons.star, color: Color(0xFFD9FF00), size: 18),
                  Icon(Icons.star, color: Color(0xFFD9FF00), size: 18),
                  Icon(Icons.star, color: Color(0xFFD9FF00), size: 18),
                  Icon(Icons.star, color: Color(0xFFD9FF00), size: 18),
                  SizedBox(width: 5),
                  Text("4.9", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),

          const SizedBox(height: 50),

          Stack(
            clipBehavior: Clip.none, // Importante per gli sticker che escono
            children: [
              // Ritaglia
              Container(
                height: 450, // Altezza
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200), // Raggio altissimo = Pillola
                  image: const DecorationImage(
                    image: AssetImage('assets/images/hero_lifestyle.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.white, width: 4), // Bordo bianco elegante
                ),
              ),

              // sticker
              Positioned(
                bottom: 40,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: _accentLime,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.waves, size: 20),
                      SizedBox(width: 10),
                      Text("LONG BEACH\nCALIFORNIA", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                ),
              ),

              // Sticker Rotondo
              Positioned(
                top: 30,
                left: 30,
                child: Container(
                  width: 80, height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("2024", style: TextStyle(fontWeight: FontWeight.bold, color: _bgDark)),
                      Text("COLLECTION", style: TextStyle(fontSize: 8, color: _bgDark)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.all(30),
      color: Colors.white, // Stacco netto bianco
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "SURFING\nTRAINING AT\nITS FINEST.",
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900, color: Colors.black, height: 0.9),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _circleButton(Icons.arrow_back_ios),
                  const SizedBox(width: 10),
                  _circleButton(Icons.arrow_forward_ios, active: true),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("21K+", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  Text("Happy Surfers", style: TextStyle(color: Colors.grey)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  // incline
  Widget _buildTiltedGallery(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 50),
      height: 400, //scroll orizzontale
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        children: [
          _tiltedCard('assets/images/surfer_action_1.jpg', angle: -0.05, label: "DIVE"), //da cambiare
          const SizedBox(width: 20),
          _tiltedCard('assets/images/surfer_action_2.jpg', angle: 0.05, label: "GUIDE"),
          const SizedBox(width: 20),
          _tiltedCard('assets/images/surfer_action_1.jpg', angle: -0.03, label: "PRO"),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  // testo grande e divisori
  Widget _buildPackagesList() {
    return Container(
      color: _bgDark,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _packageItem("PRO PACKAGE"),
          const Divider(color: Colors.white54),
          _packageItem("MID PACKAGE"),
          const Divider(color: Colors.white54),
          _packageItem("TRIAL PACKAGE"),
          const Divider(color: Colors.white54),
        ],
      ),
    );
  }

  // foot
  Widget _buildFooter(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/beach_group.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withValues(alpha: 0.8), Colors.transparent],
          ),
        ),
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("LET'S JOIN\nSURFING CLUB", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900, height: 0.9)),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _accentLime,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const ShopPage())),
              child: const Text("GET STARTED", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon, {bool active = false}) {
    return Container(
      width: 50, height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? _accentLime : Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: Icon(icon, color: Colors.black),
    );
  }

  Widget _tiltedCard(String imagePath, {required double angle, required String label}) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: 250,
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 15, offset: const Offset(0, 10))
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(imagePath, fit: BoxFit.cover, errorBuilder: (c,e,s) => Container(color: Colors.grey)),
              Positioned(
                bottom: 20, left: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withValues(alpha: 0.3)
                  ),
                  child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _packageItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white),
            ),
            child: const Icon(Icons.arrow_forward, color: Colors.white),
          )
        ],
      ),
    );
  }
}