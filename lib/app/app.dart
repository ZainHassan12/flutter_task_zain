import 'package:flutter_task_zain/ui/views/home/home_view.dart';
import 'package:flutter_task_zain/ui/views/bottom_sheet/bottom_sheet_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(
      classType: CartBottomSheet,
    ),
  ],
)
class App {}
