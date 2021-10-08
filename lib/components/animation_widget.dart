import 'package:flutter/material.dart';

class ExpandedSection extends StatefulWidget {

  final Widget child;
  final bool expand;
  ExpandedSection({Key? key, this.expand = false, required this.child}): super(key: key);

  @override
  ExpandedSectionState createState() => ExpandedSectionState();
}

class ExpandedSectionState extends State<ExpandedSection> with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  late bool _expand;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _expand = widget.expand;
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void runExpand(expand) {
    _expand = expand;

    if(_expand) {
      expandController.forward();
    }
    else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: animation,
        child: widget.child
    );
  }
}