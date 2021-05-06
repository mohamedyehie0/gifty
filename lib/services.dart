import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future getData(url) async {
  http.Response response = await http.get(url);
  return response.body;
}

void recomend() async {
  var data = await getData(Uri.https('10.0.2.2:5000', '/api',
      {"Query": "DB Longboards Contra Drop Deck Maple Longboard Complete"}));
//var data2 = await getData(Uri.https('10.0.2.2:5000', '/all'));

  Map decodedData = convert.jsonDecode(data);

  for (int i = 0; i < decodedData.length; i++) {
//var decodedData = convert.jsonDecode(data);
    print(decodedData["$i"][0]);
  }
}

void all() async {
  var data2 = await getData(Uri.https('10.0.2.2:5000', '/all'));
  var decodedData2 = convert.jsonDecode(data2);

  var Data = new List();

//String test= decodedData["0"][0];
//Data ={"x": test};
  for (int i = 0; i < decodedData2.length; i++) {
// Data = [{"Uniq Id" : test, "Product Name" : test, "Category" : test},
//   {"Uniq Id" : test, "Product Name" : test, "Category" : test}];

    Data.add({
      "Uniq Id": decodedData2["$i"][0],
      "Product Name": decodedData2["$i"][1],
      "Category": decodedData2["$i"][2],
      "Selling Price": decodedData2["$i"][3],
      "About Product": decodedData2["$i"][4],
      "Technical Details": decodedData2["$i"][5],
      "Image Url": decodedData2["$i"][5],
      "Product Url": decodedData2["$i"][6]
    });
// Data[i] = {"Product Name" : decodedData["$i"][1]};
// Data[i] = {"Category" : decodedData["$i"][2]};
// Data[i]["Selling Price"]= decodedData["$i"][3];
// Data[i]["About Product"]= decodedData["$i"][3];
// Data[i]["Technical Details"]= decodedData["$i"][4];
// Data[i]["Image Url"]= decodedData["$i"][5];
// Data[i]["Product Url"]= decodedData["$i"][6];
  }

//print(test);
  print(Data[2]["Image Url"]);
}


_makeRecommend(Map data, Map answer) {
  Map newData, recommendedData;
  for (int i, j = 0; i < data.length; i++) {
    if (data[i]["Selling Price"] <= answer["Selling Price"])
      if (data[i]["About Product"].containsValue(answer["category"])) {
        newData[j] = data[i];
        j++;
      }
  }
  for (int j, i = 0; i < newData.length; i++) {
    if (newData[i]["category"].containsValue("toys") && answer["kind"]=="kids") {
      recommendedData[j] = newData[i];
      j++;
    } //end if
  } //end for
  for (int j, i = 0; i < newData.length; i++) {
    if (newData[i]["category"].containsValue("Jewelry") && answer["kind"]=="Women") {
      recommendedData[j] = newData[i];
      j++;
    } //end if
  } //end for
  for (int j, i = 0; i < newData.length; i++) {
    if (newData[i]["category"].containsValue("حاجات رجالي شوف انت بقي ") && answer["kind"]=="Women") {
      recommendedData[j] = newData[i];
      j++;
    } //end if
  } //end for
  return recommendedData;
}