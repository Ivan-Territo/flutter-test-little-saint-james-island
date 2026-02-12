class SurfBoard {
  final String id;
  final String modello;
  final String marca;
  final double prezzo;
  final String lunghezza;
  final String volume;
  final bool disponibile;
  final String urlImmagine;

  const SurfBoard({
    required this.id,
    required this.modello,
    required this.marca,
    required this.prezzo,
    this.lunghezza = "Standard",
    this.volume = "Standard",
    this.disponibile = true,
    required this.urlImmagine,
  });

  // Da JSON (API o Locale) a Oggetto Dart
  factory SurfBoard.fromJson(Map<String, dynamic> json) {
    return SurfBoard(
      id: json['id'].toString(), // Converte in stringa per sicurezza
      modello: json['modello'] ?? 'Sconosciuto',
      marca: json['marca'] ?? 'Generica',
      // Gestisce sia se arriva come int sia come double
      prezzo: (json['prezzo'] is int)
          ? (json['prezzo'] as int).toDouble()
          : (json['prezzo'] as double? ?? 0.0),
      lunghezza: json['lunghezza'] ?? "Standard",
      volume: json['volume'] ?? "Standard",
      disponibile: json['disponibile'] ?? true,
      urlImmagine: json['url_immagine'] ?? '',
    );
  }

  // Da Oggetto Dart a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'modello': modello,
      'marca': marca,
      'prezzo': prezzo,
      'lunghezza': lunghezza,
      'volume': volume,
      'disponibile': disponibile,
      'url_immagine': urlImmagine,
    };
  }
}