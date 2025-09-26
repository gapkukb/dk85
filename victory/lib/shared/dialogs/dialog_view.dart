part of 'dialog.dart';

class _VicQuickDialogView extends StatelessWidget {
  final String? title;
  final String? content;
  final Widget? child;
  final String? cancelText;
  final String? confirmText;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  final bool? showCancel;
  final bool? showConfirm;
  final bool? autoClose;

  const _VicQuickDialogView({
    this.title,
    this.content,
    this.cancelText,
    this.confirmText,
    this.onCancel,
    this.onConfirm,
    this.child,
    this.showCancel,
    this.showConfirm,
    this.autoClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // insetPadding: AppSize.pad_a_12,
      shape: const RoundedRectangleBorder(borderRadius: AppSizes.radius_a_12),
      child: Stack(
        children: [
          const Positioned(
            right: 0,
            top: 0,
            child: Opacity(
              opacity: 0.04,
              child: Icon(
                IconFont.casino,
                size: 102,
                color: AppColors.danger,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Text(
                  title ?? 'dialog.title'.tr,
                  style: AppTextStyles.f14_title_bold,
                ),
                if (child != null) child!,
                if (content != null)
                  Padding(
                    padding: AppSizes.pad_b_16,
                    child: Text(
                      content!,
                      style: AppTextStyles.f14_label,
                    ),
                  ),
                // actions
                Row(
                  spacing: 8,
                  children: [
                    if (showCancel ?? true)
                      Expanded(
                        child: VicButton(
                          outlined: true,
                          backgroundColor: Colors.transparent,
                          color: AppColors.primary,
                          text: 'app.cancel'.tr,
                          onPressed: () {
                            Get.back();
                            onCancel?.call();
                          },
                        ),
                      ),
                    if (showConfirm ?? true)
                      Expanded(
                        child: VicButton(
                          text: 'app.confirm'.tr,
                          onPressed: () {
                            if (autoClose ?? true) {
                              Get.back(result: true);
                            }
                            onConfirm?.call();
                          },
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
