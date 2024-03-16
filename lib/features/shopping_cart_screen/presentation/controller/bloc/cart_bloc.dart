import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/domain/entity/cart_item_entity.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/domain/use_case/cart_use_case.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartUseCase cartUseCase;

  CartBloc({required this.cartUseCase}) : super(CartLoadInProgress()) {
    on<CartStarted>(_onCartStarted);
    on<CartItemAdded>(_onCartItemAdded);
    on<CartItemRemoved>(_onCartItemRemoved);
    on<CartItemsRequested>(_onCartItemsRequested);
    on<CleanCartEvent>(_onCleanCart);
  }

  Future<void> _onCartStarted(
      CartStarted event, Emitter<CartState> emit) async {
    try {
      final items = await cartUseCase.getItemsUseCase();
      emit(CartLoadSuccess(items));
    } catch (_) {
      emit(CartLoadFailure());
    }
  }

  Future<void> _onCartItemAdded(
      CartItemAdded event, Emitter<CartState> emit) async {
    try {
      await cartUseCase.addItemUseCase(event.item);
      final items = await cartUseCase.getItemsUseCase();
      emit(CartLoadSuccess(items));
    } catch (_) {
      emit(CartLoadFailure());
    }
  }

  Future<void> _onCartItemRemoved(
      CartItemRemoved event, Emitter<CartState> emit) async {
    try {
      await cartUseCase.removeItemAtUseCase(event.itemId);
      final items = await cartUseCase.getItemsUseCase();
      emit(CartLoadSuccess(items));
    } catch (_) {
      emit(CartLoadFailure());
    }
  }

  Future<void> _onCartItemsRequested(
      CartItemsRequested event, Emitter<CartState> emit) async {
    emit(CartLoadInProgress());
    try {
      final items = await cartUseCase.getItemsUseCase();
      if (items.isEmpty) {
        emit(
          CartLoadFailure(),
        );
      } else {
        emit(CartLoadSuccess(items));
      }
    } catch (_) {
      emit(
        CartLoadFailure(),
      );
    }
  }

  Future<void> _onCleanCart(
      CleanCartEvent event, Emitter<CartState> emit) async {
    emit(
      CartLoadInProgress(),
    );
    await cartUseCase.clearCart();
    emit(
      CartLoadFailure(),
    );
  }
}
