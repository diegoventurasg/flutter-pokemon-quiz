import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../button/button.dart';
import 'save_score_controller.dart';

class SaveScoreDialog extends StatefulWidget {
  const SaveScoreDialog({
    Key? key,
    required this.points,
  }) : super(key: key);

  final int points;

  @override
  State<SaveScoreDialog> createState() => _SaveScoreDialogState();
}

class _SaveScoreDialogState extends State<SaveScoreDialog> {
  final SaveScoreController controller = Modular.get<SaveScoreController>();

  @override
  void initState() {
    super.initState();
    controller.store.observer(
      onState: (state) {
        Modular.to.navigate('/quiz/');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: AppTheme.colors.background,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Modular.to.navigate('/quiz/'),
                          child: FaIcon(
                            FontAwesomeIcons.xmark,
                            color: AppTheme.colors.text,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Informe um nome para salvar a sua pontuação',
                      style: AppTheme.textStyles.text,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.nameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (name) {
                        if (name == null || name.trim().isEmpty) {
                          return 'Informe um nome';
                        }
                        return null;
                      },
                      style: AppTheme.textStyles.text,
                      decoration: InputDecoration(
                        hintText: 'Nome',
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Button(
                      title: 'CONTINUAR',
                      onPressed: () {
                        controller.save(
                          name: controller.nameController.text,
                          points: widget.points,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
