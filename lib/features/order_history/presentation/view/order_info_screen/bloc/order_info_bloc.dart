import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/features/order_history/domain/entity/order_entity.dart';
import 'package:neo_cafe_24/features/order_history/domain/use_case/order_info_use_case.dart';

part 'order_info_event.dart';
part 'order_info_state.dart';

class OrderInfoBloc extends Bloc<OrderInfoEvent, OrderInfoState> {
  final OrderInfoUseCase orderUseCase;
  OrderInfoBloc(this.orderUseCase) : super(OrderInfoInitial()) {
    on<GetOrderInfoEvent>((event, emit) async {
      emit(
        OrderInfoLoading(),
      );
      try {
        final order = await orderUseCase(event.id);
        emit(
          OrderInfoLoaded(
            order: order,
          ),
        );
      } catch (e) {
        emit(
          OrderInfoError(
            errorText: e.toString(),
          ),
        );
      }
    });
  }
}
