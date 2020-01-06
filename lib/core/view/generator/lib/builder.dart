import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:kari/core/view/generator/lib/src/view_reporter_generator.dart';

Builder viewReporter(BuilderOptions options) =>
    SharedPartBuilder([ViewReporterGenerator()], 'view_reporter');