import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ioe_hub/features/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:ioe_hub/features/auth/models/user.dart';

@RoutePage()
class ProfileDetailPage extends StatefulWidget {
  final User user;

  const ProfileDetailPage({super.key, required this.user});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _userNameController;
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _collegeController;
  bool _isDirty = false;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with the user data
    _userNameController = TextEditingController(text: widget.user.userName);
    _fullNameController =
        TextEditingController(text: widget.user.fullName ?? '');
    _emailController = TextEditingController(text: widget.user.email);
    _collegeController = TextEditingController(text: widget.user.college ?? '');

    // Add listeners to track if any field becomes dirty
    _userNameController.addListener(_onFieldChanged);
    _fullNameController.addListener(_onFieldChanged);
    _emailController.addListener(_onFieldChanged);
    _collegeController.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    // Check if any field has changed and update the dirty state
    if (_userNameController.text != widget.user.userName ||
        _fullNameController.text != (widget.user.fullName ?? '') ||
        _emailController.text != widget.user.email ||
        _collegeController.text != (widget.user.college ?? '')) {
      setState(() {
        _isDirty = true;
      });
    } else {
      setState(() {
        _isDirty = false;
      });
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _collegeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLogoutSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.of(context).pop();
        } else if (state is AuthLogoutFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ACCOUNT'),
            actions: [
              if (_isDirty) // Show the update button only if any field is dirty
                TextButton(
                  child: const Text("Update"),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Handle the update logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile Updated!')),
                      );
                    }
                  },
                ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Center(
                            child: CircleAvatar(
                          radius: 70,
                          backgroundImage: CachedNetworkImageProvider(
                              widget.user.profilePic),
                        )),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _userNameController,
                          decoration:
                              const InputDecoration(labelText: 'Username'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _fullNameController,
                          decoration:
                              const InputDecoration(labelText: 'Full Name'),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _collegeController,
                          decoration:
                              const InputDecoration(labelText: 'College'),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
