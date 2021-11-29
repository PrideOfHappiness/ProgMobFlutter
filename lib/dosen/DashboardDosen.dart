import 'package:flutter/material.dart';
import 'package:flutterdemo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterdemo/dosen/DashboardDosen.dart';


class DashboardDosen extends StatefulWidget {
  const DashboardDosen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DashboardDosen> createState() => _DashboardDosenState();
}

class _DashboardDosenState extends State<DashboardDosen> {
  final _formkey = GlobalKey<FormState>();
