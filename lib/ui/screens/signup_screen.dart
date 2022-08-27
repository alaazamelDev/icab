import 'package:flutter/material.dart';
import 'package:icab/configs/constants.dart';
import 'package:icab/configs/theme.dart';
import 'package:icab/configs/theme_manager.dart';
import 'package:icab/ui/screens/login_screen.dart';
import 'package:icab/ui/widgets/decorated_text_field.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Consumer<ThemeNotifier>(
          builder: (context, theme, _) {
            final isDark = theme.getTheme() == theme.darkTheme;
            return IconButton(
              onPressed: () {
                final themeNotifier = context.read<ThemeNotifier>();
                if (themeNotifier.getTheme() == themeNotifier.lightTheme) {
                  themeNotifier.setDarkMode();
                } else {
                  themeNotifier.setLightMode();
                }
              },
              splashRadius: 20,
              icon: Icon(
                isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                color: Theme.of(context).hintColor,
                size: 20,
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding * 2,
          vertical: defaultPadding * 4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _HeadingSection(),
            _SignupForm(),
          ],
        ),
      ),
    );
  }
}

class _HeadingSection extends StatelessWidget {
  const _HeadingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/car_red.png'),
        const SizedBox(height: defaultPadding),
        Text(
          'Welcome Aboard!',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: defaultPadding * 0.5),
        Text(
          'Signup with iCab in simple steps',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).hintColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _SignupForm extends StatelessWidget {
  _SignupForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  //Show Password?
  final ValueNotifier<bool> showPassword = ValueNotifier<bool>(false);

  // Field Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DecoratedTextFormField(
            context: context,
            hintText: 'Name',
            prefixIcon: const Icon(Icons.person_outline_rounded),
            keyboardType: TextInputType.name,
            controller: nameController,
          ),
          const SizedBox(height: defaultPadding * 1.5),
          DecoratedTextFormField(
            context: context,
            hintText: 'Phone Number',
            prefixIcon: const Icon(Icons.phone_outlined),
            keyboardType: TextInputType.phone,
            controller: phoneController,
          ),
          const SizedBox(height: defaultPadding * 1.5),
          DecoratedTextFormField(
            context: context,
            hintText: 'Email',
            prefixIcon: const Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
          ),
          const SizedBox(height: defaultPadding * 1.5),
          ValueListenableBuilder<bool>(
              valueListenable: showPassword,
              builder: (context, show, _) {
                return DecoratedTextFormField(
                  context: context,
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  isPasswordField: !show,
                  suffixIcon: IconButton(
                    onPressed: () {
                      showPassword.value = !show;
                    },
                    splashRadius: 18,
                    icon: Icon(
                      show
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Theme.of(context).hintColor,
                      size: 18,
                    ),
                  ),
                );
              }),
          const SizedBox(height: defaultPadding * 2),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.textLight,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding * 2),
          const _AlreadyRegisteredSection()
        ],
      ),
    );
  }
}

class _AlreadyRegisteredSection extends StatelessWidget {
  const _AlreadyRegisteredSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already a User? ',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(context, LoginScreen.route());
          },
          child: const Text('Login now'),
        ),
      ],
    );
  }
}
