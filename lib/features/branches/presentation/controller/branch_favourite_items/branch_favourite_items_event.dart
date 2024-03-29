part of 'branch_favourite_items_bloc.dart';

@immutable
sealed class BranchFavouriteItemsEvent {}

final class GetFavouriteItemsEvent extends BranchFavouriteItemsEvent {}
