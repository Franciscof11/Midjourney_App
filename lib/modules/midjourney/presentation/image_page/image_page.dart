import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midjourney_app/modules/midjourney/presentation/cubit/image_ai_cubit.dart';
import 'package:midjourney_app/modules/midjourney/presentation/home_page/home_page.dart';
import 'package:midjourney_app/modules/midjourney/presentation/widgets/animated_loader.dart';

import '../widgets/const_colors.dart';

class ImagePage extends StatefulWidget {
  final String prompt;
  const ImagePage({super.key, required this.prompt});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: BlocBuilder<ImageAiCubit, ImageAiState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(
                child: AnimatedLoader(),
              ),
              orElse: () => const SizedBox.shrink(),
              data: (imageUrl) => Center(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      'Resultado',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                      child: Container(
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                            alignment: AlignmentDirectional.centerStart,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainGreen,
                        fixedSize: const Size(250, 60),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                      },
                      child: Text(
                        'Voltar',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
