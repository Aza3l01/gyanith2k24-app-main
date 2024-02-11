import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gyanith2k24/components/formSize.dart';
import 'package:gyanith2k24/components/glass_morphism_container.dart';
import 'package:gyanith2k24/services/auth.dart';

class SignUpForm extends StatefulWidget {
  final void Function() flipCard;

  const SignUpForm({
    Key? key,
    required this.flipCard,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool inItialized = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String error = "";

  void onSubmit() async {
    if (emailController.text == "") {
      setState(() {
        error = "Email cannot be Empty";
      });
    } else if (passwordController.text == "") {
      setState(() {
        error = "Password cannot be Empty";
      });
    } else if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        error = "Passwords do not match !!";
      });
    } else {
      setState(() {
        error = "";
      });
      print("Email: ${emailController.text}");
      print("Password: ${passwordController.text}");
      try {
        await AuthFire().createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } on FirebaseAuthException catch (err) {
        setState(() {
          error = err.message!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassMorphismCover(
      borderRadius: BorderRadius.circular(16.0),
      child: FormDimensions(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: "Allema",
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AuthEmailInput(
                    email: emailController,
                    error: error,
                  ),
                  const SizedBox(height: 20),
                  AuthPasswordInput(password: passwordController),
                  const SizedBox(height: 20),
                  AuthPasswordInput(
                    password: confirmPasswordController,
                    hintText: "Confirm Password",
                  ),
                  error != ""
                      ? Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            error,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 230, 16, 16),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      : const SizedBox(height: 30),
                  SubmitButton(
                    isLoading: false,
                    onSubmitted: () => onSubmit(),
                    buttonText: "Submit",
                  )
                ],
              ),
              Column(
                children: [
                  AuthChangePage(
                    infoText: "Already have an account?",
                    flipPageText: "Log in",
                    flipCard: widget.flipCard,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  final void Function() flipCard;

  const SignInForm({
    Key? key,
    required this.flipCard,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool inItialized = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String error = "";

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty || !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  void onSubmit() async {
    print("email: ${emailController.text}");
    print("password: ${passwordController.text}");

    if (emailController.text == "") {
      setState(() {
        error = "Email cannot be Empty";
      });
    } else if (passwordController.text == "") {
      setState(() {
        error = "Password cannot be Empty";
      });
    } else {
      setState(() {
        error = "";
      });
      try {
        await AuthFire().signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        print("Done...");
      } on FirebaseAuthException catch (err) {
        setState(() {
          error = err.code;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassMorphismCover(
      borderRadius: BorderRadius.circular(16.0),
      child: FormDimensions(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Log in",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: "Allema",
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AuthEmailInput(
                    email: emailController,
                    error: error,
                  ),
                  const SizedBox(height: 20),
                  AuthPasswordInput(password: passwordController),
                  const SizedBox(height: 10),
                  error != ""
                      ? Text(
                          error,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 230, 16, 16),
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : const SizedBox(height: 30),
                  SubmitButton(
                    isLoading: false,
                    onSubmitted: onSubmit,
                    buttonText: "Submit",
                  )
                ],
              ),
              Column(
                children: [
                  AuthChangePage(
                    infoText: "Don't have an account?",
                    flipPageText: "Sign up",
                    flipCard: widget.flipCard,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthChangePage extends StatelessWidget {
  const AuthChangePage({
    Key? key,
    required this.infoText,
    required this.flipPageText,
    required this.flipCard,
  }) : super(key: key);

  final String infoText;
  final String flipPageText;
  final Function() flipCard;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          infoText,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontFamily: "Fonarto",
          ),
        ),
        GestureDetector(
          onTap: flipCard,
          child: Container(
            color: Colors.transparent,
            padding:
                const EdgeInsets.only(right: 20, left: 5, top: 6, bottom: 6),
            child: Text(
              flipPageText,
              style: const TextStyle(
                color: Color.fromARGB(255, 213, 21, 117),
                fontWeight: FontWeight.bold,
                fontFamily: "Fonarto",
              ),
            ),
          ),
        )
      ],
    );
  }
}

class AuthEmailInput extends StatefulWidget {
  AuthEmailInput({
    Key? key,
    required this.email,
    required this.error,
  }) : super(key: key);
  TextEditingController email;
  String? error;

  @override
  State<AuthEmailInput> createState() => _AuthEmailInputState();
}

class _AuthEmailInputState extends State<AuthEmailInput> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          autofocus: false,
          controller: widget.email,
          onChanged: (value) {},
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(
              Icons.email,
              color: Colors.black.withOpacity(0.5),
            ),
            fillColor: Colors.white.withOpacity(0.3),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.6),
                width: 0.7,
              ),
            ),
            errorStyle: TextStyle(
              color: Colors.pink[200],
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
          ),
          style: const TextStyle(fontFamily: "Fonarto"),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}

class AuthPasswordInput extends StatefulWidget {
  final String hintText;
  AuthPasswordInput({
    Key? key,
    required this.password,
    this.hintText = "Password",
  }) : super(key: key);
  TextEditingController password;

  @override
  State<AuthPasswordInput> createState() => _AuthPasswordInputState();
}

class _AuthPasswordInputState extends State<AuthPasswordInput> {
  bool _passwordVisibility = true;

  void _togglePasswordVisibility() => setState(() {
        _passwordVisibility = !_passwordVisibility;
      });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          autofocus: false,
          controller: widget.password,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.black.withOpacity(0.5),
            ),
            suffixIcon: InkWell(
                onTap: _togglePasswordVisibility,
                child: Icon(
                  !_passwordVisibility
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.black.withOpacity(0.5),
                )),
            fillColor: Colors.white.withOpacity(0.3),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.6),
                width: 0.7,
              ),
            ),
            errorStyle: TextStyle(
              color: Colors.pink[300],
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(fontFamily: "Fonarto"),
          keyboardType: TextInputType.emailAddress,
          obscureText: _passwordVisibility,
        ),
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  final bool isLoading;
  final Function() onSubmitted;
  final String buttonText;
  const SubmitButton({
    Key? key,
    required this.isLoading,
    required this.onSubmitted,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const SizedBox.shrink(),
      onPressed: isLoading ? null : onSubmitted,
      label: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontFamily: "Fonarto",
        ),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.pink[300],
        backgroundColor: Colors.purple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        elevation: 2,
        side: BorderSide(
          color: Colors.black.withOpacity(0.5),
          width: 1,
        ),
      ),
    );
  }
}

class FlipCardAnimation extends StatefulWidget {
  final Widget Function(void Function()) frontWidget;
  final Widget Function(void Function()) rearWidget;
  const FlipCardAnimation(
      {Key? key, required this.frontWidget, required this.rearWidget})
      : super(key: key);

  @override
  State<FlipCardAnimation> createState() => _FlipCardAnimationState();
}

class _FlipCardAnimationState extends State<FlipCardAnimation>
    with SingleTickerProviderStateMixin {
  Widget _buildFront() {
    return Container(
      key: const ValueKey(true),
      child: widget.frontWidget(flipCard),
    );
  }

  void flipCard() {
    setState(() => _showFrontSide = !_showFrontSide);
  }

  Widget _buildRear() {
    return Container(
      key: const ValueKey(false),
      child: widget.rearWidget(flipCard),
    );
  }

  late bool _showFrontSide;

  @override
  void initState() {
    super.initState();
    _showFrontSide = true;
  }

  Widget _buildFlipAnimation() {
    return AnimatedSwitcher(
      layoutBuilder: (widget, list) => Stack(
        children: [widget!, ...list],
      ),
      transitionBuilder: (Widget widget, Animation<double> animation) =>
          __transitionBuilder(widget, animation),
      duration: const Duration(milliseconds: 1000),
      switchInCurve: Curves.easeInBack,
      switchOutCurve: Curves.easeInBack.flipped,
      child: _showFrontSide ? _buildFront() : _buildRear(),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);

    return AnimatedBuilder(
        animation: rotateAnim,
        builder: (context, child) {
          final isUnder = (ValueKey(_showFrontSide) != widget.key);
          var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
          tilt *= isUnder ? -1.0 : 1.0;
          final value = isUnder
              ? min(rotateAnim.value, pi / 2)
              : min(pi / 2, rotateAnim.value);

          return Transform(
            transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
            alignment: Alignment.center,
            child: widget,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return _buildFlipAnimation();
  }
}
