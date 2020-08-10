import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent { to_pink, to_purple }

class ColorBloc extends Bloc<ColorEvent, Color> {
  Color _color = Colors.pink;

  ColorBloc(Color initialState) : super(initialState);

  Color get initialState => Colors.pink;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.to_pink) ? Colors.pink : Colors.purple;
    yield _color;
  }
}
