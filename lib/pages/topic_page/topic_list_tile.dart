import 'package:flutter/material.dart';
import 'package:pitakaguide/models/topic.dart';
import 'package:substring_highlight/substring_highlight.dart';

class TopicListTile extends StatelessWidget {
  final Topic topic;
  final VoidCallback? onTap;
  final String? textToHighlight;

  const TopicListTile({
    Key? key,
    required this.topic,
    this.onTap,
    this.textToHighlight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: SubstringHighlight(
        text: topic.name,
        term: textToHighlight,
        textStyle: TextStyle(
          fontSize: 20.0,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        textStyleHighlight: const TextStyle(color: Colors.deepOrange),
      ),
    );
  }
}
