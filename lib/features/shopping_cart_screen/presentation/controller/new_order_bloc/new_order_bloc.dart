import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/new_order_use_case.dart';

part 'new_order_event.dart';
part 'new_order_state.dart';

class NewOrderBloc extends Bloc<NewOrderEvent, NewOrderState> {
  final NewOrderUseCase newOrderUseCase;
  NewOrderBloc(this.newOrderUseCase) : super(NewOrderInitial()) {
    on<SendNewOrderEvent>((event, emit) async {
      emit(NewOrderLoading());
      try {
        await newOrderUseCase(
          event.bonusPoints,
        );
        emit(
          NewOrderLoaded(),
        );
      } catch (e) {
        emit(
          NewOrderError(
            errorText: e.toString(),
          ),
        );
      }
    });
  }
}
