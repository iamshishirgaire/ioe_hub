import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/core/router/router.gr.dart';
import 'package:ioe_hub/core/ui/app_error_widget.dart';
import 'package:ioe_hub/core/ui/shimmer_tile.dart';
import 'package:ioe_hub/features/pastPaper/bloc/questions_bloc.dart';
import 'package:ioe_hub/features/pastPaper/models/question.dart';
import 'package:ioe_hub/features/profile/widgets/profile_tile.dart';

@RoutePage()
class PastQuestionsPage extends StatefulWidget {
  const PastQuestionsPage({super.key});

  @override
  State<PastQuestionsPage> createState() => _PastQuestionsPageState();
}

class _PastQuestionsPageState extends State<PastQuestionsPage> {
  var selectedSemester = "1st Sem";
  @override
  void initState() {
    super.initState();
  }

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
                  context.read<QuestionsBloc>().add(LoadQuestions(
                        query: event,
                        page: 1,
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
                hintText: 'Search subjects..',
              ),
              showCloseIcon: false,
              duration: const Duration(minutes: 1),
            ));
          },
          child: const Icon(Iconsax.search_normal_14),
        ),
        appBar: AppBar(
          title: const Text('QUESTIONS'),
        ),
        body: BlocBuilder<QuestionsBloc, QuestionsState>(
          builder: (context, state) {
            return Column(
              children: [
                Builder(builder: (context) {
                  const semesters = [
                    "1st Sem",
                    "2nd Sem",
                    "3rd Sem",
                    "4th Sem",
                    "5th Sem",
                    "6th Sem",
                    "7th Sem",
                    "8th Sem",
                    "Elective I"
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
                              label: Text(semester),
                              selected: selectedSemester == semester,
                              onSelected: (value) {
                                setState(() {
                                  selectedSemester = semester;
                                });
                                context
                                    .read<QuestionsBloc>()
                                    .add(LoadQuestions(semester: semester));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    margin: const EdgeInsets.only(bottom: 3),
                                    content: Text('$semester selected. '),
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
                if ((state is QuestionsLoaded && state.questions.isEmpty) ||
                    state is QuestionsError)
                  const AppErrorWidget(
                    message: "No questions found.",
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: (state is QuestionsLoaded)
                        ? state.questions.length
                        : 10,
                    itemBuilder: (context, index) {
                      final question = (state is QuestionsLoaded)
                          ? state.questions[index]
                          : Question(
                              subject: "",
                              semester: "",
                              id: '',
                              previewLink: '');
                      return (state is QuestionsLoaded)
                          ? GenericListTile(
                              title: Text(question.subject),
                              subtitle: Text(question.semester),
                              trailing: Icon(
                                Iconsax.arrow_right4,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 20.0,
                              ),
                              onTap: () {
                                AutoRouter.of(context).push(
                                    PastQuestionDetailRoute(
                                        previewLink: question.previewLink,
                                        subjectName: question.subject));
                              },
                            )
                          : const ShimmerTile(
                              child: ListTile(
                                title: Text(""),
                                subtitle: Text(""),
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
