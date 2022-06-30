class Poke {
  int? id;
  String? name;
  String? url;
  String? imgUrl;
  String? type;

  Poke({this.id, this.name, this.url, this.imgUrl, this.type});

  Poke.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    imgUrl = json['sprites']['front_default'];
    type = json['types'][0]['type']['name'];
  }

  @override
  String toString() {
    return "id: $id |"
        "name: $name |"
        "url: $url |"
        "imgUrl: $imgUrl |"
        "type: $type";
  }
}
