import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'generic_provider.dart';
import 'user_provider.dart';

class ProviderIndex {
  static List<SingleChildWidget> multiProviders() {
    return [
      ChangeNotifierProvider(create: (_) => GenericProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ];
  }
}
