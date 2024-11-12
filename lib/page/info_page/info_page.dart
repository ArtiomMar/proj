// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'components/history_list_sapros.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List historyListSapros = [
    HistoryListSapros(
      text: 'Запрос 1',
      discreption: 'Ответ на запрос 1',
      dateTime: '${DateTime.now()},',
    ),
    HistoryListSapros(
      text: 'Запрос 2',
      discreption: 'Ответ на запрос 2',
      dateTime: '${DateTime.now()},',
    ),
    HistoryListSapros(
      text: 'Запрос 3',
      discreption: 'Ответ на запрос 3',
      dateTime: '${DateTime.now()},',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text('Категории'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HISTORY
              const Text(
                'History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: historyListSapros.length,
                  itemBuilder: (context, index) {
                    final historyList = historyListSapros[index];
                    return HistoryListSapros(
                      text: historyList.text,
                      discreption: historyList.discreption,
                      dateTime: historyList.dateTime,
                    );
                  },
                ),
              ),
              // КАТЕГОРИИ
            ],
          ),
        ),
      ),
    );
  }
}
