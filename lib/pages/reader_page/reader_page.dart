import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/basic_state.dart';
import '../../models/topic.dart';
import '../../packages/native_pdf_renderer/assets_pdf_viewer.dart';
import '../../repositories/favourite_repo.dart';
import '../../widgets/multi_value_listenable_builder.dart';
import 'reader_view_controller.dart';

class ReaderPage extends StatelessWidget {
  final Topic topic;
  const ReaderPage({
    Key? key,
    required this.topic,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late final PdfController pdfController;

    return Provider<ReaderViewController>(
        create: (_) => ReaderViewController(
            word: topic, favouriteRepository: PrefFavouriteRepository())
          ..onLoad(),
        builder: (context, _) {
          final viewController = context.read<ReaderViewController>();
          return ValueListenableBuilder<StateStaus>(
              valueListenable: viewController.stateStatus,
              builder: (context, stateStatus, _) {
                if (stateStatus == StateStaus.loading) return const Material();
                //
                pdfController =
                    PdfController(intialPage: viewController.initialPage);
                return Scaffold(
                  appBar: AppBar(
                    title: Text(viewController.bookName),
                    actions: [
                      ValueListenableBuilder<bool>(
                          valueListenable: viewController.isAddedFavourite,
                          builder: (_, isAddedFavourite, __) {
                            return IconButton(
                                onPressed: topic.id == 0
                                    ? null
                                    : viewController.onClickedFavourite,
                                icon: isAddedFavourite
                                    ? const Icon(Icons.favorite)
                                    : const Icon(Icons.favorite_outline));
                          }),
                      ValueListenableBuilder<Axis>(
                          valueListenable: viewController.scrollDirection,
                          builder: (_, scrollDirection, __) {
                            return IconButton(
                                onPressed: viewController.onToggleScrollMode,
                                icon: scrollDirection == Axis.vertical
                                    ? const Icon(Icons.swap_vert)
                                    : const Icon(Icons.swap_horiz_outlined));
                          }),
                      AppPopupMenu<ColorMode>(
                        icon: const Icon(Icons.palette_outlined),
                        initialValue: viewController.colorMode.value,
                        menuItems: const [
                          PopupMenuItem(
                            value: ColorMode.day,
                            child: Text('????????????'),
                          ),
                          PopupMenuItem(
                            value: ColorMode.night,
                            child: Text('?????????'),
                          ),
                          PopupMenuItem(
                            padding: EdgeInsets.only(left: 16),
                            value: ColorMode.speia,
                            child: Text('????????????????????????????????????'),
                          ),
                        ],
                        offset: const Offset(16, 54),
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onSelected: viewController.onChangedColorMode,
                      ),
                    ],
                  ),
                  body: ValueListenableBuilder2<Axis, ColorMode>(
                      first: viewController.scrollDirection,
                      second: viewController.colorMode,
                      builder: (_, scrollDirection, colorMode, __) {
                        return AssetPdfViewer(
                          assetPath: viewController.assetsPath,
                          scrollDirection: scrollDirection,
                          pdfController: pdfController,
                          colorMode: colorMode,
                        );
                      }),
                );
              });
        });
  }
}
