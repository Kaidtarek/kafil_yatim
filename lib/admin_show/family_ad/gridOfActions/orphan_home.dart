import 'dart:ffi';

import 'package:flutter/material.dart';

class orphan_info extends StatelessWidget {
  const orphan_info({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Text('',style: TextStyle(fontSize: 20),),
          ),
          Expanded(
            child: Text("""
                here we have to add list of any family from firebase
                after pressing we have to do :
            """,style: TextStyle(fontSize: 20),),
          ),
          Expanded(flex: 8,child: Image.asset('assets/todo.jpg')),
        ],
      ),
    );
  }
}
