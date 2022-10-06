import 'package:discord_app/api/apiGet.dart';
import 'package:flutter/material.dart';

import 'apiPost.dart';
class apiPost extends StatelessWidget {
  const apiPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return apiPostCall();
  }
}
