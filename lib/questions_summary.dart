import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: data['correct_answer'] == data['user_answer']
                          ? Colors.lightGreenAccent
                          : Colors.pinkAccent,
                    ),
                    child: Center(
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          if (data['correct_answer'] == data['user_answer']) ...[
                            Text(
                              data['correct_answer'] as String,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.lightGreenAccent,
                              ),
                            ),
                          ] else ...[
                            Text(
                              data['user_answer'] as String,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            Text(
                              data['correct_answer'] as String,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.lightGreenAccent,
                              ),
                            ),
                          ],
                          const SizedBox(height: 15),
                        ]),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
