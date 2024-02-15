part of 'item_bloc.dart';

@immutable
sealed class ItemEvent {}

class GetItemEvent extends ItemEvent {
  final int id;

  GetItemEvent({required this.id});
}
