import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iusers/domain/entities/user_entity.dart';
import 'package:iusers/presentation/providers/users/users_provider.dart';
import 'package:iusers/presentation/screens/user_detail/user_detail_screen.dart';

class UserItem extends ConsumerWidget {
  final UserEntity user;
  const UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserDetailScreen(user: user)),
          ).then((value) {
            ref.read(usersProvider.notifier).getAllUsers();
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Hero(
                tag: user.id ?? '',
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.profileUrl ?? ''),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username ?? '',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user.bio ?? '',
                    style: const TextStyle(fontSize: 12),
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
