import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GenericListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final double elevation;
  final Color? tileColor;
  final bool selected;
  final Icon? icon;
  final IconData? iconData;
  final Color? iconColor;
  final bool enableShadow;
  final bool dismissible;
  final void Function()? onDismiss;

  const GenericListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.tileColor,
    this.elevation = 0.3,
    this.selected = false,
    this.icon,
    this.iconData,
    this.iconColor,
    this.enableShadow = true,
    this.dismissible = false,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: enableShadow
            ? theme.colorScheme.surfaceContainer.withOpacity(0.6)
            : theme.colorScheme.surface,
      ),
      child: dismissible
          ? Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              movementDuration: const Duration(milliseconds: 200),
              dismissThresholds: const {
                DismissDirection.endToStart: 0.8,
              },
              onDismissed: (d) => onDismiss!(),
              confirmDismiss: (direction) async {
                //show a dialog to get the confirmation
                var selection = false;
                await showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: const Text('Are you sure ?'),
                          content:
                              const Text('Do you want to delete this note ?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => {
                                selection = true,
                                Navigator.of(context).pop(true)
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        ));
                return selection;
              },
              background: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.error.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child:
                        Icon(Iconsax.trash, color: theme.colorScheme.onError),
                  ),
                ]),
              ),
              child: ListTile(
                selectedColor: theme.colorScheme.primary.withOpacity(0.1),
                minVerticalPadding: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                leading: leading,
                title: title,
                subtitle: subtitle,
                trailing: trailing,
                onTap: onTap,
                splashColor: theme.colorScheme.primary.withOpacity(0.2),
                selected: selected,
                selectedTileColor: theme.colorScheme.primary.withOpacity(0.2),
                iconColor: iconColor,
              ),
            )
          : ListTile(
              selectedColor: theme.colorScheme.primary.withOpacity(0.1),
              minVerticalPadding: 23,
              leading: leading,
              title: title,
              subtitle: subtitle,
              trailing: trailing,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              tileColor: tileColor,
              onTap: onTap,
              splashColor: theme.colorScheme.primary.withOpacity(0.2),
              selected: selected,
              selectedTileColor: theme.colorScheme.primary.withOpacity(0.2),
              iconColor: iconColor,
            ),
    );
  }
}
