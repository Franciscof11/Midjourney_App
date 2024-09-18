part of 'image_ai_cubit.dart';

@freezed
class ImageAiState with _$ImageAiState {
  const factory ImageAiState.initial() = _Initial;
  const factory ImageAiState.loading() = _Loading;
  const factory ImageAiState.data({required String imageUrl}) = _Data;
  const factory ImageAiState.error({required String message}) = _Error;
}
