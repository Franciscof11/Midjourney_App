import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:midjourney_app/modules/midjourney/data/open_ai_service.dart';

part 'image_ai_cubit.freezed.dart';
part 'image_ai_state.dart';

class ImageAiCubit extends Cubit<ImageAiState> {
  final OpenAIService _openAIService;
  ImageAiCubit({required OpenAIService openAIService})
      : _openAIService = openAIService,
        super(const ImageAiState.initial());

  Future<void> generateImage(String prompt) async {
    try {
      emit(const ImageAiState.loading());

      final imageUrl = await _openAIService.generateImage(prompt);

      emit(ImageAiState.data(imageUrl: imageUrl));
    } catch (e) {
      log(
        'Erro ao gerar imagem!',
        error: e,
      );
      emit(ImageAiState.error(message: e.toString()));
    }
  }
}
