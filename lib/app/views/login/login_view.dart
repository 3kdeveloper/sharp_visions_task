import 'package:sharpvisions_task/app/models/request/user_body/user_body.dart';

import '../../../core/constants/exports.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60),

                Center(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.lock_outline,
                          color: AppColors.whiteColor,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextViewWidget(
                        'Welcome Back',
                        style: textTheme.headlineMedium?.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextViewWidget(
                        'Sign in to your account',
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColors.blackColor.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                TextViewWidget(
                  'Email',
                  style: textTheme.labelMedium?.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormFieldWidget(
                  controller: _emailController,
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.email],
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.blackColor.withValues(alpha: 0.5),
                  ),
                  validator: (email) =>
                      Validation.validateEmail(context, email),
                ),

                const SizedBox(height: 16),

                TextViewWidget(
                  'Password',
                  style: textTheme.labelMedium?.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Consumer<LoginViewModel>(
                  builder: (context, controller, _) {
                    return TextFormFieldWidget(
                      controller: _passwordController,
                      hintText: 'Enter your password',
                      obscureText: controller.obscurePassword,
                      textInputAction: TextInputAction.done,
                      autofillHints: const [AutofillHints.password],
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: AppColors.blackColor.withValues(alpha: 0.5),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.blackColor.withValues(alpha: 0.5),
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                      validator: (password) =>
                          Validation.validatePassword(context, password),
                    );
                  },
                ),

                const SizedBox(height: 40),

                Consumer<LoginViewModel>(
                  builder: (context, controller, _) {
                    return ButtonWidget(
                      btnText: 'Login',
                      onTap: () async {
                        if (context.validateForm(_formKey)) {
                          context.unFocusKeyboard();
                          final deviceId =
                              await locator<Utils>().getDeviceId() ?? '';
                          final user = UserBody(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                            deviceToken: deviceId,
                            language: 'en',
                          );
                          logger.f(user.toJson());

                          controller.login(user).then((result) {
                            if (!result && !context.mounted) return;

                            context.pushNamedAndRemoveUntil(
                              RouteNames.homeView,
                            );
                          });
                        }
                      },
                      isShowLoading: controller.isLoading,
                      color: AppColors.primaryColor,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
