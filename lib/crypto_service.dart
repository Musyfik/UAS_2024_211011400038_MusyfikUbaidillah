import 'dart:convert';
import 'package:http/http.dart' as http;
import 'crypto.dart';

class CryptoService {
  final String apiUrl = 'https://api.coinlore.net/api/tickers/';

  Future<List<Crypto>> fetchCryptos() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body)['data'];
      return json.map((cryptoJson) => Crypto.fromJson(cryptoJson)).toList();
    } else {
      throw Exception('Failed to load cryptos');
    }
  }
}
