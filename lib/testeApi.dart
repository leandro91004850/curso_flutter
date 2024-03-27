import 'package:http/http.dart' as http;
import 'dart:convert';

 class ApiService {

  Future<String> testeApi() async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var request = http.Request(
        'GET', Uri.parse('https://pokeapi.co/api/v2/pokemon/ditto'));
    //request.body = json.encode({"cnpj_cpf": "00.000.000/0001-00"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 200) {
      //return await response.stream.bytesToString();
      //get element in especific key
      String nome = jsonDecode(await response.stream.bytesToString())['name'];
      return nome;
    } else {
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }
  
}
