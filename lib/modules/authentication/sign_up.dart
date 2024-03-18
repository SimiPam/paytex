import 'package:flutter/material.dart';

import '../../shared/widgets/base_view.dart';
import 'viewmodel/authentication_vm.dart';

class SignUp extends StatelessWidget {
  final bool? isChangePwd;
  SignUp({Key? key, this.isChangePwd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
        vmBuilder: (context) => AuthViewModel(context: context),
        builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, AuthViewModel viewModel) {
    return const Scaffold();
  }
}
