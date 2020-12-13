library hovering;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ignore: must_be_immutable
class HoverContainer extends StatefulWidget {
  /// Creates a `Container `widget that responds to the hover effect on web.
  ///
  /// The `height` and `width` values include the padding.
  ///
  /// The `color` and `decoration` arguments cannot both be supplied, since
  /// it would potentially result in the decoration drawing over the background
  /// color. To supply a decoration with a color, use `decoration:
  /// BoxDecoration(color: color)`.
  final AlignmentGeometry alignment;
  final AlignmentGeometry hoveraAlignment;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry hoverPadding;
  final Color color;
  final Color hoverColor;
  final Decoration decoration;
  final Decoration hoverDecoration;
  final Decoration foregroundDecoration;
  final Decoration hoverForegroundDecoration;
  final double width;
  double hoverWidth;
  final double height;
  double hoverHeight;
  final BoxConstraints constraints;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry hoverMargin;
  final Matrix4 transform;
  final Matrix4 hoverTransform;
  final Widget child;
  final Clip clipBehavior;
  final MouseCursor cursor;
  final ValueChanged<bool> onHover;
  final VoidCallback onTap;
  HoverContainer({
    Key key,
    this.alignment,
    this.hoveraAlignment,
    this.color,
    this.hoverColor,
    this.width,
    this.hoverWidth,
    this.height,
    this.hoverHeight,
    this.decoration,
    this.hoverDecoration,
    this.foregroundDecoration,
    this.hoverForegroundDecoration,
    this.child,
    this.clipBehavior = Clip.none,
    this.constraints,
    this.margin,
    this.hoverMargin,
    this.padding,
    this.hoverPadding,
    this.transform,
    this.cursor = SystemMouseCursors.basic,
    this.hoverTransform,
    this.onHover,
    this.onTap,
  })  : assert(margin == null || margin.isNonNegative),
        assert(hoverMargin == null || hoverMargin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(hoverPadding == null || hoverPadding.isNonNegative),
        assert(decoration == null || decoration.debugAssertIsValid()),
        assert(hoverDecoration == null || hoverDecoration.debugAssertIsValid()),
        assert(constraints == null || constraints.debugAssertIsValid()),
        assert(clipBehavior != null),
        assert(
            color == null || decoration == null && hoverDecoration == null,
            'Cannot provide both a color and a decoration\n'
            'To provide both, use "decoration: BoxDecoration(color: color)".'),
        assert(
            hoverColor == null || decoration == null && hoverDecoration == null,
            'Cannot provide both a hoverColor and a hoverDecoration\n'
            'To provide both, use "decoration: BoxDecoration(color: color) and hoverDecoration: BoxDecoration(color: color)".'),
        super(key: key);
  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  @override
  void initState() {
    // if (widget.hoverHeight == null) widget.hoverHeight = widget.height;
    // if (widget.hoverWidth == null) widget.hoverWidth = widget.width;
    super.initState();
  }

  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        print(event.timeStamp);
        setState(() {
          _isHover = true;
          widget.onHover(true);

          if (widget.onHover != null) {
            widget.onHover(true);
          }
        });
      },
      cursor: widget.cursor,
      onExit: (event) {
        setState(() {
          _isHover = false;

          if (widget.onHover != null) {
            widget.onHover(false);
          }
        });
      },
      child: GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap();
          }
        },
        child: Container(
          key: widget.key,
          width: _isHover ? widget.hoverWidth ?? widget.width : widget.width,
          height:
              _isHover ? widget.hoverHeight ?? widget.height : widget.height,
          alignment: _isHover
              ? widget.hoveraAlignment ?? widget.alignment
              : widget.alignment,
          padding:
              _isHover ? widget.hoverPadding ?? widget.padding : widget.padding,
          color: _isHover ? widget.hoverColor ?? widget.color : widget.color,
          decoration: _isHover
              ? widget.hoverDecoration ?? widget.decoration
              : widget.decoration,
          foregroundDecoration: _isHover
              ? widget.hoverForegroundDecoration ?? widget.foregroundDecoration
              : widget.foregroundDecoration,
          clipBehavior: widget.clipBehavior,
          constraints: widget.constraints,
          child: widget.child,
          margin:
              _isHover ? widget.hoverMargin ?? widget.margin : widget.margin,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class HoverAnimatedContainer extends StatefulWidget {
  /// Creates a `AnimatedContainer `widget that responds to the hover effect on web.
  ///
  /// The `height` and `width` values include the padding.
  ///
  /// The `color` and `decoration` arguments cannot both be supplied, since
  /// it would potentially result in the decoration drawing over the background
  /// color. To supply a decoration with a color, use `decoration:
  /// BoxDecoration(color: color)`.
  final AlignmentGeometry alignment;
  final AlignmentGeometry hoveraAlignment;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry hoverPadding;
  final Color color;
  final Color hoverColor;
  final Decoration decoration;
  final Decoration hoverDecoration;
  final Decoration foregroundDecoration;
  final Decoration hoverForegroundDecoration;
  final double width;
  double hoverWidth;
  final double height;
  double hoverHeight;
  final BoxConstraints constraints;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry hoverMargin;
  final Matrix4 transform;
  final Matrix4 hoverTransform;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final MouseCursor cursor;
  final ValueChanged<bool> onHover;
  final VoidCallback onTap;
  HoverAnimatedContainer({
    Key key,
    this.alignment,
    this.hoveraAlignment,
    this.color,
    this.duration = const Duration(milliseconds: 200),
    this.hoverColor,
    this.width,
    this.hoverWidth,
    this.height,
    this.hoverHeight,
    this.decoration,
    this.hoverDecoration,
    this.foregroundDecoration,
    this.hoverForegroundDecoration,
    this.child,
    this.constraints,
    this.margin,
    this.hoverMargin,
    this.padding,
    this.hoverPadding,
    this.transform,
    this.curve = Curves.linear,
    this.cursor = SystemMouseCursors.basic,
    this.hoverTransform,
    this.onHover,
    this.onTap,
  })  : assert(margin == null || margin.isNonNegative),
        assert(hoverMargin == null || hoverMargin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(hoverPadding == null || hoverPadding.isNonNegative),
        assert(decoration == null || decoration.debugAssertIsValid()),
        assert(hoverDecoration == null || hoverDecoration.debugAssertIsValid()),
        assert(constraints == null || constraints.debugAssertIsValid()),
        assert(
            color == null || decoration == null && hoverDecoration == null,
            'Cannot provide both a color and a decoration\n'
            'To provide both, use "decoration: BoxDecoration(color: color)".'),
        assert(
            hoverColor == null || decoration == null && hoverDecoration == null,
            'Cannot provide both a hoverColor and a hoverDecoration\n'
            'To provide both, use "decoration: BoxDecoration(color: color) and hoverDecoration: BoxDecoration(color: color)".'),
        super(key: key);
  @override
  _HoverAnimatedContainerState createState() => _HoverAnimatedContainerState();
}

class _HoverAnimatedContainerState extends State<HoverAnimatedContainer> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        print(event.timeStamp);
        setState(() {
          _isHover = true;
          if (widget.onHover != null) {
            widget.onHover(true);
          }
        });
      },
      cursor: widget.cursor,
      onExit: (event) {
        setState(() {
          _isHover = false;
          if (widget.onHover != null) {
            widget.onHover(false);
          }
        });
      },
      child: GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap();
          }
        },
        child: AnimatedContainer(
          key: widget.key,
          width: _isHover ? widget.hoverWidth ?? widget.width : widget.width,
          height:
              _isHover ? widget.hoverHeight ?? widget.height : widget.height,
          alignment: _isHover
              ? widget.hoveraAlignment ?? widget.alignment
              : widget.alignment,
          padding:
              _isHover ? widget.hoverPadding ?? widget.padding : widget.padding,
          color: _isHover ? widget.hoverColor ?? widget.color : widget.color,
          decoration: _isHover
              ? widget.hoverDecoration ?? widget.decoration
              : widget.decoration,
          foregroundDecoration: _isHover
              ? widget.hoverForegroundDecoration ?? widget.foregroundDecoration
              : widget.foregroundDecoration,
          constraints: widget.constraints,
          duration: widget.duration,
          curve: widget.curve,
          child: widget.child,
          margin:
              _isHover ? widget.hoverMargin ?? widget.margin : widget.margin,
        ),
      ),
    );
  }
}

class HoverCrossFadeWidget extends StatefulWidget {
  /// Creates a cross-fade animation hover widget.
  ///
  /// The [duration] of the animation is the same for all components (fade in,
  /// fade out, and size), and you can pass [Interval]s instead of [Curve]s in
  /// order to have finer control, e.g., creating an overlap between the fades.
  ///
  /// All the arguments other than [key] must be non-null.
  final MouseCursor cursor;
  final Widget firstChild;
  final Widget secondChild;
  final Duration duration;
  final Curve firstCurve;
  final Curve secondCurve;
  final Curve sizeCurve;
  final Duration reverseDuration;
  final AlignmentGeometry alignmentry;
  final ValueChanged<bool> onHover;
  final VoidCallback onTap;

  HoverCrossFadeWidget({
    Key key,
    this.cursor = SystemMouseCursors.basic,
    @required this.firstChild,
    @required this.secondChild,
    @required this.duration,
    this.alignmentry = Alignment.center,
    this.firstCurve = Curves.linear,
    this.reverseDuration,
    this.secondCurve = Curves.linear,
    this.sizeCurve = Curves.linear,
    this.onHover,
    this.onTap,
  })  : assert(firstChild != null && secondChild != null && duration != null,
            'These are required fields.'),
        super(key: key);

  @override
  _HoverCrossFadeWidgetState createState() => _HoverCrossFadeWidgetState();
}

class _HoverCrossFadeWidgetState extends State<HoverCrossFadeWidget> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) {
          //print(event.timeStamp);
          setState(() {
            _isHover = true;
            if (widget.onHover != null) {
              widget.onHover(true);
            }
          });
        },
        cursor: widget.cursor,
        onExit: (event) {
          setState(() {
            _isHover = false;
            if (widget.onHover != null) {
              widget.onHover(false);
            }
          });
        },
        child: GestureDetector(
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap();
            }
          },
          child: AnimatedCrossFade(
            firstChild: widget.firstChild,
            secondChild: widget.secondChild,
            crossFadeState:
                _isHover ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: widget.duration,
            reverseDuration: widget.reverseDuration,
            firstCurve: widget.firstCurve,
            secondCurve: widget.secondCurve,
            sizeCurve: widget.sizeCurve,
            alignment: widget.alignmentry,
          ),
        ));
  }
}

class HoverWidget extends StatefulWidget {
  final Widget child;
  final Widget hoverChild;
  final Function(PointerEnterEvent event) onHover;
  HoverWidget(
      {Key key,
      @required this.child,
      @required this.hoverChild,
      @required this.onHover})
      : assert(child != null && hoverChild != null && onHover != null),
        super(key: key);

  @override
  _HoverWidgetState createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget> {
  bool _isHover = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHover = true;
        });
        widget.onHover(event);
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
      },
      child: _isHover ? widget.hoverChild : widget.child,
    );
  }
}

class HoverButton extends StatefulWidget {
  /// Creates a material button with Hover Effect.
  final VoidCallback onpressed;
  final VoidCallback onLongPress;
  final ValueChanged<bool> onHighlightChanged;
  final MouseCursor mouseCursor;
  final ButtonTextTheme textTheme;
  final ButtonTextTheme hoverTextTheme;
  final Color textColor;
  final Color hoverTextColor;
  final Color disabledTextColor;
  final Color color;
  final Color disabledColor;
  final Color focusColor;
  final Color hoverColor;
  final Color highlightColor;
  final Color splashColor;
  final Brightness colorBrightness;
  final Brightness hoverColorBrightness;
  final double elevation;
  final double focusElevation;
  final double hoverElevation;
  final double highlightElevation;
  final double disabledElevation;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry hoverPadding;
  final VisualDensity visualDensity;
  final ShapeBorder shape;
  final ShapeBorder hoverShape;
  final Clip clipBehavior;
  final FocusNode focusNode;
  final bool autofocus;
  final MaterialTapTargetSize materialTapTargetSize;
  final Duration animationDuration;
  final double minWidth;
  final double height;
  final bool enableFeedback;
  final Widget child;
  HoverButton(
      {Key key,
      @required this.onpressed,
      this.animationDuration,
      this.autofocus = false,
      this.child,
      this.clipBehavior = Clip.none,
      this.color,
      this.colorBrightness,
      this.disabledColor,
      this.disabledElevation,
      this.disabledTextColor,
      this.elevation = 4.0,
      this.enableFeedback = true,
      this.focusColor,
      this.focusElevation,
      this.focusNode,
      this.height,
      this.highlightColor,
      this.highlightElevation,
      this.hoverColor,
      this.hoverElevation = 8.0,
      this.materialTapTargetSize,
      this.minWidth,
      this.mouseCursor = SystemMouseCursors.click,
      this.onHighlightChanged,
      this.onLongPress,
      this.padding,
      this.hoverPadding = const EdgeInsets.all(2.0),
      this.shape = const StadiumBorder(),
      this.splashColor,
      this.textColor,
      this.textTheme,
      this.visualDensity,
      this.hoverShape,
      this.hoverTextColor,
      this.hoverTextTheme,
      this.hoverColorBrightness})
      : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
      },
      child: MaterialButton(
        key: widget.key,
        onPressed: widget.onpressed,
        onHighlightChanged: widget.onHighlightChanged,
        onLongPress: widget.onLongPress,
        textTheme: _isHover
            ? widget.hoverTextTheme ?? widget.textTheme
            : widget.textTheme,
        color: widget.color,
        colorBrightness: _isHover
            ? widget.hoverColorBrightness ?? widget.colorBrightness
            : widget.colorBrightness,
        disabledColor: widget.disabledColor,
        disabledTextColor: widget.disabledTextColor,
        elevation: widget.elevation,
        disabledElevation: widget.disabledElevation,
        focusElevation: widget.focusElevation,
        highlightElevation: widget.highlightElevation,
        hoverElevation: widget.hoverElevation,
        enableFeedback: widget.enableFeedback,
        focusColor: widget.focusColor,
        highlightColor: widget.highlightColor,
        hoverColor: widget.hoverColor,
        splashColor: widget.splashColor,
        shape: _isHover ? widget.hoverShape ?? widget.shape : widget.shape,
        clipBehavior: widget.clipBehavior,
        mouseCursor: widget.mouseCursor,
        materialTapTargetSize: widget.materialTapTargetSize,
        minWidth: widget.minWidth,
        animationDuration: widget.animationDuration,
        autofocus: widget.autofocus,
        child: widget.child,
        textColor: _isHover
            ? widget.hoverTextColor ?? widget.textColor
            : widget.textColor,
        visualDensity: widget.visualDensity,
        focusNode: widget.focusNode,
        height: widget.height,
        padding:
            _isHover ? widget.hoverPadding ?? widget.padding : widget.padding,
      ),
    );
  }
}

class HoverText extends StatefulWidget {
  final String data;
  final String hoverData;
  final double height;
  final double hoverHeight;
  final double width;
  final double hoverWidth;
  final TextAlign textAlign;
  final TextStyle textStyle;
  final MouseCursor mouseCursor;
  final TextAlign hoverTextAlign;
  final TextStyle hoverTextStyle;
  final BoxDecoration decoration;
  final AlignmentGeometry alignment;
  final AlignmentGeometry hoverAlignment;
  final BoxDecoration hoverDecoration;
  final BoxDecoration foregroundDecoration;
  final BoxDecoration hoverForegroundDecoration;
  final BoxConstraints constraints;
  final BoxConstraints hoverConstraints;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry hoverMargin;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry hoverPadding;

  const HoverText({
    Key key,
    this.data,
    this.hoverData,
    this.textAlign,
    this.hoverTextAlign,
    this.textStyle,
    this.hoverTextStyle,
    this.mouseCursor = SystemMouseCursors.basic,
    this.alignment,
    this.hoverAlignment,
    this.decoration,
    this.hoverDecoration,
    this.height,
    this.width,
    this.hoverHeight,
    this.hoverWidth,
    this.foregroundDecoration,
    this.hoverForegroundDecoration,
    this.constraints,
    this.hoverConstraints,
    this.margin,
    this.hoverMargin,
    this.padding,
    this.hoverPadding,
  }) : super(key: key);
  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.mouseCursor,
      onEnter: (event) {
        setState(() {
          _isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
      },
      child: Container(
        padding: _isHover ? widget.hoverPadding : widget.padding,
        margin: _isHover ? widget.hoverMargin : widget.margin,
        constraints: _isHover ? widget.hoverConstraints : widget.constraints,
        foregroundDecoration: _isHover
            ? widget.hoverForegroundDecoration
            : widget.foregroundDecoration,
        height: _isHover ? widget.hoverHeight : widget.height,
        width: _isHover ? widget.hoverWidth : widget.width,
        alignment: _isHover ? widget.hoverAlignment : widget.alignment,
        decoration: _isHover ? widget.hoverDecoration : widget.decoration,
        child: Text(
          _isHover ? widget.hoverData : widget.data,
          key: widget.key,
          textAlign: _isHover ? widget.hoverTextAlign : widget.textAlign,
          style: _isHover ? widget.hoverTextStyle : widget.textStyle,
        ),
      ),
    );
  }
}

class HoverAnimatedText extends StatefulWidget {
  /// Creates a `AnimatedContainer `widget that responds to the hover effect on web.
  ///
  /// The `height` and `width` values include the padding.
  ///
  /// The `color` and `decoration` arguments cannot both be supplied, since
  /// it would potentially result in the decoration drawing over the background
  /// color. To supply a decoration with a color, use `decoration:
  /// BoxDecoration(color: color)`.
  final String data;
  final TextStyle textStyle;
  final TextStyle hoverTextStyle;
  final AlignmentGeometry alignment;
  final AlignmentGeometry hoveraAlignment;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry hoverPadding;
  final Color color;
  final Color hoverColor;
  final Decoration decoration;
  final Decoration hoverDecoration;
  final Decoration foregroundDecoration;
  final Decoration hoverForegroundDecoration;
  final double width;
  double hoverWidth;
  final double height;
  double hoverHeight;
  final BoxConstraints constraints;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry hoverMargin;
  final Matrix4 transform;
  final Matrix4 hoverTransform;
  final Widget child;
  final Duration animatedContainerDuration;
  final Duration animatedTextDuration;
  final Curve animatedContainerCurve;
  final Curve animatedTextCurve;
  final MouseCursor cursor;
  final ValueChanged<bool> onHover;
  final VoidCallback onTap;
  HoverAnimatedText({
    Key key,
    this.alignment,
    this.hoveraAlignment,
    this.color,
    this.animatedContainerDuration = const Duration(milliseconds: 200),
    this.animatedTextDuration = const Duration(milliseconds: 200),
    this.hoverColor,
    this.width,
    this.hoverWidth,
    this.height,
    this.hoverHeight,
    this.decoration,
    this.hoverDecoration,
    this.foregroundDecoration,
    this.hoverForegroundDecoration,
    this.child,
    this.constraints,
    this.margin,
    this.hoverMargin,
    this.padding,
    this.hoverPadding,
    this.transform,
    this.animatedContainerCurve = Curves.linear,
    this.cursor = SystemMouseCursors.basic,
    this.hoverTransform,
    this.onHover,
    this.onTap,
    this.data,
    this.textStyle,
    this.hoverTextStyle,
    this.animatedTextCurve = Curves.linear,
  })  : assert(margin == null || margin.isNonNegative),
        assert(hoverMargin == null || hoverMargin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(hoverPadding == null || hoverPadding.isNonNegative),
        assert(decoration == null || decoration.debugAssertIsValid()),
        assert(hoverDecoration == null || hoverDecoration.debugAssertIsValid()),
        assert(constraints == null || constraints.debugAssertIsValid()),
        assert(
            color == null || decoration == null && hoverDecoration == null,
            'Cannot provide both a color and a decoration\n'
            'To provide both, use "decoration: BoxDecoration(color: color)".'),
        assert(
            hoverColor == null || decoration == null && hoverDecoration == null,
            'Cannot provide both a hoverColor and a hoverDecoration\n'
            'To provide both, use "decoration: BoxDecoration(color: color) and hoverDecoration: BoxDecoration(color: color)".'),
        super(key: key);
  @override
  _HoverAnimatedTextState createState() => _HoverAnimatedTextState();
}

class _HoverAnimatedTextState extends State<HoverAnimatedText> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        print(event.timeStamp);
        setState(() {
          _isHover = true;
          if (widget.onHover != null) {
            widget.onHover(true);
          }
        });
      },
      cursor: widget.cursor,
      onExit: (event) {
        setState(() {
          _isHover = false;
          if (widget.onHover != null) {
            widget.onHover(false);
          }
        });
      },
      child: GestureDetector(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap();
          }
        },
        child: AnimatedContainer(
          key: widget.key,
          width: _isHover ? widget.hoverWidth ?? widget.width : widget.width,
          height:
              _isHover ? widget.hoverHeight ?? widget.height : widget.height,
          alignment: _isHover
              ? widget.hoveraAlignment ?? widget.alignment
              : widget.alignment,
          padding:
              _isHover ? widget.hoverPadding ?? widget.padding : widget.padding,
          color: _isHover ? widget.hoverColor ?? widget.color : widget.color,
          decoration: _isHover
              ? widget.hoverDecoration ?? widget.decoration
              : widget.decoration,
          foregroundDecoration: _isHover
              ? widget.hoverForegroundDecoration ?? widget.foregroundDecoration
              : widget.foregroundDecoration,
          constraints: widget.constraints,
          duration: widget.animatedContainerDuration,
          curve: widget.animatedContainerCurve,
          margin:
              _isHover ? widget.hoverMargin ?? widget.margin : widget.margin,
          child: AnimatedDefaultTextStyle(
            curve: widget.animatedTextCurve,
            duration: widget.animatedTextDuration,
            style: _isHover ? widget.hoverTextStyle : widget.textStyle,
            child: Text(
              widget.data,
            ),
          ),
        ),
      ),
    );
  }
}
