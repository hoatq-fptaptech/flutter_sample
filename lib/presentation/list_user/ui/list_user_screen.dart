import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../app/app.dart';
import '../bloc/list_user_bloc.dart';

// Project imports:

class ListUserScreen extends StatefulWidget {
  const ListUserScreen({Key? key}) : super(key: key);

  @override
  _ListUserScreenState createState() {
    return _ListUserScreenState();
  }
}

class _ListUserScreenState extends State<ListUserScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "List User",
          style: TextStyleManager.label3,
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<ListUserBloc, ListUserState>(
        listener: (context, state) {
          if (!state.loading) {
            _refreshController.refreshCompleted();
            _refreshController.loadComplete();
          }
        },
        builder: (context, state) {
          return SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: () =>
                context.read<ListUserBloc>().add(const ListUserEvent.get()),
            onLoading: () => context
                .read<ListUserBloc>()
                .add(const ListUserEvent.loadMore()),
            child: ListView.separated(
              itemBuilder: (context, index) => Center(
                child: Text(
                  "User $index",
                  style: TextStyleManager.label3,
                ),
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.users.length,
            ),
          );
        },
      ),
    );
  }
}
