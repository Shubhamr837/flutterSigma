import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttersigmaapp/Models/Model.dart';
import 'package:fluttersigmaapp/SqfliteDatabase/SqfDatabase.dart';
import 'package:fluttersigmaapp/StateManagement/SearchState.dart';
import 'package:fluttersigmaapp/widget/ListItem.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {


  SearchState _controller;

  TextEditingController _textController = TextEditingController();

  Future<List<Model>> _fetchList() async {
    List<Model> list = await DBProvider.db.getAllModels();
    if (list.length == 0) {
      final response = await http.get('https://sigmatenant.com/mobile/tags');
      if (response.statusCode == 200) {
        List<Model> list;

        List rest =jsonDecode(response.body)['tags'] as List;
        print(rest);

        list = rest.map((tagJson) => Model.modelFromJson(tagJson)).toList();
        print(list);

        for (int i = 0; i < list.length; i++)
          DBProvider.db.newModel(list[i]);
        return list;
      }
    } else
      return list;
  }
  onItemChanged(String value) {

      _controller.search(value);
  }

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<SearchState>(context);

    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Container(
            alignment: Alignment.centerLeft,
            color: Colors.blueAccent,
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Here...',
              ),
              onChanged: onItemChanged,
            ),
          ),
        ),
        body: FutureBuilder(
          future: _fetchList(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              {
                _controller.setmodelsWithoutNotifiying(snapshot.data);

                return Consumer<SearchState>(
                builder: (context, controller, _) => Container(
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.models.length,
                    itemBuilder: (BuildContext context, int index) {

                      return ListItem(controller.models[index]);
                    },
                  ),
                ),
              );}
            else
              return Center(
                  child: CircularProgressIndicator());
          },
        ));
  }
}
