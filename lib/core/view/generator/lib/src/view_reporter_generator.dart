import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

import 'package:kari/core/view/view_reporter.dart';

class ViewReporterGenerator extends GeneratorForAnnotation<Screen> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep)  async {
        print("stp = ${buildStep.hashCode}");
        print("source name = ${element.source.fullName}");
        print("runtime type = ${element.source.shortName}"" >");
        print("runtime uri = ${element.source.uri}"" >");
        print("runtime shortname = ${element.source.shortName}"" >");
        print("runtime obj = ${buildStep.inputId.runtimeType}"" >");
        print("runtime path = ${buildStep.inputId.path}"" >");
        print("runtime extension = ${buildStep.inputId.extension}"" >");
        print("runtime inputId String = ${buildStep.inputId.toString()}"" >");
        print("runtime resolver type = ${buildStep.resolver.runtimeType}"" >");
        print("runtime resolver aife = ${(await buildStep.resolver.assetIdForElement(element)).toString()}"" >");
         print(element.metadata.map((f){
           return "/* source ${f.toSource()} string = ${f.toString()} \n"
           "*/\n\n\n";
        }).join(", "));
    return element.metadata.map((f){
           return "/* source ${f.toSource()} string = ${f.toString()} \n"
           "*/";
        }).join(", ");
   // return "// Hey! Annotation found!";
  }
}