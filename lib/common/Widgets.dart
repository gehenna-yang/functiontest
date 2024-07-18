
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testfun_project/Config.dart';

Widget Item(BuildContext context, String page_name, StatefulWidget _fn){
  return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.only(left: 10),
          color: Colors.black12,
          width: full_w, height: 40, alignment: Alignment.centerLeft,
          child: Text(page_name, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => _fn));
        },
      )
  );
}