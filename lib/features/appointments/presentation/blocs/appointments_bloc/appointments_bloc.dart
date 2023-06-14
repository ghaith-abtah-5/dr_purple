import 'package:dr_purple/core/utils/constants.dart';
import 'package:dr_purple/features/appointments/data/remote/models/params/get_all_appointments/get_all_appointments_params.dart';
import 'package:dr_purple/features/appointments/domain/use_cases/get_all_appointments_use_case.dart';
import 'package:dr_purple/features/appointments/domain/use_cases/get_appointment_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'appointments_event.dart';

part 'appointments_state.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  final GetAllAppointmentsUseCase _getAllAppointmentsUseCase;
  final GetAppointmentUseCase _getAppointmentUseCase;

  AppointmentsBloc(this._getAllAppointmentsUseCase, this._getAppointmentUseCase)
      : super(AppointmentsInitial()) {
    on<GetMyAppointments>((event, emit) async {
      emit(AppointmentsLoading(
          loadingType: AppointmentsBlocStateType.getMyAppointments));
      String errorMessage = Constants.empty;
      var res = await _getAllAppointmentsUseCase.call(GetAllAppointmentsParams(
          body: GetAllAppointmentsParamsBody(
        pageSize: 10,
        pageNo: 1,
        skip: 1,
        orderBy: null,
        searchBy: null,
        isAscending: false,
      )));
      bool isError = res.fold((l) {
        errorMessage = l.message;
        return true;
      }, (r) {
        return false;
      });
      if (isError) {
        emit(AppointmentsError(
          errorType: AppointmentsBlocStateType.getMyAppointments,
          errorMessage: errorMessage,
        ));
      } else {
        emit(AppointmentsLoaded(
            loadedType: AppointmentsBlocStateType.getMyAppointments));
      }
    });
  }
}
