import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:workshop_app/config/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // appbar transparent
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 20,
        ),
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const _HomeScreenForm(),
        ),
      ),
    );
  }
}

class _HomeScreenForm extends StatelessWidget {
  const _HomeScreenForm();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _Header(),
          SizedBox(height: 20),
          // _NewsTitle(),
          // SizedBox(height: 20),
          _News(),
          SizedBox(height: 20),
          _SurveyTitle(),
          SizedBox(height: 20),
          _Survey(),
          SizedBox(height: 20),
          _EventTitle(),
          SizedBox(height: 20),
          _Event(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsTitle extends StatelessWidget {
  const _NewsTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Nouvelles du jour',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _News extends StatelessWidget {
  const _News();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.26,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/artisanat.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Chiffres record pour l’apprentissage dans l’artisanat',
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'L’époque où l’apprentissage était méprisé semble révolue. Il rencontre un succès croissant, et l’artisanat en récolte aussi les fruits.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/ecolo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Une start-up a trouvé une solution pour remplacer l\'utilisation des pesticides sur les vignes',
                              maxLines: 3,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            AutoSizeText(
                              "Pour lutter contre l'usage des pesticides dans le milieu viticole, la start-up \"UV Boosting\" a trouvé une solution : utiliser des ultraviolets pour stimuler les défenses immunitaires de la plante. Une manière écologique de rendre la plante plus résistante. Europe 1 s'est rendue dans les vignes de l'entreprise pour une démonstration.",
                              maxLines: 4,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/centrale-nucléaire.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Bonne nouvelle. 28 réacteurs nucléaires remis en marche avant la fin de l’année !',
                              maxLines: 4,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'C’est une excellente nouvelle qui pourrait bien sauver notre pays des eaux… mais aussi une grande partie de l’Europe.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SurveyTitle extends StatelessWidget {
  const _SurveyTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Sondages de la semaine',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class _Survey extends StatelessWidget {
  const _Survey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: GridView.builder(
          itemCount: 2,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final survey = cardSurvey[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/survey',
                        arguments: survey),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(
                                survey.image ?? 'assets/images/survey1.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    survey.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class _EventTitle extends StatelessWidget {
  const _EventTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Événements à venir',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class _Event extends StatelessWidget {
  const _Event();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        'Voyage Chamonix',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      LinearProgressIndicator(
                        value: 7 / 10,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        minHeight: 20,
                      ),
                      const SizedBox(height: 20),
                      LinearProgressIndicator(
                        value: 2 / 10,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        minHeight: 20,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Non'),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('Oui'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        'AfterWork Barberousse',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      LinearProgressIndicator(
                        value: 5.35 / 10,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        minHeight: 20,
                      ),
                      const SizedBox(height: 20),
                      LinearProgressIndicator(
                        value: 4.62 / 10,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        minHeight: 20,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Non'),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('Oui'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardSurvey {
  final String title;
  final String description;
  final Color color;
  final List questions;
  final String? image;

  const CardSurvey({
    required this.title,
    required this.description,
    required this.color,
    required this.questions,
    this.image,
  });
}

final List<CardSurvey> cardSurvey = [
  CardSurvey(
    title: 'Sondage n°1',
    description: 'Un sondage qui parle de politique',
    color: AppColors.secondary,
    image: 'assets/images/survey3.jpg',
    questions: [
      {
        'question': 'Quel est votre parti politique préféré ?',
        'reponses': [
          {'reponse': 'PS'},
          {'reponse': 'LR'},
          {'reponse': 'LFI'},
          {'reponse': 'RN'},
        ]
      },
      {
        'question': 'Quel est votre sport préféré ?',
        'reponses': [
          {'reponse': 'Football'},
          {'reponse': 'Basketball'},
          {'reponse': 'Tennis'},
          {'reponse': 'Rugby'},
        ]
      },
      {
        'question': 'Quel est votre plat préféré ?',
        'reponses': [
          {'reponse': 'Pizza'},
          {'reponse': 'Hamburger'},
          {'reponse': 'Pâtes'},
          {'reponse': 'Sushi'},
        ]
      },
      {
        'question': 'Quel est votre animal préféré ?',
        'reponses': [
          {'reponse': 'Chien'},
          {'reponse': 'Chat'},
          {'reponse': 'Lapin'},
          {'reponse': 'Poisson rouge'},
        ]
      },
      {
        'question': 'Quel est votre pays préféré ?',
        'reponses': [
          {'reponse': 'France'},
          {'reponse': 'Espagne'},
          {'reponse': 'Italie'},
          {'reponse': 'Angleterre'},
        ]
      },
    ],
  ),
  CardSurvey(
    title: 'Sondage n°2',
    description: 'Quel est votre sport préféré ?',
    color: AppColors.primary,
    image: 'assets/images/survey2.jpeg',
    questions: [
      {
        'question': 'Quel est votre parti politique préféré ?',
        'reponses': [
          {'reponse': 'PS'},
          {'reponse': 'LR'},
          {'reponse': 'LFI'},
          {'reponse': 'RN'},
        ]
      },
      {
        'question': 'Quel est votre sport préféré ?',
        'reponses': [
          {'reponse': 'Football'},
          {'reponse': 'Basketball'},
          {'reponse': 'Tennis'},
          {'reponse': 'Rugby'},
        ]
      },
      {
        'question': 'Quel est votre plat préféré ?',
        'reponses': [
          {'reponse': 'Pizza'},
          {'reponse': 'Hamburger'},
          {'reponse': 'Pâtes'},
          {'reponse': 'Sushi'},
        ]
      },
      {
        'question': 'Quel est votre animal préféré ?',
        'reponses': [
          {'reponse': 'Chien'},
          {'reponse': 'Chat'},
          {'reponse': 'Lapin'},
          {'reponse': 'Poisson rouge'},
        ]
      },
      {
        'question': 'Quel est votre pays préféré ?',
        'reponses': [
          {'reponse': 'France'},
          {'reponse': 'Espagne'},
          {'reponse': 'Italie'},
          {'reponse': 'Angleterre'},
        ]
      },
    ],
  ),
  CardSurvey(
    title: 'Sondage n°3',
    description: 'Quel est votre plat préféré ?',
    color: AppColors.secondary,
    image: 'assets/images/survey1.jpeg',
    questions: [
      {
        'question': 'Quel est votre parti politique préféré ?',
        'reponses': [
          {'reponse': 'PS'},
          {'reponse': 'LR'},
          {'reponse': 'LFI'},
          {'reponse': 'RN'},
        ]
      },
      {
        'question': 'Quel est votre sport préféré ?',
        'reponses': [
          {'reponse': 'Football'},
          {'reponse': 'Basketball'},
          {'reponse': 'Tennis'},
          {'reponse': 'Rugby'},
        ]
      },
      {
        'question': 'Quel est votre plat préféré ?',
        'reponses': [
          {'reponse': 'Pizza'},
          {'reponse': 'Hamburger'},
          {'reponse': 'Pâtes'},
          {'reponse': 'Sushi'},
        ]
      },
      {
        'question': 'Quel est votre animal préféré ?',
        'reponses': [
          {'reponse': 'Chien'},
          {'reponse': 'Chat'},
          {'reponse': 'Lapin'},
          {'reponse': 'Poisson rouge'},
        ]
      },
      {
        'question': 'Quel est votre pays préféré ?',
        'reponses': [
          {'reponse': 'France'},
          {'reponse': 'Espagne'},
          {'reponse': 'Italie'},
          {'reponse': 'Angleterre'},
        ]
      },
    ],
  ),
  CardSurvey(
    title: 'Sondage n°4',
    description: 'Quel est votre animal préféré ?',
    color: AppColors.primary,
    image: 'assets/images/survey4.jpg',
    questions: [
      {
        'question': 'Quel est votre parti politique préféré ?',
        'reponses': [
          {'reponse': 'PS'},
          {'reponse': 'LR'},
          {'reponse': 'LFI'},
          {'reponse': 'RN'},
        ]
      },
      {
        'question': 'Quel est votre sport préféré ?',
        'reponses': [
          {'reponse': 'Football'},
          {'reponse': 'Basketball'},
          {'reponse': 'Tennis'},
          {'reponse': 'Rugby'},
        ]
      },
      {
        'question': 'Quel est votre plat préféré ?',
        'reponses': [
          {'reponse': 'Pizza'},
          {'reponse': 'Hamburger'},
          {'reponse': 'Pâtes'},
          {'reponse': 'Sushi'},
        ]
      },
      {
        'question': 'Quel est votre animal préféré ?',
        'reponses': [
          {'reponse': 'Chien'},
          {'reponse': 'Chat'},
          {'reponse': 'Lapin'},
          {'reponse': 'Poisson rouge'},
        ]
      },
      {
        'question': 'Quel est votre pays préféré ?',
        'reponses': [
          {'reponse': 'France'},
          {'reponse': 'Espagne'},
          {'reponse': 'Italie'},
          {'reponse': 'Angleterre'},
        ]
      },
    ],
  ),
];
