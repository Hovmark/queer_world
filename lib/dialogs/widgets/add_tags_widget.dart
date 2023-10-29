import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:queer_world/design_components/colors.dart';
import 'package:queer_world/design_components/queer_text.dart';
import 'package:queer_world/store/form_add_business.dart';

class EditTagsWidget extends StatefulWidget {
  const EditTagsWidget({
    required this.store,
    super.key,
  });

  final FormAddBusinessStore store;
  @override
  State<EditTagsWidget> createState() => _EditTagsWidgetState();
}

class _EditTagsWidgetState extends State<EditTagsWidget> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(spacing: 2, children: [
            ...widget.store.tags.map(
              (tag) {
                return TagChip(
                  category: tag,
                  onTap: () => widget.store.removeTag(tag),
                );
              },
            ).toList(),
            TextField(
              controller: controller,
              onEditingComplete: () {
                widget.store.addTag(controller.text);
                controller.clear();
              },
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                label: QueerText(text: 'Add tag'),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: purple, width: 0.6),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: purple, width: 1.5),
                ),
              ),
            )
          ]),
        ],
      );
    });
  }
}

class AddTagChipField extends StatelessWidget {
  const AddTagChipField({
    super.key,
    required this.onTap,
  });

  final Function(String) onTap;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (category) {
        onTap(category);
      },
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        hintText: 'Add new tag',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: purple),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: purple),
        ),
      ),
    );
  }
}

class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.category,
    required this.onTap,
  });
  final String category;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 2),
      elevation: 2,
      shadowColor: Colors.black,
      side: const BorderSide(color: transparent),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      onDeleted: onTap,
      deleteIcon: const Icon(
        Icons.close,
        color: purple,
        size: 16,
      ),
      label: Text(
        category,
        style: const TextStyle(color: purple),
      ),
    );
  }
}

class TagChipButton extends StatelessWidget {
  const TagChipButton({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        decoration: const BoxDecoration(
            // borderRadius: borderRadius20,
            // border: GradientBoxBorder(
            //   gradient: gradientPurpleToPink,
            //   width: 1,
            // ),
            ),
        child: Padding(
          padding: kIsWeb
              ? const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0)
              : EdgeInsets.zero,
          child: TextField(
            autofocus: true,
            // style: fontBody1,
            focusNode: focusNode,
            decoration: const InputDecoration.collapsed(
              hintText: 'Create tag +',
              // hintStyle: fontBody1,
              border: InputBorder.none,
            ),
            onChanged: onChanged,
            onSubmitted: onSubmitted,
          ),
        ),
      ),
    );
  }
}

// List<String> tags = [
//   'Music',
//   'Arts',
//   'Graphic design',
//   'App development',
//   'Photography',
// ];
