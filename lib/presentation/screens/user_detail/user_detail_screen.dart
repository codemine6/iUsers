import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:iusers/domain/entities/user_entity.dart';
import 'package:iusers/presentation/providers/user/user_provider.dart';
import 'package:iusers/presentation/providers/user/user_state.dart';
import 'package:iusers/presentation/screens/user_detail/widgets/detail_app_bar.dart';

class UserDetailScreen extends ConsumerWidget {
  final UserEntity user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userProvider, (previous, next) {
      if (next is UserDeleted) {
        Navigator.pop(context);
      }
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: DetailAppBar(user),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Hero(
              tag: user.id ?? '',
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 68,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.profileUrl ?? ''),
                  radius: 64,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user.username ?? '',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              user.bio ?? '',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Ionicons.mail_outline, size: 20),
                      const SizedBox(width: 16),
                      Text(user.email ?? ''),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Ionicons.call_outline, size: 20),
                      const SizedBox(width: 16),
                      Text(user.phone ?? ''),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
