import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class Todo extends Equatable {
  final String id;
  final String desc;
  final bool completed;

  Todo({
    String? id,
    required this.desc,
    this.completed = false, // completed의 기본값을 false로 지정 -> 생성할 때 completed의 값을 지정하지 않으면 기본으로 false로 설정
  }) : id = id ?? uuid.v4(); // id가 주어지는 경우 해당 id를 사용하고 아니면 uuid로 생성

  @override
  List<Object> get props => [id, desc, completed];

  @override
  bool get stringify => true;
}

enum Filter { all, active, completed }
