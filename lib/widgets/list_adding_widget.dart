import 'package:flutter/material.dart';
import 'package:myapp/db_function/db_functions.dart';
import 'package:myapp/model/model.dart';

class ListAdding extends StatefulWidget {
  const ListAdding({Key? key}) : super(key: key);

  @override
  _ListAddingState createState() => _ListAddingState();
}

class _ListAddingState extends State<ListAdding> {
  TextEditingController amountController= TextEditingController();
  TextEditingController descriptionController= TextEditingController();
  String selectedCategory = 'Income';

  @override
  Widget build(BuildContext context) {
    return Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: descriptionController,
                            decoration: InputDecoration(labelText: 'Description'),
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: amountController,
                            decoration: InputDecoration(labelText: 'Amount'),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 16.0),
                          DropdownButton<String>(
                            value: selectedCategory,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCategory = newValue!;
                              });
                            },
                            items: ['Income', 'Expense'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                                addDatas();
                              Navigator.pop(context);
                            },
                            child: Text('Add'),
                          ),
                        ],
                      ),
                    );
  }
  void addDatas() {
  final amount = amountController.text.trim();
  final description = descriptionController.text.trim();
  final category = selectedCategory;

  if (amount.isEmpty || description.isEmpty || category.isEmpty) {
    return;
  } else {
    final addedaitems = Model(
      amount: int.parse(amount),
      description: description,
      category: category,
    );
    addAmount(addedaitems);
    print('Data added successfully');
    print(addedaitems.amount);
    print(addedaitems.description);
    print(addedaitems.category);
    amountController.clear();
    descriptionController.clear();
  }
}

}