class ProductCategory {
  late int idProductCategory;
  late String name;

  ProductCategory({required this.idProductCategory,required this.name});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    idProductCategory = json['IdProductCategory']??0;
    name = json['Name']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdProductCategory'] = this.idProductCategory;
    data['Name'] = this.name;
    return data;
  }
}