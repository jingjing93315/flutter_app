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

  static List<Section> fromMapData(Map data) {
    List<Section> listModel = new List<Section>();
    List list = data['list'];
    list.forEach((element) {
      var model = Section(
          logo: element['logo_url'],
          name: element['market_name'],
          location: element['download_times_fixed'],
          type: element['type'],
          size: element['tag'],
          employee: element['market_id'],
          hot: element['download_times_fixed'],
          count: element['cid2'],
          inc: element['baike_name']);

      listModel.add(model);
    });
    return listModel;
  }
}
