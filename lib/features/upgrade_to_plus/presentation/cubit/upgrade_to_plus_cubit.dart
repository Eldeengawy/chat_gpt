import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'upgrade_to_plus_state.dart';

class UpgradeToPlusCubit extends Cubit<UpgradeToPlusState> {
  UpgradeToPlusCubit() : super(UpgradeToPlusInitial());
}
