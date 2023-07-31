import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iusers/domain/entities/user_entity.dart';
import 'package:iusers/presentation/providers/user/user_provider.dart';
import 'package:iusers/presentation/providers/user/user_state.dart';
import 'package:iusers/presentation/widgets/custom_button.dart';
import 'package:iusers/presentation/widgets/profile_image.dart';
import 'package:iusers/presentation/widgets/user_form.dart';

class EditUserScreen extends ConsumerStatefulWidget {
  final UserEntity user;

  const EditUserScreen({super.key, required this.user});

  @override
  ConsumerState<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends ConsumerState<EditUserScreen> {
  final usernameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String profileUrl = '';

  @override
  void initState() {
    usernameController.text = widget.user.username ?? '';
    bioController.text = widget.user.bio ?? '';
    emailController.text = widget.user.email ?? '';
    phoneController.text = widget.user.phone ?? '';
    profileUrl = widget.user.profileUrl ?? '';
    super.initState();
  }

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
      if (next is UserUpdated) {
        Navigator.pop(context);
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
                  ref
                      .read(userProvider.notifier)
                      .updateUser(widget.user.id ?? 0, userData);
                },
                child: Text(
                  'Update User',
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
