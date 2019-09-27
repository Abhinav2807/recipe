import 'package:flutter/material.dart';
import '../widgets/categoryDishes.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const categoryMealsscreenpath = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  var categoryTitle;
  List<Meal> displayedMeals;
  var loadedinitData=false;

  @override
  void initState() {
   
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!loadedinitData)
     {final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArguments['id'];
    categoryTitle = routeArguments['title'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
    loadedinitData=true;}
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return CategoryDishes(
            displayedMeals[index].title,
            displayedMeals[index].id,
            displayedMeals[index].affordability,
            displayedMeals[index].complexity,
            displayedMeals[index].duration,
            displayedMeals[index].imageUrl,
            removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
