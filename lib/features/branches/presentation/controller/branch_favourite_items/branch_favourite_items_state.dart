part of 'branch_favourite_items_bloc.dart';

@immutable
sealed class BranchFavouriteItemsState {}

final class BranchFavouriteItemsInitial extends BranchFavouriteItemsState {}

final class BranchFavouriteItemsLoading extends BranchFavouriteItemsState {}

final class BranchFavouriteItemsLoaded extends BranchFavouriteItemsState {
  final List<ItemEntity> items;

  BranchFavouriteItemsLoaded({required this.items});
}

final class BranchFavouriteItemsError extends BranchFavouriteItemsState {
  final String errorText;

  BranchFavouriteItemsError({required this.errorText});
}
