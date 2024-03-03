import 'package:expense_tracker/components/list_tile.dart';
import 'package:expense_tracker/database/expense_database.dart';
import 'package:expense_tracker/helper/helper_functions.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextControllers
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    Provider.of<ExpenseDatabase>(context,listen: false).readExpense();
    super.initState();
  }

  // Dialog box to add new Expense
  void openNewExpenseBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("New Expense"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Name",
              ),
            ),
            TextField(
              controller: amountController,
              decoration:const InputDecoration(
                hintText: "Amount",
              ),
            ),
          ],
        ),
        actions: [
          _cancelButton(),
          _saveButton(),
        ],
      ),
    );
  }

  void openEditBox(Expense expense){
    // pre-fill existing values
    String existingName = expense.name;
    String existingAmount = expense.amount.toString();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Expense"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: existingName,
              ),
            ),
            TextField(
              controller: amountController,
              decoration:InputDecoration(
                hintText: existingAmount,
              ),
            ),
          ],
        ),
        actions: [
          _cancelButton(),
          _editButton(expense),
        ],
      ),
    );
  }

  void openDeleteBox(Expense expense){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Expense"),

        actions: [
          _cancelButton(),
          _deleteButton(expense.id),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseDatabase>(
      builder: (context , value , child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: openNewExpenseBox,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: value.allExpense.length,
          itemBuilder: (context,index) {
            Expense individualExpense = value.allExpense[index];
            return MyListTile(
              title: individualExpense.name,
              trailing: formatAmount(individualExpense.amount),
              onEditPressed: (context) => openEditBox(individualExpense),
              onDeletePressed: (context) => openDeleteBox(individualExpense),
            );
          }
        ),
      ),
    );
  }

  // Cancel Button
  Widget _cancelButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.pop(context);
        nameController.clear();
        amountController.clear();
      },
      child: const Text("Cancel"),
    );
  }
  // Save Button
  Widget _saveButton() {
    return MaterialButton(
      onPressed: () async {
        // Only if there is something to save
        if (nameController.text.isNotEmpty &&
            amountController.text.isNotEmpty) {
          // pop the alertDialog
          Navigator.pop(context);
          // Create a new expense
          Expense e = Expense(
              name: nameController.text,
              amount: convertStrongToDouble(amountController.text),
              date: DateTime.now());
          // add it to db
          await context.read<ExpenseDatabase>().createNewExpense(e);
          // clear the controllers
          nameController.clear();
          amountController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "EXPENSE NAME & AMOUNT CAN'T BE EMPTY!",
              ),
            ),
          );
        }
      },
      child: const Text("Save"),
    );
  }
  // Edit Button
  Widget _editButton(Expense expense) {
    return MaterialButton(
      onPressed: () async {
        // Only if at least one text field has been changed
        if (nameController.text.isNotEmpty ||
            amountController.text.isNotEmpty) {
          // pop the alertDialog
          Navigator.pop(context);
          // Create a new expense
          Expense e = Expense(
              name: nameController.text.isNotEmpty ? nameController.text : expense.name,
              amount: amountController.text.isNotEmpty ? convertStrongToDouble(amountController.text) : expense.amount,
              date: DateTime.now(),
          );
          // update it in db
          int existingId = expense.id;
          await context.read<ExpenseDatabase>().updateExpense(existingId,e);
          // clear the controllers
          nameController.clear();
          amountController.clear();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "EXPENSE NAME & AMOUNT CAN'T BE EMPTY!",
              ),
            ),
          );
        }
      },
      child: const Text("Edit"),
    );
  }
  // Delete Button
  Widget _deleteButton(int id) {
    return MaterialButton(
      onPressed: () async {
        // Pop the box
        Navigator.pop(context);

        // delete expense from db
        await context.read<ExpenseDatabase>().deleteExpense(id);

      },
      child: const Text("Delete"),
    );
  }
}
