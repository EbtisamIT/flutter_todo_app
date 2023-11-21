

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/home.dart';

void main() {runApp(MaterialApp(
  home: Home(),
));

}

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(
         SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,

    );

  }

