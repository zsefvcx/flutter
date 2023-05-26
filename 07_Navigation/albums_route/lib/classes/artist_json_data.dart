
class ArtistData{
  final int id;
  final String name;
  final String about;

  static List<ArtistData> artistsData = [];

  ArtistData(this.id, this.name, this.about);

  static void fromJson(dynamic data){
    if (data is List<dynamic>){
      for (var element in data) {
        if (element is Map<String, dynamic>){
          if( element['id'         ]!=null && element['id'         ] is int
              && element['name'       ]!=null && element['name'       ] is String
              && element['description']!=null && element['description'] is String
          ){
            artistsData.add(ArtistData(
                element['id'] as int,
                element['name'] as String,
                element['description'] as String));
          }
        }
      }
    }
  }
}