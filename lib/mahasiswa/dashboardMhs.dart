import 'package:flutter/material.dart';
import 'package:flutterdemo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterdemo/dosen/DashboardDosen.dart';


class DashboardMhs extends StatefulWidget {
  const DashboardMhs({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DashboardMhs> createState() => _DashboardMhsState();
}

class _DashboardMhsState extends State<DashboardMhs> {
  final _formkey = GlobalKey<FormState>();


