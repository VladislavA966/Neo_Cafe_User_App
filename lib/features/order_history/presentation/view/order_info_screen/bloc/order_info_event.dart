part of 'order_info_bloc.dart';

@immutable
sealed class OrderInfoEvent {}

final class GetOrderInfoEvent extends OrderInfoEvent {
  final int id;

  GetOrderInfoEvent({required this.id});
}
