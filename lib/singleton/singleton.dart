import 'package:http/http.dart' as http;

class SingletonNetworkCall {
  //Make a private constructor to prevent making new object
  SingletonNetworkCall._();

  //Create a static creation method that acts as a constructor

  static final SingletonNetworkCall _instance = SingletonNetworkCall._();

  //A factory constructor can return either a new instance or an existing instance
  //A factory constructor can decide whether to create a new instance or return an existing one
  //In this setup, every time you call SingletonNetworkCall(), the factory constructor checks the static _instance and returns it instead of creating a new object.
  factory SingletonNetworkCall() {
    return _instance;
  }

  //We can use getter instead of factory
  //with a getter, you call SingletonNetworkCall.instance rather than SingletonNetworkCall()
  //Do not use both
  static SingletonNetworkCall get instance => _instance;

  //use it
  Future<http.Response> makeNetworkCall(String url) async {
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    return response;
  }
}
