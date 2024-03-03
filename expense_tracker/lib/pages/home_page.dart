import 'package:expense_tracker/bar%20graph/bar_graph.dart';
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

  // Futures to load graph data & monthly total
  Future<Map<int,double>>? _monthlyTotalFuture;
  Future<double>? _calculateCurrentMonthTotal;

  @override
  void initState() {
    Provider.of<ExpenseDatabase>(context,listen: false).readExpense();
    refreshData();
    super.initState();
  }

  // Refresh graph data
  void refreshData(){
    _monthlyTotalFuture = Provider.of<ExpenseDatabase>(context , listen: false).calculateMonthlyTotal();
    _calculateCurrentMonthTotal = Provider.of<ExpenseDatabase>(context , listen: false).calculateCurrentMonthTotal();
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
  // Dialog box to edit the stored expense
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
  // Dialog box to delete the stored expense
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
      builder: (context , value , child) {
        // Get dates
        int startMonth = value.getStartMonth();
        int startYear = value.getStartYear();
        int currentMonth = DateTime.now().month;
        int currentYear = DateTime.now().year;

        // calculate number of months sic=nce the first month
        int monthCount = calculateMonthCount(startYear, startMonth, currentYear, currentMonth);

        // only display expenses for current month
        List<Expense> currentMonthExpenses = value.allExpense.where((expense) {
            return expense.date.year == currentYear &&
                   expense.date.month == currentMonth;
          }
        ).toList();

        // Return UI
        return Scaffold(
          backgroundColor: Colors.grey.shade300,
          floatingActionButton: FloatingActionButton(
            onPressed: openNewExpenseBox,
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: FutureBuilder<double>(
              future: _calculateCurrentMonthTotal,
              builder: (context,snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  return Center(child: Text("₹${snapshot.data!.toStringAsFixed(2)}"));
                }else{
                  return const Center(child: Text("Loading..."));
                }
              },
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                // Bar Graph UI
               SizedBox(
                 height: 250,
                 child: FutureBuilder(
                   future: _monthlyTotalFuture,
                   builder: (context,snapshot){
                     if(snapshot.connectionState == ConnectionState.done){
                       final monthlyTotals = snapshot.data ?? {};
                       List<double> monthlySummary = List.generate(monthCount, (index) => monthlyTotals[startMonth + index] ?? 0.0,);
                       return MyBarGraph(monthlySummary: monthlySummary, startMonth: startMonth);
                     }
                     // Loading
                     else{
                       return const Center(child: Text("Loading..."));
                     }
                   },
                 ),
               ),

                // Expense list UI
                Expanded(
                  child: ListView.builder(
                      itemCount: currentMonthExpenses.length,
                      itemBuilder: (context,index) {
                        int reversedIndex = currentMonthExpenses.length - index -1;
                        Expense individualExpense = currentMonthExpenses[reversedIndex];
                        return MyListTile(
                          title: individualExpense.name,
                          trailing: formatAmount(individualExpense.amount),
                          onEditPressed: (context) => openEditBox(individualExpense),
                          onDeletePressed: (context) => openDeleteBox(individualExpense),
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        );
      }
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
          // Refresh graph
          refreshData();
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
          // Refresh graph
          refreshData();
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

        // Refresh graph
        refreshData();

      },
      child: const Text("Delete"),
    );
  }
}
