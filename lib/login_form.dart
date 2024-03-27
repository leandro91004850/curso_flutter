import "package:curso_flutter/testeApi.dart";
import "package:flutter/material.dart";

class LoginPageState extends State<LoginPage> {
  var apiService = ApiService();

  @override
  void initState() {
    super.initState();
    chamandoTesteApi();
  }

  Future<void> chamandoTesteApi() async {
    try {
      var result = await apiService.testeApi();
      print(result);
    } catch (e) {
      print(e);
    }
  }

  final usernameInput = TextEditingController();
  final passwordInput = TextEditingController();
  var isLogin = false;

  void login(String username, String password) {
    setState(() {
      if (username == 'admin' && password == 'admin') {
        isLogin = true;
      } else {
        isLogin = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Login Page",
        home: Scaffold(
            backgroundColor: Colors.white,
            body: LoginForm(
                usernameController: usernameInput,
                passwordController: passwordInput,
                login: login,
                isLogin: isLogin)));
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Function login;
  final bool isLogin;

  const LoginForm(
      {super.key,
      required this.usernameController,
      required this.passwordController,
      required this.login,
      required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: 150,
              width: 150,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            height: 60,
            child: TextField(
              decoration: const InputDecoration(
                labelStyle: TextStyle(color: Colors.grey),
                labelText: 'Email',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey, width: 2)),
              ),
              controller: usernameController,
            ),
          ),
          MyWidget(passwordController),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 240, 241, 241)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 14, 153, 14))),
                onPressed: () {
                  login(usernameController.text, passwordController.text);
                },
                child: const Text('Login')),
          ),
          if (isLogin) const Text('Login Success'),
        ],
      )),
    );
  }
}

class _MyWidgetState extends State<MyWidget> {
  bool _obscureText = true;
  final TextEditingController passwordController;
  _MyWidgetState({required this.passwordController});

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      height: 60,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: const TextStyle(color: Colors.grey),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          suffixIcon: IconButton(
            color: Colors.green,
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.green[600],
            ),
            onPressed: _togglePasswordVisibility,
          ),
        ),
        controller: passwordController,
        obscureText: _obscureText,
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  final TextEditingController passwordController;
  const MyWidget(this.passwordController, {super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _MyWidgetState(passwordController: passwordController);
  }
}
