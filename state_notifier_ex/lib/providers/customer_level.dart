import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_ex/providers/counter.dart';

enum Level { bronze, silver, gold }

// 별도로 state용 class를 만들지 않고 level 자체를 state로 사용한다.


// 현재 counter에 값에 따라 level이 정해짐
// computed state
// 이 state를 변하게 하기 위해 액션을 할 필요가 없다.
class CustomerLevel extends StateNotifier<Level> with LocatorMixin {
  CustomerLevel() : super(Level.bronze);

  @override
  void update(Locator watch) {
    final currentCounter = watch<CounterState>().counter;

    if (currentCounter >= 100) {
      state = Level.gold;
    } else if (currentCounter >= 50 && currentCounter < 100) {
      state = Level.silver;
    } else {
      state = Level.bronze;
    }

    super.update(watch);
  }
}