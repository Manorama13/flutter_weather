import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage._();

  static Route<String> route() {
    return MaterialPageRoute(builder: (_) => const SearchPage._());
  }

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
iconTheme: IconThemeData(color: Colors.black),
          title: const Text('City Search',style: TextStyle(color: Colors.black),)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchBar(
              controller: _textController,
              leading: const Icon(Icons.search),
              shadowColor: MaterialStateProperty.all(Colors.blue),
              elevation: MaterialStateProperty.all(8.0),
              shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
              ),
              hintText: 'Type city',
              hintStyle: MaterialStateProperty.all(const TextStyle(color: Colors.grey)),

              trailing: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                   setState(() {
                     _textController.clear();
                   });
                  },
                ),

              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop(_text);
              },
              child: Container(
                height: 45,width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue
                ),
                child: Center(child: Text("Submit",
                style: TextStyle(
                  fontSize: 18,color: Colors.white
                ),
                )),
              ),
            ),
          )

        ],
      ),
    );
  }
}
