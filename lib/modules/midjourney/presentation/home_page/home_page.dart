import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midjourney_app/modules/midjourney/presentation/cubit/image_ai_cubit.dart';
import 'package:midjourney_app/modules/midjourney/presentation/widgets/custom_text_form_field.dart';
import 'package:midjourney_app/modules/midjourney/presentation/widgets/loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final promptTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            CustomTextFormField(label: 'Prompt da imagem', controller: promptTextController),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => context.read<ImageAiCubit>().generateImage(promptTextController.text),
              child: const Text('Gerar Imagem'),
            ),
            const SizedBox(height: 30),
            Center(
              child: Loader<ImageAiCubit, ImageAiState>(
                selector: (state) => state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                ),
              ),
            ),
            //
            BlocSelector<ImageAiCubit, ImageAiState, String>(
              selector: (state) => state.maybeWhen(
                data: (imageUrl) => imageUrl,
                orElse: () => '',
              ),
              builder: (context, imageUrl) {
                return Expanded(
                  child: RefreshIndicator(
                    color: Colors.green,
                    onRefresh: () async {
                      context.read<ImageAiCubit>().generateImage(promptTextController.text);
                    },
                    child: imageUrl == '' ? const SizedBox.shrink() : Image.network(imageUrl),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
