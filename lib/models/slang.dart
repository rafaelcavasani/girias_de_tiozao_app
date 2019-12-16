import 'dart:convert';

import 'package:http/http.dart' as http;

class Slang {
    String name;
    String slang;

  	Slang(this.name, this.slang);

    static Future<List<Slang>> findAll() async {
        var uri = 'https://girias-de-tiozao.herokuapp.com/girias';
        var response = await http.get(uri);
        Iterable list = json.decode(response.body);
        List<Slang> slangs = list.map((model) => Slang.fromJson(model)).toList();
        return slangs;
    }

    static Future insertOne(Slang slang) async {
        var uri = "https://girias-de-tiozao.herokuapp.com/girias";
        return await http.post(uri, body: {"nome": slang.name, "giria": slang.slang});
    }

    Slang.fromJson(Map<String, dynamic> json) {
        name = json['nome'];
        slang = json['giria'];
    }

    @override
    String toString() {
        return 'Slang{name: $name, slang: $slang}';
    }
}
