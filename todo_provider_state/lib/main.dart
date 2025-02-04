import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_state/pages/todo_page.dart';
import 'package:todo_provider_state/providers/providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<TodoFilter, TodoFilterState>(
          create: (context) => TodoFilter(),
        ),
        StateNotifierProvider<TodoSearch, TodoSearchState>(
          create: (context) => TodoSearch(),
        ),
        StateNotifierProvider<TodoList, TodoListState>(
          create: (context) => TodoList(),
        ),
        StateNotifierProvider<ActiveTodoCount, ActiveTodoCountState>(
          create: (context) => ActiveTodoCount(),
        ),
        StateNotifierProvider<FilteredTodos, FilteredTodosState>(
          create: (context) => FilteredTodos(),
        ),
      ],
      child: MaterialApp(
        title: 'TODOS',
        debugShowCheckedModeBanner: false,
        home: const TodosPage(),
      ),
    );
  }
}
