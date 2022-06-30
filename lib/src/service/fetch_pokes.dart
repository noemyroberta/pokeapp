import '../model/poke_model.dart';
import 'package:http/http.dart' show get;
import 'dart:convert' as convert;

Future<List<Poke>?> fetchPokes() async {
  const domain = 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=100';
  List<Poke>? pokes = [];

  final response = await get(Uri.parse(domain));

  if (response.statusCode == 200) {
    final map = _decodeJson(response);

    for (Map<String, dynamic> item in map['results']) {
      final result = await get(Uri.parse(item['url']));
      final pokeData = _decodeJson(result);
      pokes.add(Poke.fromJson(pokeData));
    }

    return pokes;
  }
}

_decodeJson(response) {
  return convert.json.decode(convert.utf8.decode(response.bodyBytes));
}
