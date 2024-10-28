import 'package:finance/import.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(DashboardScreenState()) {
    // Register event handlers with the `on` method
    on<NavigateToDashboard>((event, emit) => emit(DashboardScreenState()));
    on<NavigateToHistory>((event, emit) => emit(HistoryScreenState()));
    on<NavigateToNotification>((event, emit) => emit(NotificationScreenState()));
    on<NavigateToAccount>((event, emit) => emit(AccountScreenState()));
    on<NavigateToAdd>((event, emit) => emit(AddScreenState()));
  }
}
