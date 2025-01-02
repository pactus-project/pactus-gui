// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gui/presentation/widgets/gender/gender_usecase.dart' as _i2;
import 'package:gui/presentation/widgets/toolbar_logo/toolbar_logo_usecase.dart'
    as _i3;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'presentation',
    children: [
      _i1.WidgetbookFolder(
        name: 'widgets',
        children: [
          _i1.WidgetbookFolder(
            name: 'gender',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'GenderSelectionWidget',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Gender Selection with Knob',
                  builder: _i2.genderSelectionWidgetUseCase,
                ),
              )
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'toolbar_logo',
            children: [
              _i1.WidgetbookLeafComponent(
                name: 'ToolbarLogo',
                useCase: _i1.WidgetbookUseCase(
                  name: 'Toolbar Logo',
                  builder: _i3.toolbarLogoUseCase,
                ),
              )
            ],
          ),
        ],
      )
    ],
  )
];
