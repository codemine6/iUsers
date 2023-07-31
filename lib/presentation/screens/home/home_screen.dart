import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:iusers/presentation/providers/users/users_provider.dart';
import 'package:iusers/presentation/providers/users/users_state.dart';
import 'package:iusers/presentation/screens/add_user/add_user_screen.dart';
import 'package:iusers/presentation/screens/home/widgets/home_app_bar.dart';
import 'package:iusers/presentation/screens/home/widgets/search_form.dart';
import 'package:iusers/presentation/widgets/user_item.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final usersState = ref.watch(usersProvider);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: HomeAppBar(),
      ),
      body: Column(
        children: [
          const SearchForm(),
          if (usersState is UsersLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 100),
              child: CircularProgressIndicator(),
            ),
          if (usersState is UsersLoaded && usersState.users.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Icon(
                Ionicons.file_tray_outline,
                size: 62,
                color: Theme.of(context).colorScheme.primary.withAlpha(150),
              ),
            ),
          if (usersState is UsersLoaded)
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                itemBuilder: (context, index) {
                  return UserItem(user: usersState.users[index]);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: usersState.users.length,
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Ionicons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddUserScreen()),
          ).then((value) {
            ref.read(usersProvider.notifier).getAllUsers();
          });
        },
      ),
    );
  }
}
