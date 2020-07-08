// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:gallery/studies/procurify/backdrop.dart';
import 'package:gallery/studies/procurify/tabs/custom.dart';


class AccountView extends StatefulWidget {
  final Function(int) tabHandler;
  final TabController tabController;
  AccountView({Key key, this.tabHandler, this.tabController}) : super(key: key);

  @override
  AccountViewState createState() => AccountViewState();
}

class AccountViewState extends State<AccountView> {
  IconData iconData = Icons.account_box;

  void changePage(int index) {
    switch (index) {
      case 0:
        iconData = Icons.account_box;
        break;
      case 1:
        iconData = Icons.ac_unit;
        break;
      case 2:
        iconData = Icons.access_alarms;
        break;
      default:
        iconData = Icons.account_box;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomView(
      mainView: ProcurifyAppBar(tabController: widget.tabController, stateWidget: this),
      sidebarItems: CustomSidebarItem(),
    );
  }
}
