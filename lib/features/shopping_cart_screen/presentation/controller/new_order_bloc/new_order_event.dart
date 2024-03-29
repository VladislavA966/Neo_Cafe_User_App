part of 'new_order_bloc.dart';

@immutable
sealed class NewOrderEvent {}

class SendNewOrderEvent extends NewOrderEvent {
  final int bonusPoints;

  SendNewOrderEvent({required this.bonusPoints});
}
