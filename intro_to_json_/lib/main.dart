import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
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
            Text(
              'Author: ${book['author']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Published Year: ${book['published_year']}'),
            SizedBox(height: 8),
            Text('Genres: ${book['genre'].join(', ')}'),
            SizedBox(height: 8),
            Text('Rating: ${book['rating']}'),
            SizedBox(height: 16),
            Text('Description: ${book['description']}'),
          ],
        ),
      ),
    );
  }
}
