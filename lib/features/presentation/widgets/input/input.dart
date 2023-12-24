import 'package:flutter/material.dart';

import '../../../../core/export/export.dart';


class LabelText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final Locale? locale;
  final double? height;
  final double? width;
  final double? letterSpacing;
  final FontStyle? fontStyle;
  final TextBaseline? textBaseline;
  const LabelText({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign,
    this.padding,
    this.margin,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.locale,
    this.height,
    this.width,
    this.letterSpacing,
    this.fontStyle,
    this.textBaseline,
  });
  @override
  Widget build(BuildContext context) {
    return text.toText(
      context,
      textAlign: textAlign ?? TextAlign.start,
      color: color ?? ColorManager.blackColor,
      fontSize: fontSize ?? FontSize.fontSize20,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontFamily: fontFamily,
      softWrap: softWrap,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}

class EmailInputView extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;

  final ValueChanged<String> onChanged;
  //border

  //optional
  const EmailInputView({
    super.key,
    this.padding,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: width ?? double.infinity,
      height: error != null ? null : AppSize.appSize60,
      child: TextFormField(
        onChanged: onChanged,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: TextInputType.emailAddress,
        cursorColor: cursorColor ?? ColorManager.primaryColor,
        cursorHeight: cursorHeight ?? AppSize.appSize20,
        cursorWidth: cursorWidth ?? AppSize.appSize2,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        style: textStyle ?? getTextStyle(),
        decoration: InputDecoration(
          errorMaxLines: 1,
          border: getInputBorder(),
          focusedBorder: focusedBorder ?? getInputBorder(),
          enabledBorder: enabledBorder ?? getInputBorder(),
          errorBorder: erorrBorder ?? getInputBorderError(),
          disabledBorder: disabledBorder ?? getInputBorderError(),
          errorStyle: errorStyle ?? getErrorStyle(),
          counterText: AppConstants.defaultEmptyString,
          contentPadding: contentPadding,
          prefixIcon: preffuixIcon,
          hintText: trans(context, hintText ?? AppStrings.email),
          hintStyle: hintStyle ?? getHintStyle(),
          errorText: error != null ? trans(context, error!) : null,
        ),
      ),
    );
  }
}

class GenericInputView extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final bool? isReadOnly;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final String? initialValue;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;
  final Widget? suffixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final Color? fillColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  //border

  //optional
  const GenericInputView({
    super.key,
    this.padding,
    this.contentPadding,
    this.margin,
    this.controller,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.suffixIcon,
    this.errorStyle,
    this.error,
    this.fillColor,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.minLines,
    this.maxLines,
    this.keyboardType,
    this.onTap,
    this.isReadOnly,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: width ?? double.infinity,
      height: error != null ? null : AppSize.appSize60,
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        readOnly: isReadOnly ?? false,
        onChanged: onChanged,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: keyboardType ?? TextInputType.text,
        cursorColor: cursorColor ?? ColorManager.primaryColor,
        cursorHeight: cursorHeight ?? AppSize.appSize20,
        cursorWidth: cursorWidth ?? AppSize.appSize2,
        style: textStyle ?? getTextStyle(),
        minLines: minLines,
        maxLines: maxLines,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        decoration: InputDecoration(
          border: getInputBorder(),
          focusedBorder: focusedBorder ?? getInputBorder(),
          enabledBorder: enabledBorder ?? getInputBorder(),
          errorBorder: erorrBorder ?? getInputBorderError(),
          disabledBorder: disabledBorder ?? getInputBorderError(),
          errorStyle: errorStyle ?? getErrorStyle(),
          counterText: AppConstants.defaultEmptyString,
          contentPadding: contentPadding,
          prefixIcon: preffuixIcon,
          suffixIcon: suffixIcon,
          fillColor: fillColor ??
              ColorManager.greyColor.withOpacity(AppSize.appSize0_10),
          hintText: trans(context, hintText ?? AppStrings.geranlHintText),
          hintStyle: hintStyle ?? getHintStyle(),
          errorText: error != null ? trans(context, error!) : null,
        ),
      ),
    );
  }
}

class PasswordInputView extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;

  final ValueChanged<String> onChanged;
  final Function()? hidePassword;
  final bool? visiable;
  final Widget? suffixIcon;
  //border

  //optional
  const PasswordInputView({
    super.key,
    this.padding,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.visiable,
    this.hidePassword,
    this.suffixIcon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: width ?? double.infinity,
      height: error != null ? null : AppSize.appSize60,
      child: TextFormField(
        onChanged: onChanged,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: TextInputType.text,
        cursorColor: cursorColor ?? ColorManager.primaryColor,
        cursorHeight: cursorHeight ?? AppSize.appSize20,
        cursorWidth: cursorWidth ?? AppSize.appSize2,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        obscureText: visiable ?? true,
        maxLength: length ?? AppValue.appValue60,
        style: textStyle ?? getTextStyle(),
        decoration: InputDecoration(
          border: getInputBorder(),
          focusedBorder: focusedBorder ?? getInputBorder(),
          enabledBorder: enabledBorder ?? getInputBorder(),
          errorBorder: erorrBorder ?? getInputBorderError(),
          disabledBorder: disabledBorder ?? getInputBorderError(),
          errorStyle: errorStyle ?? getErrorStyle(),
          counterText: AppConstants.defaultEmptyString,
          contentPadding: contentPadding,
          prefixIcon: preffuixIcon,
          suffixIcon: IconButton(
            icon: Icon(
              visiable ?? true ? Icons.visibility_off : Icons.visibility,
              color: ColorManager.primaryColor,
            ),
            onPressed: hidePassword,
          ),
          hintText: trans(context, hintText ?? AppStrings.geranlHintText),
          hintStyle: hintStyle ?? getHintStyle(),
          errorText: error != null
              ? trans(context, error ?? AppStrings.validInput)
              : null,
        ),
      ),
    );
  }
}

class CurrencyInputView extends StatelessWidget {
  final EdgeInsets? padding;
  final bool? isReadOnly;
  final EdgeInsets? contentPadding;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;
  final Widget? suffixIcon;
  final Color? fillColor;
  final ValueChanged<String> onChanged;

  //border

  //optional
  const CurrencyInputView({
    super.key,
    this.padding,
    this.fillColor,
    this.isReadOnly,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.suffixIcon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: width ?? double.infinity,
      height: error != null ? null : AppSize.appSize60,
      child: TextFormField(
        onChanged: onChanged,
        maxLength: length ?? 10,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true, signed: false),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
          // english
        ],
        readOnly: isReadOnly ?? false,
        cursorColor: cursorColor ?? ColorManager.primaryColor,
        cursorHeight: cursorHeight ?? AppSize.appSize20,
        cursorWidth: cursorWidth ?? AppSize.appSize2,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        style: textStyle ?? getTextStyle(),
        decoration: InputDecoration(
          fillColor: fillColor ?? Colors.white,
          border: getInputBorder(),
          focusedBorder: focusedBorder ?? getInputBorder(),
          enabledBorder: enabledBorder ?? getInputBorder(),
          errorBorder: erorrBorder ?? getInputBorderError(),
          disabledBorder: disabledBorder ?? getInputBorderError(),
          errorStyle: errorStyle ?? getErrorStyle(),
          counterText: AppConstants.defaultEmptyString,
          contentPadding: contentPadding,
          prefixIcon: preffuixIcon,
          suffixIcon: suffixIcon,
          hintText: trans(context, hintText ?? AppStrings.geranlHintText),
          hintStyle: hintStyle ?? getHintStyle(),
          errorText: error != null
              ? trans(context, error ?? AppStrings.validInput)
              : null,
        ),
      ),
    );
  }
}

class PhoneInputView extends StatelessWidget {
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;
  final Widget? suffixIcon;
  final ValueChanged<String> onChanged;

  //border

  //optional
  const PhoneInputView({
    super.key,
    this.controller,
    this.padding,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.suffixIcon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: width ?? double.infinity,
      height: error != null ? null : AppSize.appSize60,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        maxLength: length ?? 9,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true, signed: false),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
          // english
        ],
        cursorColor: cursorColor ?? ColorManager.primaryColor,
        cursorHeight: cursorHeight ?? AppSize.appSize20,
        cursorWidth: cursorWidth ?? AppSize.appSize2,
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        style: textStyle ?? getTextStyle(),
        decoration: InputDecoration(
          border: getInputBorder(),
          focusedBorder: focusedBorder ?? getInputBorder(),
          enabledBorder: enabledBorder ?? getInputBorder(),
          errorBorder: erorrBorder ?? getInputBorderError(),
          disabledBorder: disabledBorder ?? getInputBorderError(),
          errorStyle: errorStyle ?? getErrorStyle(),
          counterText: AppConstants.defaultEmptyString,
          contentPadding: contentPadding,
          prefixIcon: preffuixIcon,
          suffixIcon: suffixIcon ?? const SuffixIconPhoneView(),
          hintText: trans(context, hintText ?? AppStrings.geranlHintText),
          hintStyle: hintStyle ?? getHintStyle(),
          errorText: error != null
              ? trans(context, error ?? AppStrings.validInput)
              : null,
        ),
      ),
    );
  }
}

class SuffixIconPhoneView extends StatelessWidget {
  const SuffixIconPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.appSize60,
      height: AppSize.appSize45,
      decoration: const BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.appSize4),
          bottomLeft: Radius.circular(AppSize.appSize4),
        ),
      ),
      child: Center(
        child: '218+'.toText(
          context,
          color: ColorManager.whiteColor,
          fontSize: FontSize.fontSize16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class DropDownInputStringsView extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;
  final Widget? suffixIcon;
  final ValueChanged<String?> onChanged;
  final String? value;
  final List<String> items;

  //border

  //optional
  const DropDownInputStringsView({
    super.key,
    this.padding,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.suffixIcon,
    this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.zero,
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: AppSize.appSize8),
        width: width ?? double.infinity,
        height: error != null ? null : AppSize.appSize60,
        child: InputDecorator(
          decoration: InputDecoration(
            errorText: error,
            filled: true,
            border: border ?? getInputBorder(),
            enabledBorder: enabledBorder ?? getInputBorder(),
            focusedBorder: focusedBorder ?? getInputBorder(),
            errorBorder: erorrBorder ?? getInputBorderError(),
            contentPadding: contentPadding,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.appPadding0,
              ),
              icon: suffixIcon ??
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: ColorManager.blackColor,
                    size: AppSize.appSize24,
                  ),
              iconSize: AppSize.appSize24,
              elevation: 16,
              value: value,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: FontSize.fontSize14,
                    color: ColorManager.blackColor,
                  ),
              onChanged: onChanged,
              hint: Text(
                trans(context, hintText ?? AppStrings.geranlHintText),
                style: getHintStyle(),
              ),
              alignment: AlignmentDirectional.centerStart,
              isExpanded: true,
              selectedItemBuilder: (BuildContext context) {
                return items.map<Widget>((String item) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trans(context, item),
                        style: textStyle,
                      ),
                    ],
                  );
                }).toList();
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        trans(context, value),
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.rtl,
                        locale: const Locale(
                          'ar',
                        ),
                        style: textStyle,
                      ),
                      //svg image
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }
}

class GenericReadOnlyInputView extends StatefulWidget {
  final String value;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;

  const GenericReadOnlyInputView({
    super.key,
    required this.value,
    this.padding,
    this.contentPadding,
    this.margin,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.errorStyle,
    this.error,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
  });

  @override
  State<GenericReadOnlyInputView> createState() => _GenericReadOnlyInputViewState();
}

class _GenericReadOnlyInputViewState extends State<GenericReadOnlyInputView> {
  bool isCoppied = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      padding: widget.padding ??
          const EdgeInsets.symmetric(vertical: AppSize.appSize8),
      width: widget.width ?? double.infinity,
      height: widget.height ?? AppSize.appSize60,
      child: TextFormField(
        readOnly: true,
        initialValue: widget.value.isEmpty ? null : widget.value,
        textAlign: widget.textAlign ?? TextAlign.start,
        keyboardType: TextInputType.text,
        cursorColor: widget.cursorColor ?? ColorManager.primaryColor,
        cursorHeight: widget.cursorHeight ?? AppSize.appSize20,
        cursorWidth: widget.cursorWidth ?? AppSize.appSize2,
        style: widget.textStyle ?? getTextStyle(),
        onTapOutside: (event) => context.unFocusOnTapOutSite(event),
        decoration: InputDecoration(
          border: getInputBorder(),
          focusedBorder: widget.focusedBorder ?? getInputBorder(),
          enabledBorder: widget.enabledBorder ?? getInputBorder(),
          errorBorder: widget.erorrBorder ?? getInputBorderError(),
          disabledBorder: widget.disabledBorder ?? getInputBorderError(),
          errorStyle: widget.errorStyle ?? getErrorStyle(),
          counterText: AppConstants.defaultEmptyString,
          contentPadding: widget.contentPadding,
          prefixIcon: widget.preffuixIcon,
          suffixIcon: IconButton(
            icon: Icon(
              isCoppied ? Icons.check : Icons.copy,
              color: isCoppied
                  ? ColorManager.primaryColor
                  : ColorManager.greyColor.withOpacity(0.70),
            ),
            onPressed: () async {
              if (widget.value.isEmpty) return;
              await Clipboard.setData(ClipboardData(text: widget.value))
                  .then((_) {
                setState(() {
                  isCoppied = true;
                });
                instance<IShowAlertMessage>().showSnakeBarSuccess(
                  context,
                  AppStrings.successCopy,
                );

                delayForCreateNewStatus(second: 3).then((_) {
                  setState(() {
                    isCoppied = false;
                  });
                });
              });
            },
          ),
          hintText:
              trans(context, widget.hintText ?? AppStrings.geranlHintText),
          hintStyle: widget.hintStyle ?? getHintStyle(),
        ),
      ),
    );
  }
}

class SearchInputView extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final bool? isReadOnly;

  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final String? hintText;
  final String? initialValue;
  final IconData? icon;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  final TextStyle? errorStyle;
  final Widget? preffuixIcon;
  final Widget? suffixIcon;

  final String? error;
  final int? length;
  final Color? cursorColor;
  final Color? fillColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? erorrBorder;
  final InputBorder? disabledBorder;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  //border

  //optional
  const SearchInputView({
    super.key,
    this.padding,
    this.contentPadding,
    this.margin,
    this.controller,
    this.width,
    this.height,
    this.hintText,
    this.icon,
    this.textAlign,
    this.textStyle,
    this.hintStyle,
    this.suffixIcon,
    this.errorStyle,
    this.error,
    this.fillColor,
    this.length,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.preffuixIcon,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.erorrBorder,
    this.disabledBorder,
    this.minLines,
    this.maxLines,
    this.keyboardType,
    this.onTap,
    this.isReadOnly,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: isReadOnly ?? false,
      onChanged: onChanged,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: cursorColor ?? ColorManager.primaryColor,
      cursorHeight: cursorHeight ?? AppSize.appSize20,
      cursorWidth: cursorWidth ?? AppSize.appSize2,
      style: textStyle ?? getTextStyle(),
      minLines: minLines,
      maxLines: maxLines,
      onTapOutside: (event) => context.unFocusOnTapOutSite(event),
      decoration: InputDecoration(
        contentPadding: contentPadding,
        prefixIcon: preffuixIcon,
        suffixIcon: suffixIcon,
        fillColor: fillColor ??
            ColorManager.greyColor.withOpacity(AppSize.appSize0_10),
        hintText: trans(context, hintText ?? AppStrings.geranlHintText),
        hintStyle: hintStyle ?? getHintStyle(),
      ),
    );
  }
}

class Lable extends StatelessWidget {
  final String lable;
  const Lable({super.key, required this.lable});

  @override
  Widget build(BuildContext context) {
    return lable.toText(
      context,
      color: ColorManager.blackColor,
      fontWeight: FontWeight.w700,
      fontSize: FontSize.fontSize24,
    );
  }
}