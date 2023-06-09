import "dart:convert";

import "package:agro_millets/globals.dart";
import "package:agro_millets/models/millet_item.dart";
import "package:agro_millets/secrets.dart";
import "package:http/http.dart" as http;

class SearchManager {
  Future<List<MilletItem>> search(String query) async {
    var response = await http.get(
      Uri.parse("$API_URL/search/$query"),
    );
    var data = json.decode(response.body);

    List<MilletItem> list = [];
    if (data["statusCode"] == 200) {
      List dataList = data["data"];
      for (var e in dataList) {
        list.add(MilletItem.fromMap(e));
      }
    } else {
      showToast(data.data['message']);
    }

    return list;
  }
}
