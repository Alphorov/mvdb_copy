import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь, чтобы отправить письмо повторно.

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Center(child: Text('Login to your account')),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              _FormWidget(),
              SizedBox(
                height: 24,
              ),
              SingleChildScrollView(
                child: _HeaderWiget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderWiget extends StatefulWidget {
  const _HeaderWiget({Key? key}) : super(key: key);

  @override
  __HeaderWigetState createState() => __HeaderWigetState();
}

class __HeaderWigetState extends State<_HeaderWiget> {
  @override
  Widget build(BuildContext context) {
    const headerTextStyle = TextStyle(fontSize: 15, color: Colors.black);
    const color = Color.fromRGBO(1, 180, 228, 1);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          RichText(
              text: TextSpan(
            children: [
              const TextSpan(
                  text:
                      'Чтобы пользоваться правкой и возможностями рейтинга TMDb, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой.',
                  style: headerTextStyle),
              TextSpan(
                  text: ' Нажмите здесь',
                  style: const TextStyle(color: color),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => log('Нажмите здесь')),
              const TextSpan(text: ', чтобы начать.', style: headerTextStyle),
            ],
          )),
          const SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
            children: [
              const TextSpan(
                  text:
                      'Если Вы зарегистрировались, но не получили письмо для подтверждения,',
                  style: headerTextStyle),
              TextSpan(
                  text: ' Нажмите здесь',
                  style: const TextStyle(color: color),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => log('Нажмите здесь')),
              const TextSpan(
                  text: ', чтобы отправить письмо повторно.',
                  style: headerTextStyle),
            ],
          )),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');

  // ignore: avoid_init_to_null
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      Navigator.of(context).pushReplacementNamed('/main');
      errorText = null;
    } else {
      errorText = 'Не верный логин или пароль';
    }
    setState(() {});
  }

  void _resetPassword() {
    log('reset password');
  }

  static const textFieldStyle = InputDecoration(
    filled: true,
    border: OutlineInputBorder(),
    isCollapsed: true,
    contentPadding: EdgeInsets.all(12),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF01B4E4)),
    ),
  );

  static const textStyle = TextStyle(fontSize: 16, color: Color(0xff212529));
  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (errorText != null) ...[
            Text(
              errorText,
              style: const TextStyle(color: Colors.red, fontSize: 17),
            ),
            const SizedBox(height: 20)
          ],
          const Text(
            'Username',
            style: textStyle,
          ),
          TextField(
            textInputAction: TextInputAction.next,
            controller: _loginTextController,
            decoration: textFieldStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Password',
            style: textStyle,
          ),
          TextField(
            textInputAction: TextInputAction.none,
            controller: _passwordTextController,
            decoration: textFieldStyle,
            obscureText: true,
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: ElevatedButton(
                  onPressed: _auth,
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF01B4E4)),
                      fixedSize: MaterialStateProperty.all(const Size(80, 35))),
                ),
              ),
              TextButton(
                onPressed: _resetPassword,
                child: const Text('Reset password'),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(150, 35)),
                  foregroundColor:
                      MaterialStateProperty.all(const Color(0xFF01B4E4)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
