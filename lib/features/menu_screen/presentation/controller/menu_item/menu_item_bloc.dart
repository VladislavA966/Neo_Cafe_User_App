import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/entity/item_entity.dart';
import 'package:neo_cafe_24/features/menu_screen/domain/use_cases/menu_items_use_case.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/domain/use_case/cart_use_case.dart';

part 'menu_item_event.dart';
part 'menu_item_state.dart';

class MenuItemBloc extends Bloc<MenuItemEvent, MenuItemState> {
  final AllItemsUseCase getAllitems;
  final CartUseCase cartUseCase;
  MenuItemBloc(this.getAllitems, this.cartUseCase) : super(MenuItemInitial()) {
    getAllItemsEvent();
  }

  void getAllItemsEvent() {
    return on<GetAllItemsEvent>(
      (event, emit) async {
        emit(MenuItemLoading());
        try {
          final items = await getAllitems(CategoryParams(id: event.id));


          emit(MenuItemLoaded(model: items));
        } catch (e) {
          emit(
            MenuItemError(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
  }
}
