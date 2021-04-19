import 'package:http/http.dart'; 
// convert JSON data by jsonDecode()
import 'dart:convert';


//model to fetch data from any url
class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
    
  //fetch promise data from API by getData()
  Future getData() async {
    //get() from http package
    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
    print(response.statusCode);
   }
  } 
}


