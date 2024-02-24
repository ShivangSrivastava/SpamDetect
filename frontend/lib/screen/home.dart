import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // getResponse() async {
  //   http.Response response = await http.post(
  //     Uri.parse("http://127.0.0.1:8000/api/perfomance"),
  //     headers: {"Content-Type": "application/json"},
  //     body: '{"number_of_courses": $numberOfCourse,"time_study": $time}',
  //   );
  //   if (response.statusCode == 200) {
  //     marks = jsonDecode(response.body)['marks'];
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MarksForecast"),
      ),
    );
  }
}
