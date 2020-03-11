import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:university_advisor/screens/logged_in.dart';
import 'package:university_advisor/screens/register_screen.dart';
import 'package:university_advisor/utilities/constants.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  Widget _buildEmailBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Email', style: kLabelStyle),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your email',
                hintStyle: kHintTextStyle),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Password', style: kLabelStyle),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Enter your password',
                hintStyle: kHintTextStyle),
          ),
        )
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot password button pressed'),
        padding: EdgeInsets.only(right: 9.0),
        child: Text(
          'Forgot password',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMe() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: _rememberMe,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                checkColor: Colors.black,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value;
                  });
                },
              )),
          Text(
            'Remember me',
            style: kLabelStyle,
          )
        ],
      ),
    );
  }

  Widget _buildRememberMeAndForgotPasswordRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildRememberMe(),
        _buildForgotPassword(),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => print('Login button pressed'),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
              color: Color(0xFF4CAF50),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
      ),
    );
  }

  Widget _buildSignIn() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Sign in with',
          style: kLabelStyle,
        )
      ],
    );
  }

  _getFbLogin() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        // _sendTokenToServer(result.accessToken.token);
        // _showLoggedInUI();
        print('SUCESSFULLY LOGGED IN');
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoggedInScreen()));
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
      await googleSignIn.signIn();
      print('SUCCESS');
    } catch (error) {
      print(error);
    }
  }

  Widget _buildSignInBlob(value) {
    final googleSignIn = GoogleSignIn();
    return GestureDetector(
        onTap: () async {
          switch (value){
            case 'facebook':
              _getFbLogin();
              break;
            case 'google':
              // _getGoogleLogin();
              print(await googleSignIn.signIn());
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
                image: AssetImage('assets/' + value + '.jpg'),
              )),
        ));
  }

  Widget _buildSignInBlobRow() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildSignInBlob('facebook'),
            _buildSignInBlob('google'),
          ],
        ));
  }

  Widget _buildSignUpButton() {
    return GestureDetector(
        onTap: () {
          print('Sign up button pressed');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegisterScreen()));
        },
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Don\'t have an account? ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400)),
            TextSpan(
                text: 'Sign up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold))
          ]),
        ));
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
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 90),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign in',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailBox(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordBox(),
                      _buildRememberMeAndForgotPasswordRow(),
                      _buildLoginButton(),
                      _buildSignIn(),
                      _buildSignInBlobRow(),
                      _buildSignUpButton()
                    ],
                  ),
                ),
              )
            ],
          )),
    ));
  }
}
