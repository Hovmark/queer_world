import 'package:flutter/material.dart';
import 'package:queer_world/design_components/colors.dart';
import 'package:queer_world/design_components/queer_icons.dart';
import 'package:queer_world/design_components/queer_text.dart';
import 'package:queer_world/dialogs/widgets/add_tags_widget.dart';
import 'package:queer_world/dialogs/widgets/business_request_field.dart';
import 'package:queer_world/models/enum/business_type.dart';
import 'package:queer_world/store/form_add_business.dart';

class AddBusinessRequestDialog extends StatefulWidget {
  const AddBusinessRequestDialog({super.key});

  @override
  State<AddBusinessRequestDialog> createState() =>
      _AddBusinessRequestDialogState();
}

class _AddBusinessRequestDialogState extends State<AddBusinessRequestDialog> {
  final formKey = GlobalKey<FormState>();
  final FormAddBusinessStore store = FormAddBusinessStore();

  @override
  void initState() {
    super.initState();
    store.setupValidations();
    // store.tags.addAll(["Graphic design", "App development", "Photography"]);
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Container(
        decoration: const BoxDecoration(gradient: rainbowGradient),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close)),
                ),
                const QueerTextHeader(text: "Add a business request"),
                DropdownMenu(
                  label: const QueerText(text: "Type"),
                  onSelected: (value) => store.businessType = value!,
                  width: MediaQuery.of(context).size.width - 32,
                  inputDecorationTheme: const InputDecorationTheme(
                      activeIndicatorBorder: BorderSide.none),
                  dropdownMenuEntries: BusinessType.values
                      .map((BusinessType item) =>
                          DropdownMenuEntry<BusinessType>(
                            value: item,
                            label: item.title,
                          ))
                      .toList(),
                ),
                TextField(
                  onChanged: (value) => store.business = value,
                  decoration: const InputDecoration(labelText: 'Business'),
                ),
                TextField(
                  onChanged: (value) => store.description = value,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const EditTagsWidget(),
                BusinessRequestField(
                    label: "Website",
                    icon: QueerIcons.website,
                    onChanged: (value) => store.website = value),
                BusinessRequestField(
                    label: "Instagram",
                    icon: QueerIcons.instagram,
                    onChanged: (value) => store.instagram = value),
                BusinessRequestField(
                    label: "TikTok",
                    icon: QueerIcons.tiktok,
                    onChanged: (value) => store.tiktok = value),
                BusinessRequestField(
                    label: "Facebook",
                    icon: QueerIcons.facebook,
                    onChanged: (value) => store.facebook = value),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    final router = Navigator.of(context);
                    store.validateAll();
                    // if (!store.isBusinessCheckPending) {
                    store.addBusinessRequest();
                    // }
                    router.pop();

                    //            await GetIt.I
                    // .get<BusinessState>()
                    // .addBusinessRequest(businessRequest);
                  },
                  child: const Text('Send request'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
