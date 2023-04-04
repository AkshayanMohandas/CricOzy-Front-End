// import 'package:best_flutter_ui_templates/model/navigation_home_screen.dart';
// import 'package:best_flutter_ui_templates/model/signup_page.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Color.fromARGB(255, 248, 236, 228),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             SizedBox(height: 100),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Column(
//                     children: <Widget>[
//                       Text(
//                         "Login",
//                         style: TextStyle(
//                             fontSize: 30, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         "Login to your account",
//                         style: TextStyle(fontSize: 15, color: Colors.grey[700]),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 40),
//                     child: Column(
//                       children: <Widget>[
//                         makeInput(label: "Email"),
//                         makeInput(label: "Password", obscureText: true),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 40),
//                     child: Container(
//                       padding: EdgeInsets.only(top: 3, left: 3),
//                       child: MaterialButton(
//                         minWidth: double.infinity,
//                         height: 60,
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       NavigationHomeScreen()));
//                         },
//                         color: Color.fromARGB(255, 19, 33, 55),
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(50)),
//                         child: Text(
//                           "Login",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text("Don't have an account?"),
//                       TextButton.icon(
//                         // <-- TextButton
//                         onPressed: () {
//                           {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => SignupPage()));
//                           }
//                         },
//                         icon: Icon(
//                           Icons.login,
//                           size: 18.0,
//                         ),
//                         label: Text('Sign up'),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height / 3,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/images/background.png'),
//                       fit: BoxFit.cover)),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget makeInput({label, obscureText = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           label,
//           style: TextStyle(
//               fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         TextField(
//           obscureText: obscureText,
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//           ),
//         ),
//         SizedBox(
//           height: 30,
//         ),
//       ],
//     );
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key});

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// /// [AnimationController]s can be created with `vsync: this` because of
// /// [TickerProviderStateMixin].
// class _MyStatefulWidgetState extends State<MyStatefulWidget>
//     with TickerProviderStateMixin {
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 2),
//     vsync: this,
//   )..repeat(reverse: true);
//   late final Animation<double> _animation = CurvedAnimation(
//     parent: _controller,
//     curve: Curves.easeIn,
//   );

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color.fromARGB(255, 248, 236, 228),
//       child: FadeTransition(
//         opacity: _animation,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(40),
//           child: Container(
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.5),
//                   blurRadius: 10,
//                   offset: Offset(0, 5),
//                 ),
//               ],
//             ),
//             child: Image.asset('assets/images/logo_blue.png'),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:best_flutter_ui_templates/model/navigation_home_screen.dart';
import 'package:best_flutter_ui_templates/model/signup_page.dart';
import 'package:best_flutter_ui_templates/services/auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 248, 236, 228),
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Color.fromARGB(255, 248, 236, 228),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Login to your account",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          TextFormField(
                            validator: (val) => val == '' || val == null
                                ? 'Enter an email'
                                : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          Text(
                            'Password',
                            style: TextStyle(fontSize: 18, height: 3),
                          ),
                          TextFormField(
                            obscureText: true,
                            validator: (val) => val!.length < 6
                                ? 'Enter a password more than 6 characters'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          // makeInput(label: "Email"),
                          // makeInput(label: "Password", obscureText: true),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              print('email $email');
                              print("password $password");

                              dynamic result =
                                  await _auth.logIn(email, password);
                              print(result);
                              if (result == null) {
                                setState(() =>
                                    error = 'Email or password is incorrect!');
                              } else if (result != null) {
                                setState(() => error = '');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NavigationHomeScreen()));
                              }
                            }
                          },
                          color: Color.fromARGB(255, 19, 33, 55),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 1.0),
                    Text(
                      error,
                      style: TextStyle(color: Color(0xFFFF1744), fontSize: 14),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                        TextButton.icon(
                          // <-- TextButton
                          onPressed: () {
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupPage()));
                            }
                          },
                          icon: Icon(
                            Icons.login,
                            size: 18.0,
                          ),
                          label: Text('Sign up'),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 248, 236, 228),
      child: FadeTransition(
        opacity: _animation,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Image.asset('assets/images/logo_blue.png'),
          ),
        ),
      ),
    );
  }
}
