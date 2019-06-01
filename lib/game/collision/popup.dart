import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/resizable.dart';
import 'package:flame/components/composed_component.dart';
import 'package:flame/components/text_component.dart';

class QuestionPanel extends PositionComponent
    with Resizable, ComposedComponent {
  bool visible = false;

  QuestionPopUp questionPopUp;

  QuestionPanel() : super() {
    questionPopUp = QuestionPopUp();
    components..add(questionPopUp);
  }

  @override
  void render(Canvas canvas) {
    if (visible) {
      super.render(canvas);
    }
  }
}

class QuestionPopUp extends TextComponent {
  QuestionPopUp() : super("test");
}
