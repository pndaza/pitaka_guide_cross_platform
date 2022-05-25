import 'package:flutter/material.dart';
import 'package:pitakaguide/pages/reader_page/pdf_reader.dart';
import 'package:pitakaguide/repositories/recent_repo.dart';
import 'package:provider/provider.dart';

import '../../models/category.dart';
import '../../repositories/category_repo.dart';
import '../../repositories/topic_repo.dart';
import '../../widgets/loading_view.dart';
import 'filter_view.dart';
import 'search_bar.dart';
import 'topic_list_tile.dart';
import 'topic_page_state.dart';
import 'topic_page_view_controller.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({
    Key? key,
    this.category,
  }) : super(key: key);

  final Category? category;

  @override
  Widget build(BuildContext context) {
    return Provider<TopicPageViewController>(
      create: (_) => TopicPageViewController(
        topicRepository: CsvTopicRepository(),
        categoryRepository: CsvCategoryRepository(),
        recentRepository: PrefRecentRepository(),
      )..onLoad(category: category),
      child: const TopicView(),
    );
  }
}

class TopicView extends StatelessWidget {
  const TopicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TopicPageViewController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('အကြောင်းအရာ'),
      ),
      body: ValueListenableBuilder<TopicPageState>(
          valueListenable: controller.state,
          builder: (_, state, __) {
            return Column(
              children: [
                SearchFilterBar(
                  searchMode: FilterMode.anywhere,
                  onFilterTextChanged: controller.onFilterTextChanged,
                  onFilterModeChanged: controller.onFilterModeChanged,
                ),
                Expanded(
                  child: state.when(
                    loading: (() => const LoadingView()),
                    data: (topics, categories, currentCategory, filterText) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(children: [
                                Text(
                                  'အုပ်စုအလိုက်',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                const Spacer(),
                                FilterView<Category>(
                                  filters: categories,
                                  currentFilter: currentCategory,
                                  itemBuilder: (filter) {
                                    return Text(filter.name);
                                  },
                                  onChanged: (category) {
                                    controller.onCategoryChanged(category);
                                  },
                                ),
                              ]),
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemCount: topics.length,
                                itemBuilder: (_, index) => TopicListTile(
                                  topic: topics[index],
                                  textToHighlight: filterText,
                                  onTap: () {
                                    final topic = topics[index];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ReaderPage(
                                                topic: topic,
                                              )),
                                    );
                                    controller.onTopicItemClicked(topic);
                                  },
                                ),
                                separatorBuilder: (_, __) => const Divider(
                                  height: 1,
                                ),
                              ),
                            ),
                          ]);
                    },
                    noData: (message) => Center(
                      child: Text(message ?? ''),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
