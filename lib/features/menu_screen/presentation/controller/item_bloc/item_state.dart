part of 'item_bloc.dart';

@immutable
sealed class ItemState {}

final class ItemInitial extends ItemState {}

final class ItemLoading extends ItemState {}

final class ItemLoaded extends ItemState {
  final ItemEntity item;

  ItemLoaded({required this.item});
}

final class ItemError extends ItemState {
  final String errorText;

  ItemError({required this.errorText});
}
