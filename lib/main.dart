import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/filter_screen.dart';
import './screens/tab_screens.dart';
import './screens/category_mealItem_screen.dart'; 
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> filter={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal> availableMeals=DUMMY_MEALS;

  void setFilters(Map<String,bool> filterData)
  {
    setState(() {
     filter=filterData;
     availableMeals=DUMMY_MEALS.where((meal){
       if(filter['gluten']==true && !meal.isGlutenFree)
       {
         return false;
       }
       if(filter['lactose']==true && !meal.isLactoseFree)
       {
         return false;
       }
       if(filter['vegan']==true && !meal.isVegan)
       {
         return false;
       }
       if(filter['vegetarian']==true && !meal.isVegetarian)
       {
         return false;
       }
       return true;

     }).toList(); 
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20 ,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: "/",
      routes: {
        "/":(ctx)=>TabScreens(),
        CategoryMealScreen.categoryMealsscreenpath: (ctx)=>CategoryMealScreen(availableMeals),
        CategoryMealItemScreen.mealRoute:(ctx)=>CategoryMealItemScreen(),
        FilterScreen.routeName:(ctx)=>FilterScreen(setFilters,filter),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DeliMeals"),
      ),
      body: Container(
        child: Center(
          child: Text("Lets start"),
        ),
      ),
    );
  }
}
