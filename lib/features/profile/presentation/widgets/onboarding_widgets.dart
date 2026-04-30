import 'package:orta/features/features.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnboardingAppBar({
    super.key,
    required this.title,
    this.canGoBack = true,
  });

  final String title;
  final bool canGoBack;

  @override
  Size get preferredSize => Size.fromHeight(70.0.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: canGoBack
          ? IconButton(
              onPressed: AppRouter.back,
              icon: Icon(Icons.arrow_back_ios_new, size: 20.0.radius),
            )
          : null,
      title: Text(
        title,
        style: context.text.titleLarge?.copyWith(
          color: AppColors.textColor,
          fontSize: 16.0.fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0.height),
        child: Divider(height: 1.0.height, color: AppColors.cardBorder),
      ),
    );
  }
}

class OnboardingIllustration extends StatelessWidget {
  const OnboardingIllustration({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.0.height,
      width: double.infinity,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 250.0.width,
            height: 170.0.height,
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withValues(alpha: .45),
              borderRadius: BorderRadius.circular(8.0.radius),
            ),
          ),
          Icon(icon, color: AppColors.primary, size: 100.0.radius),
        ],
      ),
    );
  }
}

class StepDots extends StatelessWidget {
  const StepDots({super.key, required this.activeIndex, required this.count});

  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(count, (int index) {
        return Container(
          width: 8.0.width,
          height: 8.0.width,
          margin: EdgeInsets.symmetric(horizontal: 4.0.width),
          decoration: BoxDecoration(
            color: index == activeIndex
                ? AppColors.primary
                : AppColors.cardBorder,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

class OnboardingSelectField extends StatelessWidget {
  const OnboardingSelectField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: context.text.titleMedium?.copyWith(
            color: AppColors.textColor,
            fontSize: 15.0.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        AppSpacings.vertical(10),
        DropdownButtonFormField<String>(
          value: value.isEmpty ? null : value,
          menuMaxHeight: 300,
          borderRadius: BorderRadius.circular(14.0.radius),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.textColor,
            size: 26.0.radius,
          ),
          style: context.text.bodyLarge?.copyWith(
            color: AppColors.textColor,
            fontSize: 14.0.fontSize,
            fontWeight: FontWeight.w500,
          ),
          dropdownColor: AppColors.white,
          validator: (String? selectedValue) =>
              Validator.emptyField(selectedValue, message: 'Select $label'),
          items: items
              .map(
                (String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, overflow: TextOverflow.ellipsis),
                ),
              )
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Select from List',
            hintStyle: context.text.bodyLarge?.copyWith(
              color: AppColors.greyDark,
              fontSize: 14.0.fontSize,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 18.0.width,
              vertical: 13.0.height,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0.radius),
              borderSide: BorderSide(color: AppColors.fieldBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0.radius),
              borderSide: BorderSide(color: AppColors.fieldBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0.radius),
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
