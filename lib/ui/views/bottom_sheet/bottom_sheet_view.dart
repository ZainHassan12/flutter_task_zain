import 'package:flutter/material.dart';
import 'package:flutter_task_zain/ui/views/bottom_sheet/bottom_sheet_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../common/app_colors.dart';
import '../../common/app_dimensions.dart';
import '../../common/app_styles.dart';
import '../../common/app_strings.dart';

class CartBottomSheet extends StackedView<CartBottomSheetViewModel> {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const CartBottomSheet({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  void onViewModelReady(CartBottomSheetViewModel viewModel) {
    if (request.data != null) {
      final data = request.data as Map<String, dynamic>;
      viewModel.initialize(
        data['cartItems'] as List<dynamic>,
        data['onRemove'] as Function(dynamic),
      );
    }
  }

  @override
  Widget builder(
    BuildContext context,
    CartBottomSheetViewModel viewModel,
    Widget? child,
  ) {
    AppDimensions.init(context);

    final double itemHeight = AppDimensions.h(68);
    final double maxHeight = itemHeight * 2;

    return Container(
      padding: EdgeInsets.only(
        left: AppDimensions.pHuge,
        right: AppDimensions.pHuge,
        top: AppDimensions.pHuge,
        bottom: AppDimensions.pHuge,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimensions.rXL),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimensions.h(8)),

          if (viewModel.items.isEmpty)
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppDimensions.pXXL),
                child: Text(
                  "Your cart is empty",
                  style: AppTextStyles.priceRegular,
                ),
              ),
            )
          else
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: maxHeight),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: viewModel.items.length,
                separatorBuilder: (_, __) => Divider(
                  color: borderGrey,
                  height: AppDimensions.h(1),
                ),
                itemBuilder: (context, index) {
                  final item = viewModel.items[index];
                  return _cartItem(viewModel, item);
                },
              ),
            ),

          SizedBox(height: AppDimensions.h(20)),

          // Checkout Button
          GestureDetector(
            onTap: viewModel.items.isEmpty
                ? null
                : () {
                    completer(
                      SheetResponse(
                        confirmed: true,
                        data: viewModel.totalPrice,
                      ),
                    );
                  },
            child: Container(
              width: double.infinity,
              height: AppDimensions.checkoutButtonHeight,
              decoration: BoxDecoration(
                color: viewModel.items.isEmpty
                    ? Colors.grey.shade300
                    : greenAccent,
                borderRadius: BorderRadius.circular(
                  AppDimensions.checkoutButtonRadius,
                ),
              ),
              alignment: Alignment.center,
              child: viewModel.items.isEmpty
                  ? Text(
                      "Your cart is empty",
                      style: AppTextStyles.checkoutBold.copyWith(
                        color: Colors.grey,
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(currencySymbol,
                            style: AppTextStyles.checkoutRegular),
                        Text(
                          " ${viewModel.totalPrice.toStringAsFixed(2)} - CHECKOUT",
                          style: AppTextStyles.checkoutBold,
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cartItem(CartBottomSheetViewModel viewModel, dynamic item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimensions.h(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "$currencySymbol ",
                      style: AppTextStyles.bottomSheetAmount,
                    ),
                    Text(
                      item.price.toStringAsFixed(2),
                      style: AppTextStyles.bottomSheetAmountBold,
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.h(4)),
                Text(
                  viewModel.getItemDescription(item),
                  style: AppTextStyles.bottomSheetDetails,
                ),
              ],
            ),
          ),
          SizedBox(width: AppDimensions.pM),
          _quantityPill(viewModel, item),
          SizedBox(width: AppDimensions.pM),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => viewModel.removeItem(item),
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.pS),
              child: Icon(
                Icons.close,
                color: Colors.red,
                size: AppDimensions.sp(24),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quantityPill(CartBottomSheetViewModel viewModel, dynamic item) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: textSecondary),
        borderRadius: BorderRadius.circular(AppDimensions.w(24)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => viewModel.decreaseQuantity(item),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.pM,
                vertical: AppDimensions.pS,
              ),
              child: Text("-", style: AppTextStyles.bottomSheetCounter),
            ),
          ),
          SizedBox(width: AppDimensions.w(16)),
          Text(
            "x${item.quantity ?? 1}",
            style: AppTextStyles.bottomSheetCounter,
          ),
          SizedBox(width: AppDimensions.w(16)),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => viewModel.increaseQuantity(item),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.pM,
                vertical: AppDimensions.pS,
              ),
              child: Text("+", style: AppTextStyles.bottomSheetCounter),
            ),
          ),
        ],
      ),
    );
  }

  @override
  CartBottomSheetViewModel viewModelBuilder(BuildContext context) =>
      CartBottomSheetViewModel();
}
