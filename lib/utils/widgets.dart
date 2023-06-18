import 'package:flutter/material.dart';
import 'constants.dart';

class AuthTextField extends StatelessWidget {
  final int? maxLines;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? labelText;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  const AuthTextField(
      {Key? key,
      this.labelText,
      this.keyboardType,
      this.textInputAction,
      this.obscureText,
      this.suffixIcon,
      this.hintText,
      this.hintStyle,
      this.controller,
      this.style,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText ?? '',
          style: colorB7Regular16,
        ),
        TextField(
          controller: controller,
          cursorColor: primaryColor,
          style: style ?? whiteRegular18,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          maxLines: maxLines,
          textInputAction: textInputAction ?? TextInputAction.next,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: hintStyle ?? whiteRegular18,
            suffixIcon: suffixIcon ?? const SizedBox(),
            enabledBorder:
                const UnderlineInputBorder(borderSide: BorderSide(color: colorB7)),
            focusedBorder:
                const UnderlineInputBorder(borderSide: BorderSide(color: colorB7)),
          ),
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final String? navigate;
  final EdgeInsets? margin;

  const PrimaryButton(
      {Key? key, this.text, this.margin, this.navigate, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate != null
          ? () {
              Navigator.pushNamed(context, '/$navigate');
            }
          : onTap,
      child: Container(
        margin: margin,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(text ?? '', style: whiteBold22),
        ),
      ),
    );
  }
}

class PushNavigate extends StatelessWidget {
  final String navigate;

  final Widget child;
  const PushNavigate({Key? key, required this.navigate, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/$navigate'),
      child: child,
    );
  }
}

class MyAppBar extends StatelessWidget {
  final Widget? leading;
  final String? title;
  final List<Widget>? actions;
  const MyAppBar({Key? key, this.title, this.actions, this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: -7,
      elevation: 3,
      shadowColor: colorForShadow.withOpacity(.30),
      backgroundColor: appBarColor,
      leading: leading ??
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10).copyWith(bottom: 8.5),
                  child: Image.asset(arrowBack))),
      title: Text(
        title ?? '',
        style: blackSemiBold20,
      ),
      actions: actions,
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
