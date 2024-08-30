import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tailboard_app/blocs/alert_cubit.dart';
import 'package:tailboard_app/blocs/organization_bloc.dart';
import 'package:tailboard_app/widgets/app_drawer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions = const [],
    this.requiresOrg = true,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.endDrawer,
    this.scaffoldKey,
  });

  final String title;
  final Widget body;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final List<Widget> actions;
  final Key? scaffoldKey;
  final bool requiresOrg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(title),
        actions: [
          ...actions,
          BlocBuilder<AlertCubit, AlertCubitState>(
            builder: (BuildContext context, AlertCubitState state) {
              if (state is Data) {
                if (state.unread > 0) {
                  return IconButton(
                    icon: const Icon(Icons.notifications_active),
                    onPressed: () => context.goNamed('alerts'),
                  );
                }
              }
              return IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () => context.goNamed('alerts'),
              );
            },
          ),
          Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: const Icon(Icons.account_circle),
            );
          }),
        ],
      ),
      drawer: endDrawer,
      endDrawer: AppDrawer(),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: BlocBuilder<OrganizationBloc, OrganizationState>(
          builder: (BuildContext context, OrganizationState state) {
            switch (state) {
              case OrganizationsContent(:final selectedOrganization):
                if (requiresOrg == false || selectedOrganization != null) {
                  return body;
                }
                return Builder(
                  builder: (BuildContext context) {
                    return Center(
                      child: Column(
                        children: [
                          const Text(
                              'Select your current organization to continue.'),
                          ElevatedButton(
                            child: const Text('Select Organization'),
                            onPressed: () => Scaffold.of(context).openEndDrawer(),
                          ),
                        ],
                      ),
                    );
                  }
                );
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }
}
