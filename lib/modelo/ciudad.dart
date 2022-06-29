class Ciudad {
  int? idcity;
  String? name;
  int? idcountry;

  Ciudad({this.idcity, this.name, this.idcountry});

  Ciudad.fromJson(Map<String, dynamic> json) {
    idcity = json['idcity'];
    name = json['name'];
    idcountry = json['idcountry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idcity'] = idcity;
    data['name'] = name;
    data['idcountry'] = idcountry;
    return data;
  }
}