import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/use_cases/item_use_case.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemUseCase getItem;
  ItemBloc(this.getItem) : super(ItemInitial()) {
    on<GetItemEvent>(_getItemEvent);
  }

  FutureOr<void> _getItemEvent(event, emit) async {
    emit(ItemLoading());
    try {
      final item = await getItem(
        ItemParams(id: event.id),
      );
      emit(
        ItemLoaded(item: item),
      );
    } catch (e) {
      emit(
        ItemError(
          errorText: e.toString(),
        ),
      );
    }
  }
}
