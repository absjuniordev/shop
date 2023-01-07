import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AuthMode { Singup, Login }

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  AuthMode _authMode = AuthMode.Login;

  Map<String, String> _authData = {
    'email': '',
    'passpword': '',
  };
  void _submit() {}

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 320,
        width: deviceSize.width * 0.75,
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'E-mail'),
              keyboardType: TextInputType.emailAddress,
              onSaved: (email) => _authData['email'] = email ?? '',
              validator: (_email) {
                final email = _email ?? '';
                if (email.trim().isEmpty || !email.contains('@')) {
                  return 'Informe ume e-mmail valida';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Senha'),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              controller: _passwordController,
              onSaved: (pasword) => _authData['pasword'] = pasword ?? '',
              validator: (_password) {
                final password = _password ?? '';
                if (password.isEmpty || password.length < 5) {
                  return 'Informe uma senha valida';
                }
              },
            ),
            if (_authMode == AuthMode.Singup)
              TextFormField(
                decoration: const InputDecoration(labelText: 'Confirmar Senha'),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                validator: _authMode == AuthMode.Login
                    ? null
                    : (_password) {
                        final password = _password ?? '';
                        if (password != _passwordController.text) {
                          return 'Senhas informadas não conferem';
                        }
                        return null;
                      },
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 8,
                ),
              ),
              child: Text(
                _authMode == AuthMode.Login ? 'ENTRAR' : "REGISTAR",
              ),
            )
          ],
        )),
      ),
    );
  }
}
