import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/board.dart';

class ApiService {
  // URL API Mock
  static const String _baseUrl = 'https://69846b7e885008c00db120c3.mockapi.io/api/v1';
  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  // Chiave per salvare i dati locali sul telefono
  static const String _localBoardsKey = 'local_added_boards';

  // Scarica le tavole API e Locale
  // Corregge "argument type map can't be assigned to SurfBoard"
  Future<List<SurfBoard>> getBoards() async {
    List<SurfBoard> allBoards = [];

    // scaricare dall'API
    try {
      final response = await _dio.get('/Exam1');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        // Controlla la struttura della API
        if (data.isNotEmpty && data[0]['boards'] != null) {
          final List<dynamic> boardsJson = data[0]['boards'];
          // Converte in oggetti SurfBoard
          allBoards.addAll(boardsJson.map((json) => SurfBoard.fromJson(json)).toList());
        }
      }
    } catch (e) {
      debugPrint('Errore API (uso solo dati locali): $e');
    }

    // recupera le tavole
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? localString = prefs.getString(_localBoardsKey);
      if (localString != null) {
        List<dynamic> localJson = jsonDecode(localString);
        allBoards.addAll(localJson.map((json) => SurfBoard.fromJson(json)).toList());
      }
    } catch (e) {
      debugPrint('Errore Local Storage: $e');
    }

    return allBoards;
  }

  //Aggiunge una tavola solo in locale
  // Corregge "addBoard isn't defined"
  Future<void> addBoard(SurfBoard newBoard) async {
    final prefs = await SharedPreferences.getInstance();

    List<SurfBoard> localBoards = [];
    final String? localString = prefs.getString(_localBoardsKey);

    if (localString != null) {
      List<dynamic> localJson = jsonDecode(localString);
      localBoards = localJson.map((json) => SurfBoard.fromJson(json)).toList();
    }

    localBoards.add(newBoard);

    // Salva la lista
    String encodedData = jsonEncode(localBoards.map((b) => b.toJson()).toList());
    await prefs.setString(_localBoardsKey, encodedData);
  }

  //Login Semplificato
  // Corregge "checkLogin isn't defined"
  String? checkLogin(String user, String pass) {
    if (user == 'admin' && pass == '1234') {
      return 'admin';
    }
    return null;
  }
}