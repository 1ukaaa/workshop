import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:workshop_app/config/colors.dart';
import 'package:workshop_app/pages/home_screen.dart';

class SurveyScreen extends StatefulWidget {
  final CardSurvey cardSurvey;
  const SurveyScreen({super.key, required this.cardSurvey});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int indexQuestion = 0;
  int indexAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.cardSurvey.image!),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${indexQuestion + 1} / ${widget.cardSurvey.questions.length}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    LinearProgressIndicator(
                      value: indexQuestion / widget.cardSurvey.questions.length,
                      backgroundColor: Colors.white.withOpacity(0.5),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Sélectionnez une réponse',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: AutoSizeText(
                                widget.cardSurvey.questions[indexQuestion]
                                    ['question'],
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.cardSurvey
                                  .questions[indexQuestion]['reponses'].length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 70,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: indexAnswer == index
                                          ? AppColors.primary
                                          : Theme.of(context).cardColor,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 0.5,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    margin: const EdgeInsets.all(10),
                                    child: InkWell(
                                      onTap: () => setState(() {
                                        indexAnswer = index;
                                      }),
                                      child: Center(
                                        child: Text(
                                          widget.cardSurvey
                                                  .questions[indexQuestion]
                                              ['reponses'][index]['reponse'],
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: indexAnswer == index
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (indexQuestion > 0) {
                                          setState(() {
                                            indexQuestion--;
                                            indexAnswer = 0;
                                          });
                                        } else {
                                          Navigator.pushNamed(context, '/home');
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: AppColors.primary,
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: const Text('Précédent'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.secondary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (indexQuestion <
                                            widget.cardSurvey.questions.length -
                                                1) {
                                          setState(() {
                                            indexQuestion++;
                                            indexAnswer = 0;
                                          });
                                        } else {
                                          Navigator.pushReplacementNamed(
                                              context, '/home');
                                        }
                                      },
                                      child: const Text('Next'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
