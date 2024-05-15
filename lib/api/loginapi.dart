import 'package:dio/dio.dart';

Future<int?> loginUser(String email,String pass) async {
  // Instantiate Dio
  Dio dio = Dio();

  // Define the API URL
  String apiUrl = 'https://job-backend-skpz.onrender.com/login/';

  try {
    // Make the POST request
    Response response = await dio.post(
      apiUrl,
      data: {
        "email": email,
        "password": pass
      },
      options: Options(headers: {
        'Content-Type': 'application/json',
      }),
    );

    // Handle response
    if (response.statusCode == 200) {
      // Request successful, do something with the response
      print('Login successful');
      // Access response data
      print(response.data);
      return response.data['userId'];
    } else {
      // Request failed
      print('Failed to login: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    // Error occurred
    print('Error logging in: $e');
    return null;
  }
}
