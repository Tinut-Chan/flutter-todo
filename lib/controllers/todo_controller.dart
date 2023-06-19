import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TodoController extends GetxController {
  final searchEditingController = TextEditingController().obs;
  var todos = List<Todo>.empty().obs;
  // ConnectivityResult connectionStatus = ConnectivityResult.none;
  // final Connectivity connectivity = Connectivity();
  // var isConnected = false.obs;
  // late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void onInit() {
    // connectivitySubscription =
    //     Connectivity().onConnectivityChanged.listen((event) {
    //   if (event == ConnectivityResult.wifi ||
    //       event == ConnectivityResult.mobile) {
    //     isConnected.value = true;
    //   } else {
    //     isConnected.value = false;
    //   }
    // });
    List? storedTodos = GetStorage().read<List>('todo');
    if (storedTodos != null) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos, (_) {
      GetStorage().write('todo', todos.toList());
    });
    super.onInit();
  }

  final results = <Todo>[].obs;
  void filterList(String searchText) {
    if (searchText.isEmpty) {
      results.value = todos;
    } else {
      results.value = todos
          .where((item) => item.text!.toLowerCase().contains(
                searchText.toLowerCase(),
              ))
          .toList();
    }
  }

  varClear() {
    searchEditingController.value.clear();
  }

  // final todo = FirebaseDatabase.instance.reference();
  // submitData() {
  //   todo.child('items').add(items);
  // }

  // Future<void> initConnectivity() async {
  //   late ConnectivityResult result;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     result = await connectivity.checkConnectivity();
  //   } on PlatformException catch (e) {
  //     debugPrint('Couldn\'t check connectivity status, $e');
  //     return;
  //   }

  //   return updateConnectionStatus(result);
  // }

  // Future<void> updateConnectionStatus(ConnectivityResult result) async {
  //   connectionStatus = result;
  // }

  // @override
  // void dispose() {
  //   connectivitySubscription.cancel();
  //   super.dispose();
  // }
}
