import 'package:espot_power/features/index.dart';

part 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> with LoadingMixin, ToastMixin {
  ExampleCubit() : super(const ExampleState());

//  final _datasource = GetIt.instance<VerifyUserDatasourcesImpl>();

  // Future<void> verifyUserExist() async {
  //   emit(state.copyWith(onVerifyUserExists: RequestStatus.loading));

  //   try {

  //       final dataRequest = VerifyUserExistModelRequest(
  //           phoneNumber: phoneController?.text ?? '');
  //       await _datasource.verifyUserExist(dataRequest).then((response) async {
  //         if (response.ok == false) {
  //           emit(
  //             state.copyWith(
  //               msgVerifyUserExists: response.msg,
  //               onVerifyUserExists: RequestStatus.failure,
  //             ),
  //           );
  //         } else {
  //           emit(
  //             state.copyWith(
  //               msgVerifyUserExists: response.msg,
  //               onVerifyUserExists: RequestStatus.success,
  //             ),
  //           );
  //         }
  //       });

  //   } catch (e) {
  //     emit(state.copyWith(onVerifyUserExists: RequestStatus.failure));
  //   }
  // }
}
