// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskController on _TaskController, Store {
  late final _$listAtom = Atom(name: '_TaskController.list', context: context);

  @override
  ObservableList<TaskEntity> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<TaskEntity> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('_TaskController.fetch', context: context);

  @override
  Future fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
