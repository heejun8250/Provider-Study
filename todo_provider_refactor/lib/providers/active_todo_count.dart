import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_provider_refactor/models/todo_model.dart';
import 'package:todo_provider_refactor/providers/providers.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

  ActiveTodoCountState({required this.activeTodoCount});

  factory ActiveTodoCountState.initial() {
    return ActiveTodoCountState(activeTodoCount: 0);
  }

  @override
  List<Object> get props => [activeTodoCount];

  @override
  bool get stringify => true;

  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}

class ActiveTodoCount {
  // todoList 인스턴스가 필요하므로 construct를 통해 전달받는 형태로 수정
  // ProxyProvider의 update에서 매번 새로운 activeTodoCount 오브젝트를 생성하므로 update 함수 삭제

  final TodoList todoList;

  ActiveTodoCount({required this.todoList});

  ActiveTodoCountState get state => ActiveTodoCountState(activeTodoCount: todoList.state.todos.where((Todo todo) => !todo.completed).toList().length);
}
