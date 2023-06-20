import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_firebase_app/product/models/news.dart';
import 'package:flutter_full_firebase_app/product/utility/exception/custom_exception.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const HomeListView(),
    );
  }
}

class HomeListView extends StatelessWidget {
  const HomeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CollectionReference news = FirebaseFirestore.instance.collection('news');
    final response = news.withConverter(
      fromFirestore: (snapshot, options) {
        return const News().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        if (value == null) throw FirebaseCustomException('$value null');
        return value.toJson();
      },
    ).get();
    return FutureBuilder(
      future: response,
      // ignore: lines_longer_than_80_chars
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<News?>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Placeholder();
          case ConnectionState.waiting:

          case ConnectionState.active:
            return const LinearProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasData) {
              final values = snapshot.data!.docs.map((e) => e.data()).toList();
              return ListView.builder(
                itemCount: values.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          values[index]?.backgroundImage ?? '',
                          height: 100,
                        ),
                        Text(values[index]?.title ?? '')
                      ],
                    ),
                  );
                },
              );
            } else {
              return const SizedBox.shrink();
            }
        }
      },
    );
  }
}
