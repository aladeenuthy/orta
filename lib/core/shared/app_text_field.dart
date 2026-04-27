// ignore_for_file: deprecated_member_use

import "package:flutter/services.dart";

import "../../features/features.dart";

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.label,
    this.inputformatters,
    this.inputType = TextInputType.text,
    this.validate,
    this.isLastField = false,
    this.enabled = true,
    this.expand = false,
    this.onTap,
    this.textfieldLabel,
    this.onSaved,
    this.maxLines = 1,
    this.focusNode,
    this.textInputAction,
    this.onEditingComplete,
    this.filledColor = false,
    this.onChanged,
    this.readonly = false,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.maxLengthDrtChx,
    this.intiaVal,
    this.error,
    this.suffixIcon,
    this.isForSearch = false,
    this.hasTextfieldLabel,
    this.maxLength,
    this.textfieldHeight,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.bottomSpacing,
    this.autoFocus = false,
    this.fillColor,
    this.textfieldSize,
    this.textStyle,
    this.hintStyle,
    this.contentPadding,
    this.borderRadius,
    this.borderColor,
    this.focusedBorderColor,
    this.enabledBorderWidth,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? label, textfieldLabel;
  final TextInputType inputType;
  final bool isLastField;
  final bool? hasTextfieldLabel;
  final bool enabled, isForSearch, readonly;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onFieldSubmitted;
  final bool expand;
  final bool obscureText;
  final bool filledColor;
  final Function(String?)? onSaved;
  final String? Function(String?)? validate;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final double? textfieldHeight;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? intiaVal;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputformatters;
  final Widget? suffixIcon;
  final MaxLengthEnforcement? maxLengthDrtChx;
  final VoidCallback? onEditingComplete;
  final String? error;
  final int? maxLength;
  final AutovalidateMode? autovalidateMode;
  final double? bottomSpacing;
  final bool autoFocus;
  final Color? fillColor;
  final double? textfieldSize;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? enabledBorderWidth;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField>
    with AutomaticKeepAliveClientMixin<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.obscureText != widget.obscureText) {
      _obscureText = widget.obscureText;
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.isForSearch || widget.hasTextfieldLabel == false)
          const SizedBox.shrink()
        else
          widget.textfieldLabel != null
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: widget.bottomSpacing ?? 13,
                    top: 15,
                  ),
                  child: Text(
                    widget.textfieldLabel ?? "",
                    style: context.text.bodySmall?.copyWith(
                      color: AppColors.textColor.withOpacity(0.5),
                      fontSize: widget.textfieldSize?.fontSize ?? 14.0.fontSize,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        TextFormField(
          maxLength: widget.maxLength,
          cursorColor: AppColors.grey,
          cursorWidth: widget.isForSearch ? 1.2.width : 1.2.width,
          autovalidateMode: widget.autovalidateMode,
          enabled: widget.enabled,
          toolbarOptions: const ToolbarOptions(
            copy: true,
            cut: true,
            paste: true,
            selectAll: true,
          ),
          autofocus: widget.autoFocus,
          textDirection: TextDirection.ltr,
          enableInteractiveSelection: true,
          textAlign: TextAlign.left,
          initialValue: widget.intiaVal,
          focusNode: widget.focusNode,
          textCapitalization: TextCapitalization.sentences,
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          controller: widget.controller,
          validator: widget.validate,
          maxLengthEnforcement: widget.maxLengthDrtChx,
          onSaved: widget.onSaved,
          inputFormatters: widget.inputformatters,
          onFieldSubmitted: widget.onFieldSubmitted,
          onEditingComplete: widget.onEditingComplete,
          maxLines: widget.maxLines,
          textInputAction:
              widget.textInputAction ??
              (widget.isLastField
                  ? TextInputAction.done
                  : TextInputAction.next),
          keyboardType: widget.inputType,
          style:
              widget.textStyle ??
              context.text.bodyLarge?.copyWith(
                color: AppColors.textColor,
                fontSize: 14.0.fontSize,
              ),
          decoration: InputDecoration(
            errorText: widget.error,
            labelStyle: context.text.bodySmall,
            isDense: true,
            errorMaxLines: 2,
            errorStyle: context.text.bodySmall?.copyWith(
              color: Colors.red,
              fontSize: 11.0.fontSize,
            ),
            labelText: widget.label,
            filled: true,
            alignLabelWithHint: true,
            contentPadding:
                widget.contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: 16.0.width,
                  vertical: 8.0.height,
                ),
            hintText: widget.hintText,
            // fillColor: widget.isForSearch
            //     ? ColorManager.grey.withOpacity(0.03)
            //     : widget.enabled == false
            //         ? ColorManager.grey.withOpacity(0.01)
            //         : ColorManager.white,
            fillColor: widget.fillColor ?? AppColors.white,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon ?? _passwordVisibilityToggle(),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius:
                  widget.borderRadius ?? BorderRadius.circular(6.0.radius),
              borderSide: BorderSide(
                color: widget.isForSearch
                    ? AppColors.grey
                    : widget.borderColor ?? AppColors.primary,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius:
                  widget.borderRadius ?? BorderRadius.circular(6.0.radius),
              borderSide: BorderSide(
                color: widget.isForSearch
                    ? AppColors.grey
                    : widget.borderColor ?? AppColors.primary.withOpacity(0.25),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width:
                    widget.enabledBorderWidth ??
                    (widget.enabled == false ? 1 : 0),
                color:
                    widget.borderColor ?? AppColors.textColor.withOpacity(0.5),
              ),
              borderRadius:
                  widget.borderRadius ?? BorderRadius.circular(6.0.radius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    widget.focusedBorderColor ??
                    AppColors.primary.withOpacity(0.5),
              ),
              borderRadius:
                  widget.borderRadius ?? BorderRadius.circular(6.0.radius),
            ),
            hintStyle:
                widget.hintStyle ??
                context.text.bodyLarge?.copyWith(
                  color: AppColors.greyDark,
                  fontSize: 14.0.fontSize,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }

  Widget? _passwordVisibilityToggle() {
    if (!widget.obscureText) {
      return null;
    }

    return IconButton(
      onPressed: () {
        setState(() => _obscureText = !_obscureText);
      },
      icon: Icon(
        _obscureText
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        color: AppColors.textColor,
        size: 21.0.fontSize,
      ),
    );
  }
}
