import 'package:flutter/material.dart';

void main() {
  runApp(RecipeFinderApp());
}

class RecipeFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Finder',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RecipeSearchScreen(),
    );
  }
}

class RecipeSearchScreen extends StatefulWidget {
  @override
  _RecipeSearchScreenState createState() => _RecipeSearchScreenState();
}

class _RecipeSearchScreenState extends State<RecipeSearchScreen> {
  final TextEditingController _ingredientController = TextEditingController();
  List<String> _recipes = [];

  void _searchRecipes() {
    String ingredient = _ingredientController.text.trim();
   
    setState(() {
      if (ingredient.isNotEmpty) {
        _recipes = [
          'Recipe with $ingredient 1',
          'Recipe with $ingredient 2',
          'Recipe with $ingredient 3',
        ];
      } else {
        _recipes = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Finder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _ingredientController,
              decoration: InputDecoration(
                labelText: 'Enter an ingredient',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _searchRecipes,
              child: Text('Search Recipes'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_recipes[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}