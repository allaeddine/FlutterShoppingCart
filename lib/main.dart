import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shopping_cart/shopping_cart_app.dart';
import 'package:flutter_shopping_cart/reducers.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

void main() {
  final store = new DevToolsStore<List<String>>(addItemReducer,
      initialState: new List());

//  final store = new Store<List<String>>(addItemReducer,
//      initialState: new List());

  runApp(new FlutterReduxApp(store));
}

class FlutterReduxApp extends StatelessWidget {
  final DevToolsStore<List<String>> store;

  FlutterReduxApp(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<List<String>>(
      store: store,
      child: new ShoppingCartApp(store),
    );
  }
}
