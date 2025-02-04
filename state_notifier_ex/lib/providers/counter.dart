import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_ex/providers/bg_color.dart';

class CounterState extends Equatable {
  final int counter;

  CounterState({required this.counter});

  @override
  List<Object> get props => [counter];

  @override
  bool get stringify => true;

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}

// LocatorMixin : read, watch를 StateNotifier에서 사용할 수 있게 해준다.
class Counter extends StateNotifier<CounterState> with LocatorMixin {
  Counter() : super(CounterState(counter: 0));

  void increment() {
    print(read<BgColor>().state);

    Color currentColor = read<BgColor>().state.color;

    if (currentColor == Colors.black) {
      state = state.copyWith(counter: state.counter + 10);
    } else if (currentColor == Colors.red) {
      state = state.copyWith(counter: state.counter - 10);
    } else {
      state = state.copyWith(counter: state.counter + 1);
    }
  }

  @override
  void update(Locator watch) {
    print('in Counter StateNotifier: ${watch<BgColorState>().color}');
    print('in Counter StateNotifier: ${watch<BgColor>().state.color}');
    super.update(watch);
  }
  // 다른 객체의 상태 변화를 감지할 수 있는 라이프사이클을 제공한다. => Counter가 BgColor의 변경 사항을 감지, update는 BgColor가 변경될 때마다 실행됨
  // Flutter의 Provider 패키지에서 ProxyProvider가 하는 역할과 동일하지만, Flutter에 의존하지 않는다.
  // update 내부에서는 read()를 사용할 수 없다.
}