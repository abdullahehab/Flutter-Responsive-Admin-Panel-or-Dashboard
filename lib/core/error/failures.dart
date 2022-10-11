import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure({this.mess});
  final String? mess;

  @override
  List<Object?> get props => [mess];
}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnauthorizedFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnAuthFailure extends Failure {
  UnAuthFailure({required this.mess}) : super(mess: mess);
  final String mess;
  @override
  List<Object?> get props => [mess];
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required this.mess}) : super(mess: mess);
  final String mess;
  @override
  List<Object?> get props => [mess];
}

class UnknownFailure extends Failure {
  @override
  List<Object?> get props => [];
}
