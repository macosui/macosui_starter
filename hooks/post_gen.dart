import 'package:mason/mason.dart';
import 'dart:io';

void run(HookContext context) async {
  final pubGet = context.logger.progress('Running flutter pub get');
  final pubGetResult = await Process.run(
    'flutter',
    [
      'pub',
      'get',
    ],
    runInShell: true,
    workingDirectory: '${Directory.current.path}/${context.vars['app_name']}',
  );
  pubGet;
  if (pubGetResult.exitCode != 0) {
    context.logger.err('flutter pub get failed');
    exit(pubGetResult.exitCode);
  }

  await Future.delayed(const Duration(seconds: 1));

  final dartFormat = context.logger.progress('Running dart format');
  final dartFormatResult = await Process.run(
    'dart',
    [
      'format',
      '.',
    ],
    runInShell: true,
    workingDirectory: '${Directory.current.path}/${context.vars['app_name']}',
  );
  dartFormat;
  if (dartFormatResult.exitCode != 0) {
    context.logger
      ..err('dart format failed')
      ..err(dartFormatResult.stderr);
    exit(dartFormatResult.exitCode);
  }

  await Future.delayed(const Duration(seconds: 1));

  if (context.vars['initialize_git_repo'] == true) {
    final gitInit = context.logger.progress('Running git init');
    final gitInitResult = await Process.run(
      'git',
      [
        'init',
      ],
      runInShell: true,
      workingDirectory: '${Directory.current.path}/${context.vars['app_name']}',
    );
    gitInit;
    if (gitInitResult.exitCode != 0) {
      context.logger
        ..err('git init failed')
        ..err(gitInitResult.stderr);
      exit(gitInitResult.exitCode);
    }
  }

  await Future.delayed(const Duration(seconds: 1));

  context.logger
      .success('\nSuccessfully generated ${context.vars['app_name']}!');

  exit(dartFormatResult.exitCode);
}
