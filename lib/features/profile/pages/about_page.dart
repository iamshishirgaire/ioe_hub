import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABOUT'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About the App',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'The IOE Hub app is designed to help students by providing essential study materials in one place. It includes features such as access to notes, detailed syllabi, and past question papers. Whether preparing for exams or revising lectures, students can find everything they need right at their fingertips.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Me',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Hello! I am Shishir Gaire, a student and a developer. I am passionate about creating solutions that enhance productivity and user experience. I have developed this app specifically for students of  IOE University to provide them with easy access to notes, syllabi, and past question papers. The app aims to streamline the study process by offering a centralized resource platform for students.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Socials',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SocialLink(
                          link: 'https://github.com/iamshishirgaire',
                          path: 'assets/icons/gh.svg',
                        ),
                        SocialLink(
                          height: 22,
                          link: 'https://x.com/ShishirGaire5',
                          path: 'assets/icons/x.svg',
                        ),
                        SocialLink(
                          link: 'https://portfolio-shishir-one.vercel.app/',
                          path: "assets/icons/web.svg",
                        ),
                        SocialLink(
                          path: 'assets/icons/linkedin.svg',
                          link:
                              'https://www.linkedin.com/in/shishir-gaire-157a15261/',
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialLink extends StatelessWidget {
  final String link;
  final double? height;
  final String path;
  const SocialLink(
      {super.key, required this.link, required this.path, this.height});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        onPressed: () {
          launchUrl(Uri.parse(link));
        },
        icon: SvgPicture.asset(
          path,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary,
            BlendMode.srcIn,
          ),
          height: height ?? 30,
        ));
  }
}
