import 'package:demo_state_management/utils/validators.dart';
import 'package:formz/formz.dart';

class EmptyValidator extends FormzInput<String, String?> {
  const EmptyValidator.pure([String value = '']) : super.pure(value);

  const EmptyValidator.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String value) => Validators.empty(value);
}
