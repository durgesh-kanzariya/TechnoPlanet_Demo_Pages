import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration>
    with TickerProviderStateMixin {
  // Add mixin here
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool rememberMe = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Animation controller
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1, curve: Curves.easeOut),
      ), // Added missing parenthesis here
    );

    // Start animation after page builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Hero(
            tag: 'background',
            child: Image.asset(
              "assets/vectors/Vector 4.png",
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 54),
                  Hero(
                    tag: 'title',
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        'Techno Planet',
                        style: TextStyle(
                          color: const Color(0xFF1E1E1E),
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Hero(
                    tag: 'toggle',
                    child: Material(
                      type: MaterialType.transparency,
                      child: _buildToggleSwitch(),
                    ),
                  ),
                  const SizedBox(height: 38),
                  FadeTransition(
                    opacity: _opacityAnimation,
                    child: const Text(
                      'Hello there 👋',
                      style: TextStyle(
                        color: Color(0xFF151A1D),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildAnimatedField(
                    index: 0,
                    child: _buildInputField(
                      hint: 'Name',
                      icon: Icons.person_outlined,
                      controller: nameController,
                      isPassword: false,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildAnimatedField(
                    index: 1,
                    child: _buildInputField(
                      hint: 'Email',
                      icon: Icons.email_outlined,
                      controller: emailController,
                      isPassword: false,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildAnimatedField(
                    index: 2,
                    child: _buildPasswordField(
                      'Password',
                      passwordController,
                      obscurePassword,
                      () => setState(() => obscurePassword = !obscurePassword),
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildAnimatedField(
                    index: 3,
                    child: _buildPasswordField(
                      'Confirm Password',
                      confirmPasswordController,
                      obscureConfirmPassword,
                      () => setState(
                        () => obscureConfirmPassword = !obscureConfirmPassword,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildAnimatedField(index: 4, child: _buildRememberMe()),
                  const SizedBox(height: 20),
                  Hero(
                    tag: 'submit',
                    child: Material(
                      type: MaterialType.transparency,
                      child: _buildSubmitButton(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Hero(
                    tag: 'google',
                    child: Material(
                      type: MaterialType.transparency,
                      child: _buildGoogleButton(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedField({required int index, required Widget child}) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final animation = CurvedAnimation(
          parent: _animationController,
          curve: Interval(0.1 + 0.15 * index, 1.0, curve: Curves.easeOut),
        );

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.2),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  Widget _buildToggleSwitch() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F7),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: 170,
            top: 4,
            child: Container(
              width: 190,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26A7A9B7),
                    blurRadius: 40,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: const Color(0xFFA7A9B7),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Registration',
                    style: TextStyle(
                      color: const Color(0xFF191D31),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF97999B)),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Color(0xFF97999B),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField(
    String hint,
    TextEditingController controller,
    bool obscure,
    VoidCallback onToggle,
  ) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.lock_outline, color: Color(0xFF97999B)),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscure,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Color(0xFF97999B),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              color: const Color(0xFF97999B),
            ),
            onPressed: onToggle,
          ),
        ],
      ),
    );
  }

  Widget _buildRememberMe() {
    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          onChanged: (value) => setState(() => rememberMe = value ?? false),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: const BorderSide(color: Color(0xFFCBCCCC)),
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            color: Color(0xFF8D9092),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xff4aabff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'Submit',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Color(0xfff5f5f5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: BorderSide.none,
          shadowColor: const Color(0x26A7A9B7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons8-google-144.png', // Use the same asset as login
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 10),
            const Text(
              'Sign up with Google',
              style: TextStyle(
                color: Color(0xFF191D31),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
