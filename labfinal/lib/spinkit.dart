import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
final spinkit = SpinKitThreeInOut(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.blue : Colors.lightBlueAccent,
      ),
    );
  },
);
final save = SpinKitThreeInOut(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.blue : Colors.lightBlueAccent,
      ),
    );
  },
);