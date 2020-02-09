import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';

class CounterBlocApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CounterBlocAppState();
}

class CounterBlocAppState extends State<CounterBlocApp> {

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Counter',
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: CounterPage(),
      )
    );
}

class CounterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //ignore:close_sinks
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(
        builder: (counterBloc, count) {
          return Center(
            child: Text('$count',
            style: TextStyle(fontSize: 20.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                counterBloc.add(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                counterBloc.add(CounterEvent.decrement);
              },
            ),
          ),
        ],
      ),
    );
  }
}