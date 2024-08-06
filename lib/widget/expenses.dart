import "package:expenses_tracker/model/expenses_model.dart";
import "package:expenses_tracker/widget/chart/chart.dart";
import "package:expenses_tracker/widget/expenses_list/expense_list.dart";
import "package:expenses_tracker/widget/expenses_list/new_expense_modal.dart";
import "package:flutter/material.dart";

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (ctx) => NewExpense(
        addNewExpense: _addExpense,
      ),
      isScrollControlled: true,
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    var itemIndex = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                expenses.insert(itemIndex, expense);
              });
            }),
        content: const Text("Expence item removed"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No expenses added yet!"),
    );

    if (expenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: expenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: expenses),
                Expanded(
                  child: ExpenseList(
                    expenses: expenses,
                    onRemoveExpense: _removeExpense,
                  ),
                ),
              ],
            )
          : Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Chart(expenses: expenses),
                  ),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              ),
            ),
    );
  }
}
