import 'dart:convert';
import 'package:http/http.dart';
class FetchMeme{
  static fetchNewMeme()async{
    Response responce = await get(Uri.parse("https://meme-api.com/gimme"));
    Map body_data = jsonDecode(responce.body);
    return body_data["url"];

  }
}