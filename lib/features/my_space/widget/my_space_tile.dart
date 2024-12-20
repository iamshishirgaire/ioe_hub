import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/core/router/router.gr.dart';
import 'package:ioe_hub/core/utils/separate_letter_digits.dart';
import 'package:ioe_hub/core/utils/snake_case.dart';
import 'package:ioe_hub/features/my_space/blocs/my_space_bloc/my_space_bloc.dart';
import 'package:ioe_hub/features/my_space/blocs/my_space_bloc/my_space_event.dart';
import 'package:ioe_hub/features/my_space/blocs/my_space_bloc/my_space_state.dart';
import 'package:ioe_hub/features/profile/widgets/profile_tile.dart';

class MySpaceTile extends StatefulWidget {
  const MySpaceTile({super.key});

  @override
  State<MySpaceTile> createState() => _MySpaceTileState();
}

class _MySpaceTileState extends State<MySpaceTile> {
  @override
  void initState() {
    context.read<MySpaceBloc>().add(LoadCurrentSpaceEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MySpaceBloc, MySpaceState>(
      builder: (context, state) {
        if (state is MySpaceLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GenericListTile(
              tileColor: Theme.of(context).colorScheme.primaryFixed,
              leading: const Icon(Iconsax.d_cube_scan),
              title: const Text('My Space'),
              subtitle: Text(
                'Semester: ${separateLettersDigits(state.semester.name)}\nCourse: ${toTitleCase(state.faculty.name)}',
                style: const TextStyle(fontSize: 12),
              ),
              trailing: const Icon(Iconsax.arrow_right4),
              onTap: () {
                AutoRouter.of(context)
                    .push(SubjectsRoute(semesterId: state.semester.id));
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
