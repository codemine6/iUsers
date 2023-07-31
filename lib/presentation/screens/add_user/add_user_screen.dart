import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iusers/domain/entities/user_entity.dart';
import 'package:iusers/presentation/providers/user/user_provider.dart';
import 'package:iusers/presentation/providers/user/user_state.dart';
import 'package:iusers/presentation/widgets/custom_button.dart';
import 'package:iusers/presentation/widgets/profile_image.dart';
import 'package:iusers/presentation/widgets/user_form.dart';

class AddUserScreen extends ConsumerStatefulWidget {
  const AddUserScreen({super.key});

  @override
  ConsumerState<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends ConsumerState<AddUserScreen> {
  final usernameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String profileUrl = 'https://api.multiavatar.com/a.png';

  @override
  void dispose() {
    usernameController.dispose();
    bioController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userProvider, (previous, next) {
      if (next is UserCreated) {
        Navigator.pop(context);
      }
    });

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileImage(
                url: profileUrl,
                onChange: (url) {
                  setState(() {
                    profileUrl = url;
                  });
                },
              ),
              const SizedBox(height: 24),
              UserForm(
                usernameController: usernameController,
                bioController: bioController,
                emailController: emailController,
                phoneController: phoneController,
              ),
              const SizedBox(height: 24),
              CustomButton(
                isLoading: ref.watch(userProvider) is UserLoading,
                onPressed: () {
                  final userData = UserEntity(
                    bio: bioController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    profileUrl: profileUrl,
                    username: usernameController.text,
                  );
                  ref.read(userProvider.notifier).addNewUser(userData);
                },
                child: Text(
                  'Add New User',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
