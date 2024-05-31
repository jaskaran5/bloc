import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'increment_event.dart';
part 'increment_state.dart';

class IncrementBloc extends Bloc<IncrementEvent, IncrementState> {
  int count =0;
  IncrementBloc() : super(IncrementInitial()) {
    on<CountIncrementEvent>(_onCountIncrementEvent);
  }

  FutureOr<void> _onCountIncrementEvent(CountIncrementEvent event, Emitter<IncrementState> emit) {

    emit(IncrementLoading());

    emit(IncrementLoaded(count: count++));
  }
}
