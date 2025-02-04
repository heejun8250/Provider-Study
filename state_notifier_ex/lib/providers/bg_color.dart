import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class BgColorState extends Equatable {
  final Color color;

  BgColorState({required this.color});

  @override
  List<Object> get props => [color];

  @override
  bool get stringify => true;

  BgColorState copyWith({
    Color? color,
  }) {
    return BgColorState(
      color: color ?? this.color,
    );
  }
}

// ChangeNotifier와 다른 점은 StateNotifier는 핸들링할 State의 타입을 지정한다.
class BgColor extends StateNotifier<BgColorState> {

  // super에 주는 값이 초기 state이다.
  BgColor() : super(BgColorState(color: Colors.blue));
  // 초기 state값을 외부에서 받고자 한다면 BgColor()에 state를 전달하고 그 값을 이용해 state를 셋팅한다.
  // ex) BgColor(BgColorState initialState) : super(initialState); => 외부에서 받은 값을 초기 상태로 설정

  // state를 정의하지 않았지만 사용할 수 있다.
  void changeColor() {
    if (state.color == Colors.blue) {
      state = state.copyWith(color: Colors.black);
    } else if (state.color == Colors.black) {
      state = state.copyWith(color: Colors.red);
    } else {
      state = state.copyWith(color: Colors.blue);
    }
  }
}