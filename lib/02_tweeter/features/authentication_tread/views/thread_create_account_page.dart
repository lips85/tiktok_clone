import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/02_tweeter/features/authentication_tread/utils/common_button.dart';

import 'package:tiktok_clone/02_tweeter/features/authentication_tread/utils/validators.dart';
import 'package:tiktok_clone/02_tweeter/features/authentication_tread/view_models/signup_view_model.dart';
import 'package:tiktok_clone/02_tweeter/features/navbar/main_navbar_tweet.dart';
import 'package:tiktok_clone/utils.dart';

class ThreadCreateAccountPage extends ConsumerStatefulWidget {
  static String routeName = "Create Account";
  static String routeURL = "/createAccount";
  const ThreadCreateAccountPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ThreadCreateAccountPageState();
}

class ThreadCreateAccountPageState
    extends ConsumerState<ThreadCreateAccountPage> {
  var formValues = <String, String>{};

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  String _email = "";
  String _password = "";
  String _passwordConfirm = "";
  bool _isPasswordVisible = false;
  bool _isPasswordConfirmVisible = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
    _passwordConfirmController.addListener(() {
      setState(() {
        _passwordConfirm = _passwordConfirmController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _togglePasswordConfirmVisibility() {
    setState(() {
      _isPasswordConfirmVisible = !_isPasswordConfirmVisible;
    });
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSignUpPressed() async {
    if (!Validators.isFormValid(_email, _password, _passwordConfirm)) {
      return;
    }

    await ref.read(signUpProvider.notifier).signUpWithEmailAndPassword(
          email: _email,
          password: _password,
        );

    if (mounted) {
      context.go(MainNavbarTweetScreen.routeURL);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(50),
              Text(
                "English (US)",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.grey.shade700,
                    ),
              ),
              const Gap(100),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isDarkMode(ref) ? Colors.white : Colors.black,
                ),
                child: FaIcon(
                  FontAwesomeIcons.threads,
                  size: size.width * 0.14,
                  color: isDarkMode(ref) ? Colors.black : Colors.white,
                ),
              ),
              const Gap(120),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: 'Mobile number or email',
                  errorText: Validators.validateEmail(_email),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              const Gap(20),
              TextField(
                controller: _passwordController,
                autocorrect: false,
                cursorColor: Theme.of(context).primaryColor,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  errorText: Validators.validatePassword(_password),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              const Gap(20),
              TextField(
                controller: _passwordConfirmController,
                autocorrect: false,
                cursorColor: Theme.of(context).primaryColor,
                obscureText: !_isPasswordConfirmVisible,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  errorText:
                      Validators.confirmPassword(_password, _passwordConfirm),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordConfirmVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordConfirmVisibility,
                  ),
                ),
              ),
              const Gap(20),
              CommonButton(
                textChange: Validators.isFormValid(
                  _email,
                  _password,
                  _passwordConfirm,
                ),
                validate: Validators.isFormValid(
                  _email,
                  _password,
                  _passwordConfirm,
                ),
                colorChange: Validators.isFormValid(
                  _email,
                  _password,
                  _passwordConfirm,
                ),
                text: "Create new account",
                onPressed: _onSignUpPressed,
              ),
              const Spacer(),
              TextButton(
                onPressed: () => context.pop(),
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  'Back to Sign in page',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FaIcon(
                    FontAwesomeIcons.meta,
                    size: 18,
                    color: Colors.grey.shade700,
                  ),
                  const Gap(5),
                  Text(
                    "Meta",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.grey.shade700,
                        ),
                  ),
                ],
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
