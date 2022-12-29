import 'package:flutter/material.dart';

import '../../widgets/text_column.dart';

class CommunityTextColumn extends StatelessWidget {
  const CommunityTextColumn();

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Community',
      text: 'For any query, our community is ready to help you solve it.',
    );
  }
}
