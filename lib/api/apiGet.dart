import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class apiGetCall extends StatefulWidget {
  const apiGetCall({Key? key}) : super(key: key);

  @override
  State<apiGetCall> createState() => _apiGetCallState();
}

class _apiGetCallState extends State<apiGetCall> {
  var _postsJson = [];

  void fetchPosts()async{
    try{
      final response = await get(
      Uri.parse('https://discord.com/api/v9/channels/1027584170463068213/messages?limit=50'),
      headers: {
        HttpHeaders.authorizationHeader: 'NzkyNTA0NDc2MzE3Mzg0Nzg0.GGa_8a.cK0-Ky26WkV5Y2jGC7fjmOqGD3Z7LfgbxEZXHQ',
      }
  );
      
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err){}
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 11, 12, 14),
        body: ListView.builder(
          itemCount: _postsJson.length,
          itemBuilder: (context, i) {
            final post = _postsJson[i];
            return Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 25, right: 10),
              child: Container(
                padding: EdgeInsets.all(12),
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 20, 22, 26),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network("https://cdn.discordapp.com/avatars/${post["author"]["id"]}/${post["author"]["avatar"]}", width: 50,)
                      ),
                    ),
                  // nazwa
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${post["author"]["username"]}: ", 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                    Text("${post["content"]}", 
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 18
                      ),
                    ),
                    ],
                  ),
                ),],
              ),
            ),
          );}
        ),
      ),
    );
  }
}

