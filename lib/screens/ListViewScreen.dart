import 'package:flutter/material.dart';
import 'package:fluttersigmaapp/StateManagement/SearchState.dart';
import 'package:fluttersigmaapp/screens/ListScreen.dart';
import 'package:provider/provider.dart';

class ListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => SearchState(),
      child: ListScreen(),
    );
  }
}
