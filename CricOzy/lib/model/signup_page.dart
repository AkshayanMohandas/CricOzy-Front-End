// import 'package:best_flutter_ui_templates/model/navigation_home_screen.dart';
// import 'package:flutter/material.dart';
// import 'login_page.dart';

// class SignupPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Color.fromARGB(255, 248, 236, 228),
//       appBar: AppBar(
//         elevation: 0,
//         // ignore: deprecated_member_use
//         brightness: Brightness.light,
//         backgroundColor: Color.fromARGB(255, 248, 236, 228),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 40),
//           height: MediaQuery.of(context).size.height - 50,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   Text(
//                     "Sign up",
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "Create an account, It's free",
//                     style: TextStyle(fontSize: 15, color: Colors.grey[700]),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   makeInput(label: "Email"),
//                   makeInput(label: "Password", obscureText: true),
//                   makeInput(label: "Confirm Password", obscureText: true),
//                 ],
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 3, left: 3),
//                 child: MaterialButton(
//                   minWidth: double.infinity,
//                   height: 60,
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => NavigationHomeScreen()));
//                   },
//                   color: Color.fromARGB(255, 19, 33, 55),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50)),
//                   child: Text(
//                     "Sign up",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text("Already have an account?"),
//                   TextButton.icon(
//                     // <-- TextButton
//                     onPressed: () {
//                       {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginPage()));
//                       }
//                     },
//                     icon: Icon(
//                       Icons.login,
//                       size: 18.0,
//                     ),
//                     label: Text('Login'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
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
//             // ),
//           ),
//         ),
//         SizedBox(
//           height: 30,
//         ),
//       ],
//     );
//   }
// }

import 'package:best_flutter_ui_templates/model/login_page.dart';
import 'package:best_flutter_ui_templates/services/auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<SignupPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 248, 236, 228),
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
        brightness: Brightness.light,
        backgroundColor: Color.fromARGB(255, 248, 236, 228),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Sign up",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create an account, It's free",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    TextFormField(
                      validator: (val) =>
                          val == '' || val == null ? 'Enter an email' : null,
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
                    Text(
                      'Confirm Password',
                      style: TextStyle(fontSize: 18, height: 3),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val) =>
                          val != password ? 'Password is not same' : null,
                      onChanged: (val) {
                        // setState(() => password = val);
                      },
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _auth.signIn(email, password);
                        if (result == null) {
                          setState(() => error =
                              'Entered email is incorrect or already registered!');
                        } else if (result != null) {
                          setState(() => error = '');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        }
                      }
                    },
                    color: Color.fromARGB(255, 19, 33, 55),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
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
                    Text("Already have an account?"),
                    TextButton.icon(
                      // <-- TextButton
                      onPressed: () {
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        }
                      },
                      icon: Icon(
                        Icons.login,
                        size: 18.0,
                      ),
                      label: Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
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
            // ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
