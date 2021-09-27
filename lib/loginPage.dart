import 'package:flutter/material.dart';
import 'APIDetails.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      home: HomePage(),
      theme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:TextButton(
        onPressed: () {},
        child: Text('Edit Profile'),
      ) ,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: ()=>Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => WeatherPage())),
              child: Text('DIO API'),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(150.0, 40.0)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.indigo)),
            ),
          ],
        ),
      ),
    );
  }
}
