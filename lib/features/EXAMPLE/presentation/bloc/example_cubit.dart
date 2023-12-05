import 'package:espot_power/features/index.dart';

part 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> with LoadingMixin, ToastMixin {
  ExampleCubit() : super(const ExampleState());
}
