import 'package:flutter/material.dart';
import '../Models/Model.dart';

class ListItem extends StatelessWidget {
  final Model model;

  ListItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width*0.9,
      color: Colors.white,
      child: Card(
        elevation: 5,
        color: Colors.white,
        margin: EdgeInsets.all(6),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    model.displayName,
                    style: TextStyle(
                        color: Colors.redAccent, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.red,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.6,
                child: model.meta==null?Container(): Text(
                  model.meta,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  model.description,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  "spaces",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
