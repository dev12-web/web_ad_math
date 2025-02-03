import 'package:flutter/material.dart';
import 'dart:math';
//import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Математический тренажёр'),
          backgroundColor: const Color.fromARGB(255, 183, 226, 254),
        ),
        body: Container(
          //color: Colors.lightBlue[50],
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration( 
            image: DecorationImage( 
              image: AssetImage(
                "assets/background.jpg"), 
                fit: BoxFit.cover, 
                ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildMenuButton(
                    context, 'Тестовые задания', const PracticeTestPage()),
                const SizedBox(height: 30),
                // ignore: prefer_const_constructors
                _buildMenuButton(context, 'Контрольный тест', ExamTestPage()),
                const SizedBox(height: 30),
                _buildMenuButton(context, 'Правила', const TheoryPage()),
                const SizedBox(height: 30)
              ],
            ),
          ),
        ));
  }
}

Widget _buildMenuButton(BuildContext context, String text, Widget nextPage) {
  return SizedBox(
    width: 300, // ширину кнопок
    height: 80, //  высоту кнопок
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 183, 226, 254), // Фон кнопки
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(
              color: Colors.black,
              width: 6.0), // Черная обводка средней толщины
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic, // Делаем текст курсивом
        ),
      ),
    ),
  );
}

class TheoryPage extends StatelessWidget {
  const TheoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 183, 226, 254),
        title: const Text('Правила'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration( 
            image: DecorationImage( 
              image: AssetImage( "assets/theory.jpg"), 
                fit: BoxFit.cover, 
                ),
          ),
        child: ListView(
          children: const [
            TheoryButton(
                title: '1. Сложение рациональных чисел',
                page: AdditionTheoryPage()),
            TheoryButton(
                title: '2. Вычитание рациональных чисел',
                page: SubtractionTheoryPage()),
            //TheoryButton(
              //title: "3. Видеоурок",
             // page: VideoTheoryPage()),
          ],
        ),
      ),
    );
  }
}

class TheoryButton extends StatelessWidget {
  final String title;
  final Widget page;

  const TheoryButton({super.key, required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}

class AdditionTheoryPage extends StatelessWidget {
  const AdditionTheoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сложение рациональных чисел'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Чтобы сложить два числа с разными знаками, нужно:\n\n'
              '1) назвать слагаемые и найти модуль каждого из них;\n'
              '2) найти разность модулей: из большего модуля вычесть меньший;\n'
              '3) если положительное слагаемое имеет больший модуль, то в результате записать положительное число с модулем, вычисленным в п. 2, в противном случае — записать отрицательное число с модулем, вычисленным в п. 2.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Пример'),
                        content: const SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Text(
                                'Найдите сумму: 2,5 + (–6,2).\n\n'
                                'Решение:\n'
                                '1. Слагаемые: 2,5 и –6,2; модули слагаемых: |2,5| = 2,5; |–6,2| = 6,2; '
                                'больший модуль (6,2) у отрицательного слагаемого, значит, результат сложения '
                                'есть отрицательное число.\n'
                                '2. Разность модулей: 6,2 – 2,5 = 3,7.\n'
                                '3. Сумма равна: 2,5 + (–6,2) = –3,7.',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Закрыть'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Пример',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
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

class SubtractionTheoryPage extends StatelessWidget {
  const SubtractionTheoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вычитание рациональных чисел'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Чтобы из одного числа вычесть другое, нужно уменьшаемое сложить с числом, противоположным вычитаемому.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Пример 1'),
                        content: const Text(
                          'Найдите разность 5 – (–3).\n\nРешение: \n\n запись –(–3) можно прочитать: число, противоположное числу –3, т. е. +3. Тогда получим: 5 – (–3) = 5 + 3 = 8, разность заменили суммой: уменьшаемое (5) сложили с числом (3), противоположным вычитаемому.\n\nС другой стороны, можно воспользоваться определением действия вычитания. По определению вычитания: вычесть из числа 5 число –3 — это значит найти такое число, которое в сумме с числом –3 даст число 5. Очевидно, это есть число 8.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Закрыть'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Пример'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PracticeTestPage extends StatefulWidget {
  const PracticeTestPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PracticeTestPageState createState() => _PracticeTestPageState();
}

class _PracticeTestPageState extends State<PracticeTestPage> {
  int _num1 = Random().nextInt(20) - 10;
  int _num2 = Random().nextInt(20) - 10;
  String _operator = Random().nextBool() ? '+' : '-';
  List<int> _choices = [];
  late int _correctAnswer;
  String _feedback = '';
  int _questionCount = 1;
  int _correctAnswers = 0;
  int _wrongAnswers = 0;

  @override
  void initState() {
    super.initState();
    _generateChoices();
  }

void _generateNewQuestion() {
  setState(() {
    if (_questionCount >= 10) {
      _showFinalResults();
      _questionCount = 1;
    } else {
      _num1 = Random().nextInt(20) - 10;
      _num2 = Random().nextInt(20) - 10;
      _operator = Random().nextBool() ? '+' : '-';
      _generateChoices();
      _questionCount++;
    }
  });
}


  void _generateChoices() {
    setState(() {
      _correctAnswer = _operator == '+' ? _num1 + _num2 : _num1 - _num2;
      _choices = [_correctAnswer];
      while (_choices.length < 3) {
        int choice;
        do {
          choice = Random().nextInt(40) - 20;
        } while (_choices.contains(choice) ||
            choice == _correctAnswer ||
            (choice - _correctAnswer).abs() < 3);
        _choices.add(choice);
      }
      _choices.shuffle();
    });
  }

  bool _isAnswerCorrect = true;

void _checkAnswer(int selectedAnswer) {
  setState(() {
    if (selectedAnswer == _correctAnswer) {
      _feedback = 'Верно!';
      _correctAnswers++;
      _isAnswerCorrect = true;
    } else {
      _feedback = 'Неверно! Правильный ответ: $_correctAnswer';
      _wrongAnswers++;
      _isAnswerCorrect = false;
    }
  });

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        color: _isAnswerCorrect ? Colors.green : Colors.red,
        child: Wrap(
          children: [
            ListTile(
              title: Center(child: Text(_feedback)),
              trailing: Icon(
                _isAnswerCorrect ? Icons.check_circle : Icons.cancel,
                size: 25,
              ),
            ),
            ListTile(
              title: Center(
                child: TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _generateNewQuestion();
                  },
                ),
              ),
            ),
            if (!_isAnswerCorrect)
              ListTile(
                title: Center(
                  child: TextButton(
                    child: const Text('Иллюстрация'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IllustrationPage(
                            num1: _num1,
                            num2: _num2,
                            operator: _operator,
                          ),
                        ),
                      ).then((_) {
                        _generateNewQuestion();
                      });
                    },
                  ),
                ),
              ),
          ],
        ),
      );
    },
  );
}


  void _showFinalResults() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(
            'Тест окончен!\nПравильных ответов: $_correctAnswers\nНеправильных ответов: $_wrongAnswers\n'
            '${_correctAnswers < 7 ? "Нужно повторить правила" : "Молодец"}'),
        actions: [
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _questionCount = 1;
                _correctAnswers = 0;
                _wrongAnswers = 0;
                _generateNewQuestion();
              });
            },
          ),
          if (_correctAnswers < 7)
            TextButton(
              child: const Text('Открыть правила'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const TheoryPage()),
                );
              },
            ),
        ],
      );
    },
  );
}

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 183, 226, 254),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Тестовые задания'),
          Text(
            'Вопрос $_questionCount/10',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.lightbulb_outline),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewPage(),
              ),
            );
          },
        ),
      ],
    ),

    body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/test.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Чему равно: $_num1 $_operator ${_num2 < 0 ? '($_num2)' : '$_num2'}?',
              style: const TextStyle(fontSize: 24),
            ),
            for (int choice in _choices)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _checkAnswer(choice),
                  child: Text(choice.toString()),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
  }


class NewPage extends StatelessWidget {
  const NewPage({super.key});
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Подсказка'), 
      ), 
        body: Center( 
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[ 
              Image.asset('assets/hint.jpg'), 
              const SizedBox(height: 100), 
              ElevatedButton( onPressed: () { 
                 Navigator.pop(context); 
                }, 
                child: const Text('OK'),
                ), 
                ], 
                ), 
                ), 
                ); 
                } 
                }

class IllustrationPage extends StatefulWidget {
  final int num1;
  final int num2;
  final String operator;
  final Duration duration;

  IllustrationPage({
    super.key,
    required this.num1,
    required this.num2,
    required this.operator,
    this.duration = const Duration(seconds: 6),
  }) {
    assert(operator == '+' || operator == '-', 'Operator should be either + or -');
  }

  @override
  // ignore: library_private_types_in_public_api
  _IllustrationPageState createState() => _IllustrationPageState();
}

class _IllustrationPageState extends State<IllustrationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(
            begin: widget.num1.toDouble(),
            end: (widget.operator == '+'
                    ? widget.num1 + widget.num2
                    : widget.num1 - widget.num2)
                .toDouble())
        .animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Иллюстрация'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${widget.num1} ${widget.operator} ${widget.num2 < 0 ? '(${widget.num2})' : widget.num2}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20), // Отступ между текстом и иллюстрацией
          CustomPaint(
            painter: ThermometerPainter(
              _animation.value,
              widget.num1,
              widget.num2,
              widget.operator,
            ),
            size: const Size(100, 400),
          ),
        ],
      ),
    ),
  );
}
}


class ThermometerPainter extends CustomPainter {
  final double temperature;
  final int num1;
  final int num2;
  final String operator;

  ThermometerPainter(this.temperature, this.num1, this.num2, this.operator);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    double tubeWidth = size.width / 4;
    double tubeHeight = size.height;

    // Draw the tube
    canvas.drawRect(
      Rect.fromCenter(
          center: Offset(size.width / 2, tubeHeight / 2),
          width: tubeWidth,
          height: tubeHeight),
      paint,
    );

    Paint fillPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    double temperatureHeight = ((temperature + 15) / 30) * tubeHeight; 

    canvas.drawRect(
      Rect.fromCenter(
          center: Offset(size.width / 2, size.height - temperatureHeight / 2),
          width: tubeWidth,
          height: temperatureHeight),
      fillPaint,
    );

    Paint rectPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(0, size.height, size.width, 20),
      rectPaint,
    );

    Paint textPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    for (int i = -15; i <= 15; i++) {
      double yPos = size.height - ((i + 15) / 30) * tubeHeight;
      canvas.drawLine(Offset(size.width / 2 - tubeWidth, yPos),
          Offset(size.width / 2 + tubeWidth, yPos), textPaint);
      TextSpan span = TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 10),
          text: i.toString());
      TextPainter tp = TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, Offset(0, yPos - 5));
    }

    fillPaint.color = Colors.grey;
    double initialTempHeight = ((num1 + 15) / 30) * tubeHeight;
    canvas.drawCircle(
        Offset(size.width / 2, size.height - initialTempHeight), 5, fillPaint);

    double finalTempHeight = ((temperature + 15) / 30) * tubeHeight;
    canvas.drawCircle(
        Offset(size.width / 2, size.height - finalTempHeight), 5, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ExamTestPage extends StatefulWidget {
  const ExamTestPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExamTestPageState createState() => _ExamTestPageState();
}

class _ExamTestPageState extends State<ExamTestPage> {
  final TextEditingController _answerController = TextEditingController();
  int _num1 = _getRandomNumber(),
      _num2 = _getRandomNumber(),
      _questionCount = 1,
      _correctAnswers = 0,
      _wrongAnswers = 0;
  String _operator = Random().nextBool() ? '+' : '-';
  String _feedback = '';
  bool _answered = false;

  static int _getRandomNumber() {
    int num = Random().nextInt(21) - 10;
    return num == 0 ? Random().nextInt(21) - 10 : num;
  }

  void _generateNewQuestion() {
  setState(() {
    if (_questionCount >= 10) {
      _showFinalResults();
      _questionCount = 1; // Reset question count to 1 after showing final results
    } else {
      _num1 = Random().nextInt(100) - 50; // Диапазон от -50 до 49
      _num2 = Random().nextInt(100) - 50; // Диапазон от -50 до 49
      _operator = Random().nextBool() ? '+' : '-'; // Оператор + или -
      if (_num1 == 0) _num1 = Random().nextInt(99) + 1; // Избегаем 0
      if (_num2 == 0) _num2 = Random().nextInt(99) + 1; // Избегаем 0
      _questionCount++;
      _answered = false;
      _answerController.clear();
    }
  });
}


  void _checkAnswer() {
  if (_answered) return;

  int correctAnswer = _operator == '+' ? _num1 + _num2 : _num1 - _num2;

  setState(() {
    if (_answerController.text.trim().isEmpty) {
      _feedback = 'Введите ответ';
      _answered = false;
    } else if (int.tryParse(_answerController.text) == correctAnswer) {
      _feedback = 'Верно!';
      _correctAnswers++;
      _answered = true;
    } else {
      _feedback = 'Неверно! Правильный ответ: $correctAnswer';
      _wrongAnswers++;
      _answered = true;
    }
  });

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        color: int.tryParse(_answerController.text) == correctAnswer
            ? Colors.green
            : Colors.red,
        child: Wrap(
          children: [
            ListTile(
              title: Center(child: Text(_feedback)),
              trailing: Icon(
                int.tryParse(_answerController.text) != correctAnswer
                    ? Icons.cancel
                    : Icons.check_circle,
                size: 25,
              ),
            ),
            ListTile(
              title: Center(
                child: TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (_answered) {
                      _generateNewQuestion();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}


  
 void _showFinalResults() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: _correctAnswers < 7 ? Colors.red[100] : Colors.green[100],
        content: Text(
            'Тест окончен!\nПравильных ответов: $_correctAnswers\nНеправильных ответов: $_wrongAnswers\n'
            '${_correctAnswers < 7 ? "Нужно повторить правила" : "Молодец"}'),
        actions: [
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _questionCount = 1;
                _correctAnswers = 0;
                _wrongAnswers = 0;
                _generateNewQuestion();
              });
            },
          ),
          if (_correctAnswers < 7)
            TextButton(
              child: const Text('Открыть правила'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const TheoryPage()),
                );
              },
            ),
        ],
      );
    },
  );
}

  @override
  @override
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 183, 226, 254), // Фон кнопки
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Контрольный тест'),
          Text(
            'Вопрос ${_questionCount > 10 ? 1 : _questionCount}/10', // Resets counter to 1 if it exceeds 10
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
    body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/test.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Чему равно:  $_num1 $_operator ${_num2 < 0 ? '($_num2)' : '$_num2'}?',
              style: const TextStyle(fontSize: 24),
            ),
           TextField(
  controller: _answerController,
  decoration: const InputDecoration(
    labelText: 'Ваш ответ',
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  ),
  keyboardType: TextInputType.text,
  style: const TextStyle(color: Colors.white), // Optional: change text color to white
),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Проверить',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold)), // Стиль текста на кнопке
            ),
          ],
        ),
      ),
    ),
  );
}
}