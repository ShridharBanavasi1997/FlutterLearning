
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example_2/api/exceptions.dart';
import 'package:flutter_bloc_example_2/api/services.dart';
import 'package:flutter_bloc_example_2/bloc/albums/events.dart';
import 'package:flutter_bloc_example_2/bloc/albums/states.dart';
import 'package:flutter_bloc_example_2/models/albums_list.dart';

class AlbumsBloc extends Bloc<AlbumsEvents,AlbumsState>{

  final AlbumsRepo albumsRepo;
  late List<Album> albums;

  AlbumsBloc({required this.albumsRepo}) : super(AlbumsInitState());


  @override
  Stream<AlbumsState> mapEventToState(AlbumsEvents event) async*{
    switch(event){
      case AlbumsEvents.fetchAlbums:
        yield AlbumsLoading();
        try{
          albums= await albumsRepo.getAlbumList();
          yield AlbumsLoaded(albums: albums);
        }on SocketException {
          yield AlbumsListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield AlbumsListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield AlbumsListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield AlbumsListError(
            error: UnknownException('Unknown Error'),
          );
        }

        break;
    }
  }

}