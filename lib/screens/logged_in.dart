import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoggedInScreen extends StatefulWidget {
  @override
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen>{

  Widget _buildSignOutBlob() { // TODO add dynamic sign out
  final googleSignIn = GoogleSignIn();
    return GestureDetector(
        onTap: () async {
          try {
            await googleSignIn.signOut();
            print('SUCCESS');
            Navigator.pop(context);
          } catch (error) {
            print(error);
          }
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
              image: DecorationImage(
                image: AssetImage('assets/' + 'google' + '.jpg'),
              )),
        ));
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 90.0,),
                _buildSignOutBlob()
              ],
            ),
          )
        ) 
      ), 
    );
  }
}