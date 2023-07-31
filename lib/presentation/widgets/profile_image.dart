import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ProfileImage extends StatefulWidget {
  final String url;
  final Function(String url) onChange;

  const ProfileImage({super.key, required this.url, required this.onChange});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  List images = List.generate(16, (index) {
    final char = String.fromCharCode('a'.codeUnitAt(0) + index);
    return 'https://api.multiavatar.com/$char.png';
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 56,
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.url),
              radius: 52,
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Choose avatar'),
                    content: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 6,
                      runSpacing: 6,
                      children: images
                          .map(
                            (image) => GestureDetector(
                              child: CircleAvatar(
                                backgroundColor: widget.url == image
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.transparent,
                                radius: 26,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(image),
                                  radius: 22,
                                ),
                              ),
                              onTap: () {
                                widget.onChange(image);
                                Navigator.pop(context);
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Icon(
                  Ionicons.camera_reverse_outline,
                  size: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
