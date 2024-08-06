import 'package:expenses_tracker/model/expenses_model.dart';

List<Expense> expenses = [
  Expense(
    title: "Buy grocessory",
    amount: 22.10,
    date: DateTime.now(),
    category: Category.food,
  ),
  Expense(
    title: "Buy spagetti",
    amount: 12.12,
    date: DateTime.now(),
    category: Category.food,
  ),
  Expense(
    title: "Go swimming",
    amount: 10,
    date: DateTime.now(),
    category: Category.leisure,
  ),
  Expense(
    title: "Go Sky-diving",
    amount: 12.11,
    date: DateTime.now(),
    category: Category.travel,
  ),
];
