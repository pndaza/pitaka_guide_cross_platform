import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:pitakaguide/repositories/category_repo.dart';
import 'package:provider/provider.dart';

import '../../../controllers/theme_controller.dart';
import '../../../data/constants.dart';
import '../../../models/topic.dart';
import '../../../models/category.dart';
import '../../info_page/info_page.dart';
import '../../reader_page/reader_page.dart';
import '../../topic_page/topic_page.dart';
import 'book_grid_tile.dart';
import 'category_button.dart';
import 'showcase_state.dart';
import 'showcase_view_controller.dart';

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ShowcaseViewController>(
      create: (_) =>
          ShowcaseViewController(categoryRepository: CsvCategoryRepository())
            ..onLoad(),
      dispose: (_, controller) {
        controller.dispose();
      },
      child: const ShowcaseView(),
    );
  }
}

class ShowcaseView extends StatelessWidget {
  const ShowcaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ShowcaseViewController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ပိဋကလမ်းညွှန်'),
        centerTitle: true,
        actions: _actions(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // book view
            SizedBox(
              height: 350,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BookGridTile(
                    title: 'ပထမတွဲ',
                    imagePath: AssetsImage.kCoverVolumeOne,
                    onTap: () => _onClickedBook(context: context, bookId: 1),
                  ),
                  BookGridTile(
                    title: 'ဒုတိယတွဲ',
                    imagePath: AssetsImage.kCoverVolumeTwo,
                    onTap: () => _onClickedBook(context: context, bookId: 2),
                  ),
                  BookGridTile(
                    title: 'တတိယတွဲ',
                    imagePath: AssetsImage.kCoverVolumeThree,
                    onTap: () => _onClickedBook(
                      context: context,
                      bookId: 3,
                    ),
                  ),
                ],
              ),
            ),

            // categorire
            ValueListenableBuilder<ShowcaseState>(
                valueListenable: controller.state,
                builder: (_, state, __) {
                  return state.when(
                    loading: () => Container(),
                    data: (categories) => Wrap(
                      children: List<Widget>.generate(
                          categories.length,
                          (index) => CategoryButton(
                                categoryName: categories[index].name,
                                onPressed: () => _onClickedCategory(
                                  context: context,
                                  category: categories[index],
                                ),
                              )),
                      spacing: 8.0,
                      runSpacing: 16.0,
                    ),
                  );
                }),
            // for padding
            const SizedBox(height: 16.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const TopicPage()),
          );
        },
        child: const Icon(Icons.search),
      ),
    );
  }

  List<Widget> _actions(BuildContext context) {
    return <Widget>[
      AppPopupMenu<ThemeMode>(
        icon: const Icon(Icons.palette_outlined),
        initialValue: context.read<ThemeController>().themeMode.value,
        menuItems: const [
          PopupMenuItem(
            value: ThemeMode.light,
            child: Text('နေ့'),
          ),
          PopupMenuItem(
            value: ThemeMode.dark,
            child: Text('ည'),
          ),
          PopupMenuItem(
            value: ThemeMode.system,
            child: Text('စက်'),
          ),
        ],
        elevation: 3.0,
        offset: const Offset(36, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onSelected: context.read<ThemeController>().onChangedThemeMode,
      ),
      IconButton(
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const InfoPage()),
              ),
          icon: const Icon(Icons.info_outlined)),
    ];
  }

  void _onClickedBook({required BuildContext context, required int bookId}) {
    final word = Topic(
      bookID: bookId,
      pageNumber: 1,
      categoryID: 0, // not use
      id: 0, // not use
      name: '', // not use
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ReaderPage(topic: word)),
    );
  }

  void _onClickedCategory(
      {required BuildContext context, required Category category}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => TopicPage(category: category)),
    );
  }
}
