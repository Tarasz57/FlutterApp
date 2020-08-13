import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:university_advisor/screens/logged_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation<double> animation;

  @override
   void initState() {
     super.initState();
      animationController = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this,
     );
     animation = CurvedAnimation(parent: animationController, curve: Curves.easeIn);
     animationController.forward();
   }

  _getFbLogin() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        // _sendTokenToServer(result.accessToken.token);
        // _showLoggedInUI();
        print('SUCESSFULLY LOGGED IN');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoggedInScreen()));
        break;
      case FacebookLoginStatus.cancelledByUser:
        // _showConvincingMessageOnUI();
        print('cancelled');
        break;
      case FacebookLoginStatus.error:
        // _showErrorOnUI();
        print('error :(((((((');
        break;
    }
  }

  _getGoogleLogin() async {
    final googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount signInAccount = await googleSignIn.signIn();
      if (signInAccount != null) {
        print('SUCCESS');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoggedInScreen()));
      }
    } catch (error) {
      print(error);
    }
  }

  Widget _buildSignInBlob(value) {
    return GestureDetector(
        onTap: () async {
          switch (value) {
            case 'facebook':
              _getFbLogin();
              break;
            case 'google':
              _getGoogleLogin();
          }
        },
        child: Container(
          height: 60,
          width: 100,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
              image: DecorationImage(
                image: AssetImage('assets/' + value + '.jpg'),
              )),
        ));
  }

  Widget _buildSignInButtonColumn() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Column(
        children: <Widget>[
          _buildSignInBlob('facebook'),
          SizedBox(height: 10.0),
          _buildSignInBlob('google'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color(0xFF4CAF50),
                          Color(0xFF43A047),
                          Color(0xFF388E3C),
                          Color(0xFF2E7D32),
                          Color(0xFF1B5E20),
                        ],
                            stops: [
                          0.1,
                          0.3,
                          0.5,
                          0.7,
                          0.9
                        ]))),
                FadeTransition(
                  opacity: animation,
                  child: Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 30.0),
                          _buildSignInButtonColumn(),
                        ],
                      ),
                    ),
                  )
                )
              ],
            )
          )
        ),
    );
  }
}
