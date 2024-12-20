import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/core/router/router.gr.dart';
import 'package:ioe_hub/core/theme/bloc/theme_bloc.dart';
import 'package:ioe_hub/features/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:ioe_hub/features/profile/widgets/profile_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  _changeTheme(ThemeMode themeMode, BuildContext context) {
    context.read<ThemeCubit>().setTheme(themeMode);
  }

  @override
  void initState() {
    context.read<AuthBloc>().add(const AuthCheckLoggedIn());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeState) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('PROFILE'),
            actions: const [],
          ),
          body: ListView(
            children: [
              // Profile picture and name
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthCheckLoggedInState) {
                    return GenericListTile(
                      onTap: () {
                        AutoRouter.of(context)
                            .push(ProfileDetailRoute(user: state.user));
                      },
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        backgroundImage:
                            CachedNetworkImageProvider(state.user.profilePic),
                      ),
                      title: Text(state.user.fullName ?? state.user.userName),
                      subtitle: Text(state.user.email),
                    );
                  } else {
                    return GenericListTile(
                      onTap: () {
                        AutoRouter.of(context).push(const LoginRoute());
                      },
                      leading: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        radius: 30,
                        child: Icon(
                          Iconsax.user,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      title: Text(
                        'IOE Hub Account',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer
                                  .withOpacity(0.7),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      subtitle: Text(
                        'Tap to Login',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer
                                  .withOpacity(0.7),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    );
                  }
                },
              ),
              GenericListTile(
                leading: const Icon(Iconsax.moon),
                trailing: ThemeSwitch(
                    themeMode: themeState,
                    onChanged: (mode) => _changeTheme(mode, context)),
                title: const Text('Theme'),
                onTap: () {
                  _changeTheme(
                      themeState == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light,
                      context);
                },
              ),

              GenericListTile(
                leading: const Icon(Iconsax.d_cube_scan),
                title: const Text('My Space'),
                onTap: () {
                  AutoRouter.of(context).push(const MySpaceRoute());
                },
              ),
              GenericListTile(
                leading: const Icon(Iconsax.document_download),
                title: const Text('Saved Content'),
                onTap: () {
                  AutoRouter.of(context).push(const DownloadRoute());
                },
              ),

              GenericListTile(
                leading: const Icon(Iconsax.message),
                title: const Text('Report Bugs'),
                onTap: () {
                  AutoRouter.of(context).push(const IssueRoute());
                },
              ),

              GenericListTile(
                leading: const Icon(Iconsax.info_circle),
                title: const Text('About'),
                onTap: () {
                  AutoRouter.of(context).push(const AboutRoute());
                },
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthCheckLoggedInState ||
                      state is AuthLogoutLoading) {
                    return GenericListTile(
                      leading: const Icon(Iconsax.logout),
                      title: const Text('Logout'),
                      onTap: () {
                        context.read<AuthBloc>().add(AuthLogOut());
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class ThemeSwitch extends StatelessWidget {
  final ThemeMode themeMode;
  final void Function(ThemeMode themeMode) onChanged;

  const ThemeSwitch(
      {super.key, required this.themeMode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: themeMode == ThemeMode.dark,
      onChanged: (value) {
        onChanged(value ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}
