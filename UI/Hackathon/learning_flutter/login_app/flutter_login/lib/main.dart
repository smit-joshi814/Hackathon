import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 500,
        ));

    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut,
    );
    _iconAnimation.addListener(() {
      setState(() {});
    });
    _iconAnimationController.forward();
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/bg.jpeg',
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: const AssetImage('assets/images/logo.png'),
                height: _iconAnimation.value * 100,
                width: _iconAnimation.value * 100,
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: const InputDecorationTheme(
                          labelStyle: TextStyle(
                              color: Colors.tealAccent, fontSize: 15.0))),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Enter Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Enter Password',
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 40.0)),
                        MaterialButton(
                          height: 40.0,
                          minWidth: 100.0,
                          onPressed: () {},
                          color: Colors.green,
                          textColor: Colors.white,
                          splashColor: Colors.greenAccent,
                          child: const Icon(Icons.login),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
