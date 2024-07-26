import 'package:blogappflutterandwp/services/wp-api.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: fetchwpPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  Map w
                },
              )
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
