import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController bioController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const UserForm({
    super.key,
    required this.usernameController,
    required this.bioController,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(labelText: 'Full Name'),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: bioController,
            decoration: const InputDecoration(labelText: 'Bio'),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email Address'),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 18),
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
