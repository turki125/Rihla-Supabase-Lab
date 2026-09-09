import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:turki_mohammed_project1/models/place_model.dart';

class Database {
  final supabase = Supabase.instance.client;

  Future<List<PlaceModel>> getPlaceScreen() async {
    final data = await supabase.from('places').select();

    List<PlaceModel> allplaces = [];

    for (var element in data) {
      PlaceModel places = PlaceModel.fromJson(element);
      allplaces.add(places);
    }

    return allplaces;
  }
}
