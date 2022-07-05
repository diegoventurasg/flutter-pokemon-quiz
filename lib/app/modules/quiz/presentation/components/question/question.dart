import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/consts/api_const.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/widgets/loader/loader.dart';
import '../../../domain/entities/question_entity.dart';
import '../../controllers/quiz_controller.dart';
import '../../stores/question_store.dart';
import '../alternative/alternative.dart';

class Question extends StatelessWidget {
  Question({Key? key}) : super(key: key);

  final QuizController controller = Modular.get<QuizController>();
  final Dio dio = Modular.get<Dio>();

  Future<Response> _getImage(String url) async {
    final result = await dio.get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScopedBuilder<QuestionStore, Exception, QuestionEntity>(
              store: controller.questionStore,
              onLoading: (_) => const Center(child: Loader()),
              onError: (_, exception) => const Center(child: Text('error')),
              onState: (_, question) {
                return FutureBuilder(
                    future: _getImage(ApiConst.imgUrl(question.question.num)),
                    builder: (_, AsyncSnapshot<Response> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (!snapshot.hasData) {
                          return Text(
                            'Algo deu errado :(',
                            style: AppTheme.textStyles.title,
                          );
                        }
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Quem é esse Pokémon?',
                              style: AppTheme.textStyles.title,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Image.memory(
                              Uint8List.fromList(snapshot.data!.data),
                              height: 150,
                              width: 150,
                            ),
                            const SizedBox(height: 20),
                            ...question.alternatives.mapIndexed(
                              (index, alternative) => Alternative(
                                alternative: alternative,
                                index: index,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Center(child: Loader());
                      }
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
