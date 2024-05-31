import 'package:equatable/equatable.dart';

sealed class InternetEvent extends Equatable {}

/// Events we add from the bloc class .

class InternetConnectionCheckerEvent extends InternetEvent {
  final bool isInternetConnected;

  InternetConnectionCheckerEvent(this.isInternetConnected);
  @override
  List<Object?> get props => [isInternetConnected];
}
