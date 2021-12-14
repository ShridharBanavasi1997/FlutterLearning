
import 'package:flutter_bloc_example_2/models/albums_list.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

abstract class AlbumsRepo{
  Future<List<Album>> getAlbumList();
}

class AlbumServices implements AlbumsRepo{
  static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const String _GET_ALBUMS = '/albums';

  @override
  Future<List<Album>> getAlbumList() async {
    Uri uri = Uri.https(_baseUrl, _GET_ALBUMS);
    Response response = await http.get(uri);
    List<Album> albums = albumFromJson(response.body);
    return albums;
  }


}