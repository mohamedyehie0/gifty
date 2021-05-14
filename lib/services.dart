import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class services {

  getData(url) async {
    http.Response response = await http.get(url);
    return response.body;
  }

  recomend() async {
    var data = await getData(Uri.https('10.0.2.2:5000', '/api',
        {"Query": "DB Longboards Contra Drop Deck Maple Longboard Complete"}));
//var data2 = await getData(Uri.https('10.0.2.2:5000', '/all'));


    var mapedData = new List();

    var decodedData = convert.jsonDecode(data);

    for (int i = 0; i < decodedData.length; i++) {
      mapedData.add({
        "Uniq Id": decodedData["$i"][0],
        "Product Name": decodedData["$i"][1],
        "Category": decodedData["$i"][2],
        "Selling Price": decodedData["$i"][3],
        "About Product": decodedData["$i"][4],
        "Technical Details": decodedData["$i"][5],
        "Image Url": decodedData["$i"][5],
        "Product Url": decodedData["$i"][6]
      });
    }

    //print(mapedData.runtimeType);
    return mapedData;
  }

  all(List answer) async {
    var data2 = await getData(Uri.https('10.0.2.2:5000', '/all'));
    var decodedData2 = convert.jsonDecode(data2);

    var mapedData2 = new List();


    for (int i = 1; i < decodedData2.length; i++) {
      mapedData2.add({
        //"Uniq Id": decodedData2["$i"][0],
        "Product Name": decodedData2["$i"][0],
        "Category": decodedData2["$i"][1],
        "Selling Price": decodedData2["$i"][2],
        "About Product": decodedData2["$i"][3],
        "Technical Details": decodedData2["$i"][4],
        "Image Url": decodedData2["$i"][5],
        "Product Url": decodedData2["$i"][6]
      });
      // print(mapedData2[j]["Selling Price"]);
      // j++;
    }

    var newData, recommendedData;
    newData = new List();
    recommendedData = new List();

    //var data = all();
    //  if (double.parse(mapedData2[5]["Selling Price"]) <= 20.0){
    //    var x = double.parse(mapedData2[5]["Selling Price"]);
    //    print(x.runtimeType);
    //    }


    for (int i = 1, j = 0; i < mapedData2.length; i++) {
      if (double.parse(mapedData2[i]["Selling Price"]) <= 20.0) {
        if (answer[1] <= 8) {
          if (mapedData2[i]["Category"] == "Baby Products ") {
            //print(mapedData2[i]["Product Name"]);
            recommendedData.add(mapedData2[i]);
            //print(recommendedData[j]["Product Name"]);
            j++;
          }
        } else if (answer[1] > 8 && answer[1] <= 16) {
          if (mapedData2[i]["Category"] == "Baby Products " ||
              mapedData2[i]["Category"] == "Toys & Games ") {
            recommendedData.add(mapedData2[i]);
            //print(recommendedData[j]["Product Name"]);
            //     print(recommendedData[j]);
            j++;
          }
        } else if (mapedData2[i]["Category"] != "Baby Products " &&
            mapedData2[i]["Category"] != "Toys & Games ") {
          newData.add(mapedData2[i]);
          //print(newData[j]["Category"]);
          //     print(newData[j]);
          j++;
        }
      }
    }
        if (answer[1] > 16) {
          for (int j = 0, i = 0; i < newData.length; i++) {
            for(int z = 2; z < answer.length; z++) {
              if (newData[i]["Category"] == answer[z]) {
                recommendedData.add(newData[i]);
                print(recommendedData[j]["Category"]);
                j++;
              }
            }
          }
        }
      }


//print(test);
      //print(mapedData2.runtimeType);

      //return mapedData2;



    // makeRecommend(List answer) {
    //   var newData, recommendedData;
    //   newData = new List();
    //   recommendedData = new List();
    //
    //   var data = all();
    //
    //   for (int i, j = 0; i < data.length; i++) {
    //     if (data[i]["Selling Price"] <= answer[0]) {
    //       if (answer[1] < 8) {
    //         if (data[i]["Category"].containsValue("Baby Product")) {
    //           recommendedData[j] = data[i];
    //           print(recommendedData[j]);
    //           j++;
    //         }
    //       } else if (answer[1] > 8 && answer[1] < 16) {
    //         if (data[i]["Category"].containsValue("Baby Product") ||
    //             data[i]["Category"].containsValue("Toys & Games")) {
    //           recommendedData[j] = data[i];
    //           print(recommendedData[j]);
    //           j++;
    //         }
    //       } else {
    //         if (!data[i]["Category"].containsValue("Baby Product") &&
    //             !data[i]["Category"].containsValue("Toys & Games")) {
    //           newData[j] = data[i];
    //           print(newData[j]);
    //           j++;
    //         }
    //       }
    //     }
    //   }
    //   if (answer[1] > 16) {
    //     for (int j, z ,  i = 0; i < newData.length; i++) {
    //       if (newData[i]["Category"] == answer[z]) {
    //         recommendedData[j] = newData[i];
    //         print(recommendedData[j]);
    //         j++;
    //         z ++;
    //       }
    //     }
    //   }
    //   //return recommendedData;
//  }
  }
