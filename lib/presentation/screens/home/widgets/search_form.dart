import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:iusers/presentation/providers/users/users_provider.dart';
import 'package:iusers/presentation/widgets/custom_button.dart';

class SearchForm extends ConsumerStatefulWidget {
  const SearchForm({super.key});

  @override
  ConsumerState<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends ConsumerState<SearchForm> {
  final queryController = TextEditingController();

  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: queryController,
              decoration: InputDecoration(
                hintText: 'Search User...',
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                filled: true,
                fillColor: Theme.of(context).colorScheme.background,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          CustomButton(
            onPressed: () {
              ref.read(usersProvider.notifier).searchUser(queryController.text);
            },
            child: Icon(
              Ionicons.search,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        ],
      ),
    );
  }
}
