part of 'order_history_bloc.dart';

@immutable
sealed class OrderHistoryEvent {}

final class GetOrderHistoryEvent extends OrderHistoryEvent {
  
}