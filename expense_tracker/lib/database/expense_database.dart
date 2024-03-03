import 'package:flutter/cupertino.dart';
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
    _allExpense.addAll(fetchedExpenses);

    // Notify the changes to get updated UI
    notifyListeners();
  }

  // Edit the selected Expense
  Future<void> updateExpense(int id,Expense updatedExpense) async {
    // Make sure that new expense has same id as existing one
    updatedExpense.id = id;

    // Update in db
    await isar.writeTxn(() => isar.expenses.put(updatedExpense));

    // Read the data again to display changes
    await readExpense();
  }

  // Delete an Expense from db
  Future<void> deleteExpense(int id) async {
    // Delete Data using given Id
    await isar.writeTxn(() => isar.expenses.delete(id));

    // Read the data again to display changes
    readExpense();
  }

}