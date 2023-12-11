import 'package:flutter/material.dart';

bool isTablet(context) => MediaQuery.of(context).size.width >= 600;

bool isMobile(context) => MediaQuery.of(context).size.width < 600;
