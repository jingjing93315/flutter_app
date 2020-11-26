import 'dart:convert';

// 暗号哦：不用背，学规律
class Section {
  final String logo;
  final String name;
  final String location;
  final String type;
  final String size;
  final String employee;
  final String hot;
  final String count;
  final String inc;

  Section(
      {this.logo,
      this.name,
      this.location,
      this.type,
      this.size,
      this.employee,
      this.hot,
      this.count,
      this.inc});

  static List<Section> resolveDataFromJsonString(String json) {
    List<Section> listModel = new List<Section>();
    List list = jsonDecode(json)['list'];
    list.forEach((element) {
      var model = Section(
          logo: element['logo'],
          name: element['name'],
          location: element['location'],
          type: element['type'],
          size: element['size'],
          employee: element['employee'],
          hot: element['hot'],
          count: element['count'],
          inc: element['inc']);

      listModel.add(model);
    });
    return listModel;
  }
}
