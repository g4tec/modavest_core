import 'package:flutter/material.dart';

class ModavestPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final void Function(String)? onSubmit;

  /// Uma função que retorna uma String se houver um erro,
  /// senão retorna null, para este caso é usado o validator padrão, caso necessário sobrescreve-lo
  final String? Function(String?)? validate;
  final TextInputAction textInputAction;

  const ModavestPasswordField({
    Key? key,
    required this.controller,
    required this.title,
    this.textInputAction = TextInputAction.next,
    required this.validate,
    this.onSubmit,
  }) : super(key: key);

  @override
  State<ModavestPasswordField> createState() => _ModavestPasswordFieldState();
}

class _ModavestPasswordFieldState extends State<ModavestPasswordField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodySmall,
        obscureText: !_passwordVisible,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        keyboardType: TextInputType.visiblePassword,
        validator: widget.validate,
        onFieldSubmitted: widget.onSubmit,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          labelText: widget.title,
          labelStyle: Theme.of(context).textTheme.bodySmall,
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}
