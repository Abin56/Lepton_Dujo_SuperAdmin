import 'package:flutter/material.dart';

schoolControllerDetail(BuildContext context)async{
  return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('School Controller details'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
   },
);

}