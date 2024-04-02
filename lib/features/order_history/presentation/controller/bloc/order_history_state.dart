part of 'order_history_bloc.dart';

@immutable
sealed class OrderHistoryState {}

final class OrderHistoryInitial extends OrderHistoryState {}

final class OrderHistoryLoading extends OrderHistoryState {}

final class OrderHistoryLoaded extends OrderHistoryState {
  final List<OrderEntity> orders;

  OrderHistoryLoaded({required this.orders});
}

final class OrderHistoryError extends OrderHistoryState {
  final String errorText;

  OrderHistoryError({required this.errorText});
}
