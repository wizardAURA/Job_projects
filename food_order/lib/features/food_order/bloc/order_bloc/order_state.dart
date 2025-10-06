import 'package:equatable/equatable.dart';

abstract class OrderState extends Equatable {
  const OrderState();
  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderPlacing extends OrderState {}

class OrderPlacedSuccessfully extends OrderState {
  final String orderId;
  const OrderPlacedSuccessfully(this.orderId);
  @override
  List<Object> get props => [orderId];
}

class OrderPlacementError extends OrderState {
  final String message;
  const OrderPlacementError(this.message);
  @override
  List<Object> get props => [message];
}
