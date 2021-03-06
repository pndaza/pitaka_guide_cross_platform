import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/basic_state.dart';
import '../../../repositories/recent_repo.dart';
import '../../../widgets/loading_view.dart';
import 'recent_list_view.dart';
import 'recent_page_app_bar.dart';
import 'recent_page_view_controller.dart';

class RecentPage extends StatelessWidget {
  const RecentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<RecentPageViewController>(
        create: (_) => RecentPageViewController(
              recentRepository: PrefRecentRepository(),
            )..onLoad(),
        dispose: (context, controller) => controller.dispose(),
        builder: (context, __) => Scaffold(
              appBar: const RecentPageAppBar(),
              body: ValueListenableBuilder<StateStaus>(
                  valueListenable:
                      context.read<RecentPageViewController>().state,
                  builder: (_, state, __) {
                    if (state == StateStaus.loading) {
                      return const LoadingView();
                    }
                    if (state == StateStaus.nodata) {
                      return const Center(
                        child: Text(
                          'ကြည့်ခဲ့သော အကြောင်းအရာများ\nမရှိသေးပါ',
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    return RecentlistView(
                      recents: context.read<RecentPageViewController>().recents,
                    );
                  }),
            ));
  }
}
