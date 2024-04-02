import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/features/order_history/domain/entity/order_entity.dart';
import 'package:neo_cafe_24/features/order_history/domain/use_case/order_history_use_case.dart';
import 'package:retrofit/retrofit.dart';

part 'order_history_event.dart';
part 'order_history_state.dart';

class OrderHistoryBloc extends Bloc<OrderHistoryEvent, OrderHistoryState> {
  final OrderHistoryUseCase orderHistoryUseCase;
  OrderHistoryBloc(this.orderHistoryUseCase) : super(OrderHistoryInitial()) {
    on<GetOrderHistoryEvent>((event, emit) async {
      emit(OrderHistoryLoading());
      try {
        final orders = await orderHistoryUseCase(
          const NoBody(),
        );
        emit(
          OrderHistoryLoaded(
            orders: orders,
          ),
        );
      } catch (e) {
        emit(
          OrderHistoryError(
            errorText: e.toString(),
          ),
        );
        print(
          e.toString(),
        );
      }
    });
  }
}
