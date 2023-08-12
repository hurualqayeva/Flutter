import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BookList(),
    );
  }
}

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('data/api.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Text('Data not found');
          }

          var booksData = jsonDecode(snapshot.data.toString());
          List<dynamic> bookList = booksData['books'];

          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              thickness: 3,
            ),
            itemCount: bookList.length,
            itemBuilder: (BuildContext context, int index) {
              var book = bookList[index];
              return ListTile(
                title: Text(book['title']),
                subtitle: Text(book['author']),
                trailing: Text(book['rating'].toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetails(book: book),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetails extends StatelessWidget {
  final dynamic book;

  const BookDetails({required this.book, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book['title']),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichTextInfo(label: 'Author:', value: book['author']),
            Divider(),
            RichTextInfo(label: 'Published Year:', value: book['published_year'].toString()),
            Divider(),
            RichTextInfo(label: 'Genres:', value: book['genre'].join(', ')),
            Divider(),
            RichTextInfo(label: 'Rating:', value: book['rating'].toString()),
            Divider(),
            RichTextInfo(label: 'Description:', value: book['description']),
          ],
        ),
      ),
    );
  }
}

class RichTextInfo extends StatelessWidget {
  final String label;
  final String value;

  const RichTextInfo({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        children: [
          TextSpan(text: '$label '),
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.blue, 
            ),
          ),
        ],
      ),
    );
  }
}
