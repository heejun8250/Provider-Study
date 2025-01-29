import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:todo_provider/models/todo_model.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  TodoFilterState({required this.filter});

  factory TodoFilterState.initial() {
    return TodoFilterState(filter: Filter.all);
  } // 처음엔 필터를 적용하지 않음

  @override
  List<Object> get props => [Filter];

  @override
  bool get stringify => true;

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }
}

class TodoFilter with ChangeNotifier {
  TodoFilterState _state = TodoFilterState.initial();
  TodoFilterState get state => _state;

  // all, active, completed 탭을 클릭할 때 마다 filter가 newFilter인 새로운 _state를 만들고 변경사항을 알림
  void changeFilter(Filter newFilter) {
    _state = _state.copyWith(filter: newFilter);
    notifyListeners();
  }
}
