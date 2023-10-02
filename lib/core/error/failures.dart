import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message});

  @override
  List<Object?> get props => [message];

  @override
  String toString() => message ?? '';
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'Seems you have connection issue',
  });

  @override
  List<Object?> get props => [message];

  @override
  String toString() => 'NetworkFailure($message)';
}
