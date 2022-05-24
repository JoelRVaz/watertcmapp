import 'package:equatable/equatable.dart';
import 'package:watertcmapp/constants/enums/connection.dart';

void main() {
  print("object");
  test test1 = test(Connection.bluetooth);
  test test2 = test(Connection.bluetooth);
  print(test2 == test1);
}

// ignore: camel_case_types, must_be_immutable
class test extends Equatable {
  Connection connection;
  test(this.connection);

  @override
  List<Object> get props => [connection];
}
