import 'package:flutter/material.dart';
import 'package:flutter_apps/movies/theme/button_style.dart';

class AuthWidgets extends StatefulWidget {
  const AuthWidgets({Key key}) : super(key: key);

  @override
  _AuthWidgetsState createState() => _AuthWidgetsState();
}

class _AuthWidgetsState extends State<AuthWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Войти в свою учётную запись'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            _HeaderWidget(),
          ],
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 16, color: Colors.black);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),
        _FormWidget(),
        SizedBox(height: 25),
        Text(
          "Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. "
          "Если у вас нет учётной записи, её регистрация является бесплатной и простой.",
          style: textStyle,
        ),
        SizedBox(height: 5),
        TextButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: Text('Регистрация')),
        SizedBox(height: 25),
        Text(
          'Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь, чтобы отправить письмо повторно.',
          style: textStyle,
        ),
        SizedBox(height: 5),
        TextButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: Text('Отправить письмо повторно')),
      ],
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == "admin") {
      errorText = null;
      print('open app');
    } else {
      errorText = 'Не верный логин или пароль';
      print('show error');
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );

    final textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      isCollapsed: true,
      fillColor: Colors.red,
      focusColor: Colors.red,
      hoverColor: Colors.red,
    );

    final colorButtonAll = const Color(0xFF01B4E4);
    final errorText = this.errorText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
          SizedBox(height: 20),
        ],
        Text('Имя пользователя', style: textStyle),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecoration,
        ),
        SizedBox(
          height: 20,
        ),
        Text('Пароль', style: textStyle),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecoration,
          obscureText: true,
        ),
        SizedBox(height: 20),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(colorButtonAll),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  )),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 15, vertical: 8))),
              onPressed: _auth,
              child: Text('Войти'),
            ),
            SizedBox(width: 30),
            TextButton(
              onPressed: _resetPassword,
              child: Text('Сбросить пароль'),
              style: AppButtonStyle.linkButton,
            ),
          ],
        ),
      ],
    );
  }
}
