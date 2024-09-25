import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midjourney_app/modules/midjourney/presentation/widgets/const_colors.dart';
import 'package:midjourney_app/modules/midjourney/presentation/widgets/custom_text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final promptTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/logo.png',
                width: 250,
                height: 250,
                color: mainGreen,
              ),
              //
              Text.rich(
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
                TextSpan(text: 'Mid', children: [
                  TextSpan(
                    text: 'journey',
                    style: GoogleFonts.raleway(
                      color: mainGreen,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400]!,
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          'Prompt da imagem',
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      CustomTextFormField(label: 'Digite a descrição da imagem', controller: promptTextController),
                      GestureDetector(
                        onTap: () {
                          promptTextController.clear();
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.delete_outline,
                              color: Colors.black,
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                      const SizedBox(height: 13),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 65),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainGreen,
                  fixedSize: const Size(250, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  final formValid = formKey.currentState?.validate() ?? false;

                  if (formValid) {
                    print('aha');
                    /*    context.read<ImageAiCubit>().generateImage(promptTextController.text); */
                  }
                },
                child: Text(
                  'Gerar Imagem',
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
