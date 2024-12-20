import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/core/router/router.gr.dart';
import 'package:ioe_hub/core/ui/app_error_widget.dart';
import 'package:ioe_hub/core/ui/ratings.dart';
import 'package:ioe_hub/core/ui/shimmer_tile.dart';
import 'package:ioe_hub/core/utils/map_number_to_semester.dart';
import 'package:ioe_hub/features/notes/blocs/note_bloc/note_bloc.dart';
import 'package:ioe_hub/features/notes/blocs/note_bloc/note_event.dart';
import 'package:ioe_hub/features/notes/blocs/note_bloc/note_state.dart';
import 'package:ioe_hub/features/notes/models/note.dart';
import 'package:ioe_hub/features/profile/widgets/profile_tile.dart';

@RoutePage()
class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  var selectedSemester = 0;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
              content: SearchBar(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                onSubmitted: (event) {
                  context.read<NoteBloc>().add(FetchNotes(
                        query: event,
                        page: 1,
                        semester: selectedSemester,
                        limit: 10,
                      ));
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                trailing: [
                  IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      icon: const Icon(Icons.close))
                ],
                hintText: 'Search notes..',
              ),
              showCloseIcon: false,
              duration: const Duration(minutes: 1),
            ));
          },
          child: const Icon(Iconsax.search_normal_14),
        ),
        appBar: AppBar(
          title: const Text('NOTES'),
        ),
        body: BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            return Column(
              children: [
                Builder(builder: (context) {
                  const semesters = [
                    1,
                    2,
                    3,
                    4,
                    5,
                    6,
                    7,
                    8,
                    9,
                    10,
                  ];
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...semesters.map((semester) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: FilterChip(
                              label: Text(mapNumberToSemester(semester)),
                              selected: selectedSemester == semester,
                              onSelected: (value) {
                                setState(() {
                                  selectedSemester = semester;
                                });
                                context
                                    .read<NoteBloc>()
                                    .add(FetchNotes(semester: semester));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    margin: const EdgeInsets.only(bottom: 3),
                                    content: Text(
                                        '${mapNumberToSemester(semester)} selected. '),
                                    duration: const Duration(seconds: 3),
                                  ),
                                );
                              },
                            ),
                          );
                        })
                      ],
                    ),
                  );
                }),
                if ((state is NoteLoaded && state.notes.isEmpty) ||
                    state is NoteFailure)
                  const AppErrorWidget(
                    message: "No notes found.",
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: (state is NoteLoaded)
                        ? state.notes.length
                        : (state is NoteLoading)
                            ? 10
                            : 0,
                    itemBuilder: (context, index) {
                      final resNote = (state is NoteLoaded)
                          ? state.notes[index]
                          : Note(0, 0, "", "",
                              id: "",
                              semester: 0,
                              subject: "",
                              previewLink: "");
                      return (state is NoteLoaded && state.notes.isNotEmpty)
                          ? GenericListTile(
                              leading: CircleAvatar(
                                child: Text(
                                  "${resNote.semester.toInt()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.aBeeZee().fontFamily,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          StarRating(
                                            rating: resNote.rating,
                                            starCount: 5,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text("(${resNote.noOfRatings})"),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(resNote.uploadedBy),
                                  // Text(DateFormat.yMMMMd().format(
                                  //     DateTime.parse(resNote.uploadedOn))),
                                ],
                              ),
                              title: Text(resNote.subject),
                              trailing: Icon(
                                Iconsax.arrow_right4,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 20.0,
                              ),
                              onTap: () {
                                AutoRouter.of(context).push(NoteDetailsRoute(
                                    previewLink: resNote.previewLink,
                                    subjectName: resNote.subject));
                              },
                            )
                          : const ShimmerTile(
                              child: ListTile(
                                title: Text("Loading"),
                                subtitle: Text("Loading"),
                                trailing: Icon(
                                  Iconsax.arrow_right4,
                                  color: Colors.grey,
                                  size: 20.0,
                                ),
                              ),
                            );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      );
    });
  }
}
