import 'package:flutter/material.dart';
import 'package:gallery/data/gallery_options.dart';
import 'package:gallery/l10n/gallery_localizations.dart';
import 'package:gallery/layout/adaptive.dart';
import 'package:gallery/layout/image_placeholder.dart';
import 'package:gallery/studies/crane/border_tab_indicator.dart';
import 'package:gallery/studies/crane/colors.dart';
import 'package:gallery/studies/crane/header_form.dart';
import 'package:gallery/studies/procurify/tabs/accounts.dart';

class ProcurifyAppBar extends StatefulWidget {
  final Function(int) tabHandler;
  final TabController tabController;
  final AccountViewState stateWidget;

  const ProcurifyAppBar({Key key, this.tabHandler, this.tabController, this.stateWidget}) : super(key: key);

  @override
  _ProcurifyAppBarState createState() => _ProcurifyAppBarState();
}

class _ProcurifyAppBarState extends State<ProcurifyAppBar> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    final isSmallDesktop = isDisplaySmallDesktop(context);
    final textScaleFactor = GalleryOptions.of(context).textScaleFactor(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop && !isSmallDesktop ? appPaddingLarge : appPaddingSmall,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 24),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
            ),
            child: TabBar(
              indicator: BorderTabIndicator(
                indicatorHeight: isDesktop ? 28 : 32,
                textScaleFactor: textScaleFactor,
              ),
              controller: widget.tabController,
              labelPadding: isDesktop ? const EdgeInsets.symmetric(horizontal: 32) : EdgeInsets.zero,
              isScrollable: isDesktop, // left-align tabs on desktop
              labelStyle: Theme.of(context).textTheme.button,
              labelColor: cranePrimaryWhite,
              unselectedLabelColor: cranePrimaryWhite.withOpacity(.6),
              onTap: (index) {
                widget.stateWidget.changePage(widget.tabController.index);

                widget.tabController.animateTo(
                  index,
                  duration: const Duration(milliseconds: 300),
                );
              },
              tabs: [
                Tab(text: "ORDER"),
                Tab(text: "TRAVEL"),
                Tab(text: "EXPENSE"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
