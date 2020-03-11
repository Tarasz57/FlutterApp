import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_advisor/utilities/constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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

  Widget _buildNameBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Full Name', style: kLabelStyle),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
                hintText: 'Enter your full name',
                hintStyle: kHintTextStyle),
          ),
        )
      ],
    );
  }

  Widget _buildPhoneBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Phone No', style: kLabelStyle),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.phone,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  color: Colors.white,
                ),
                hintText: 'Enter your phone number',
                hintStyle: kHintTextStyle),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordBox(value, label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: kLabelStyle),
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
                  Icons.vpn_key,
                  color: Colors.white,
                ),
                hintText: value,
                hintStyle: kHintTextStyle),
          ),
        )
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => print('Register button pressed'),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.white,
        child: Text(
          'REGISTER',
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

  Widget _buildSignInButton() {
    return GestureDetector(
        onTap: () {
          print('Sign in button pressed');
          Navigator.pop(context);
        },
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400)),
            TextSpan(
                text: 'Sign in',
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 70.0),
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
                      SizedBox(height: 10.0),
                      _buildNameBox(),
                      SizedBox(height: 10.0),
                      _buildPhoneBox(),
                      SizedBox(height: 10.0),
                      _buildEmailBox(),
                      SizedBox(height: 10.0,),
                      _buildPasswordBox('Enter your password', 'Password'),
                      SizedBox(height: 10.0),
                      _buildPasswordBox('Confirm password', 'Confirm password'),
                      SizedBox(height: 10.0),
                      _buildLoginButton(),
                      SizedBox(height: 10.0),
                      _buildSignInButton()
                    ],
                  ),
                ),
              )
            ],
          )),
    ));
  }
}
