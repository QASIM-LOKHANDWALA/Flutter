import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/expense.dart';

class ExpenseDatabase extends ChangeNotifier {
  static late Isar isar;
  List<Expense> _allExpense = [];

  // Initialize db
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([ExpenseSchema], directory: dir.path);
  }

  // Getter for Expense List
  List<Expense> get allExpense => _allExpense;

  // Add a new Expense
  Future<void> createNewExpense(Expense newExpense) async {
    // Add the new Expense to db
    await isar.writeTxn(() => isar.expenses.put(newExpense));

    // Read the database to get changes
    readExpense();
  }

  // Get Expense data from db
  Future<void> readExpense() async {
    // Get all the data from db
    List<Expense> fetchedExpenses = await isar.expenses.where().findAll();

    // Clear the current list
    _allExpense.clear();

    // update the data in list
    if(fetchedExpenses.isNotEmpty){
      _allExpense.addAll(fetchedExpenses);
    }

    // Notify the changes to get updated UI
    notifyListeners();
  }

  // Edit the selected Expense
  Future<void> updateExpense(int id,Expense updatedExpense) async {
    // Check if the expense with the specified ID exists in _allExpense list
    bool expenseExists = _allExpense.any((expense) => expense.id == id);

    if (!expenseExists) {
      // Handle the case where the expense with the specified ID is not found
      // You can throw an exception, log an error, or handle it in another appropriate way
      throw Exception("Expense with ID $id not found");
    }

    // Make sure that new expense has the same id as the existing one
    updatedExpense.id = id;

    // Update in db
    await isar.writeTxn(() => isar.expenses.put(updatedExpense));

    // Read the data again to display changes
    await readExpense();
  }

  // Delete an Expense from db
  Future<void> deleteExpense(int id) async {
    // Check if the expense with the specified ID exists in _allExpense list
    bool expenseExists = _allExpense.any((expense) => expense.id == id);

    if (!expenseExists) {
      // Handle the case where the expense with the specified ID is not found
      // You can throw an exception, log an error, or handle it in another appropriate way
      throw Exception("Expense with ID $id not found");
    }

    // Delete Data using given Id
    await isar.writeTxn(() => isar.expenses.delete(id));

    // Read the data again to display changes
    await readExpense();
  }

  // Calculate total expenses for each month
  Future<Map<int,double>> calculateMonthlyTotal() async {
    // ensure that expenses are read from db
    await readExpense();
    // Create a map to keep track of expenses of each month
    Map<int,double> monthlyTotals = {};
    // Iterate over all expenses
    for(var expense in _allExpense){
      // Extract the month from date
      int month = expense.date.month;
      // If not in map initialize that month's expenses with zero
      if(!monthlyTotals.containsKey(month)){
        monthlyTotals[month] = 0;
      }
      // add the expense amount to total for the month
      monthlyTotals[month] = monthlyTotals[month]! + expense.amount;
    }
    return monthlyTotals;
  }

  // Calculate current month total
  Future<double> calculateCurrentMonthTotal() async {
    // Ensure that expenses are read from db
    await readExpense();

    // Get the current month and year
    int currentMonth = DateTime.now().month;
    int currentYear = DateTime.now().year;

    // Filter expenses for the current month and year
    List<Expense> currentMonthExpenses = _allExpense.where((expense) {
      return expense.date.month == currentMonth && expense.date.year == currentYear;
    }).toList();

    // Check if there are any expenses for the current month and year
    if (currentMonthExpenses.isEmpty) {
      // Handle the case where there are no expenses for the current month and year
      // For example, you can return 0 or another default value
      return 0.0;
    }

    // Calculate the total amount for the current month
    double total = currentMonthExpenses.fold(0, (sum, expense) => sum + expense.amount);
    return total;
  }

  // Get the start month
  int getStartMonth() {
    if (_allExpense.isNotEmpty) {
      _allExpense.sort((a, b) => a.date.compareTo(b.date));
      return _allExpense.first.date.month;
    } else {
      return DateTime.now().month;
    }
  }
  // Get the start year
  int getStartYear() {
    if (_allExpense.isNotEmpty) {
      // If _allExpense is not empty, return the month of the first expense
      return _allExpense.first.date.year;
    } else {
      return DateTime.now().year;
    }
  }

}