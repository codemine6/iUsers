import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iusers/domain/entities/user_entity.dart';
import 'package:iusers/presentation/providers/user/user_provider.dart';
import 'package:iusers/presentation/screens/edit_user/edit_user_screen.dart';

class DetailAppBar extends ConsumerWidget {
  final UserEntity user;

  const DetailAppBar(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: () {
                Future.delayed(
                  const Duration(milliseconds: 1),
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditUserScreen(user: user)),
                  ),
                );
              },
              child: const Text('Edit User'),
            ),
            PopupMenuItem(
              onTap: () {
                Future.delayed(
                  const Duration(microseconds: 1),
                  () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete User'),
                      content: const Text('Delete this user data?'),
                      actions: [
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ref
                                .read(userProvider.notifier)
                                .deleteUser(user.id ?? 0);
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text('Delete User'),
            ),
          ],
        ),
      ],
    );
  }
}
