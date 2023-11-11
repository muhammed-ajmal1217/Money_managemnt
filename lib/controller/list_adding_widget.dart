import 'package:flutter/material.dart';
import 'package:myapp/provider/list_adding_provider.dart';
import 'package:provider/provider.dart';

class ListAdding extends StatelessWidget {
  ListAdding({
    Key? key,
  }) : super(key: key);

  TextEditingController amountController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      hoverColor: Colors.yellow,
      focusColor: Colors.blue,
      backgroundColor: Colors.amber,
      shape: CircleBorder(),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      controller: amountController,
                      decoration: InputDecoration(
                        hintText: 'Amount',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Income / Expense',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Consumer<listAddingProvider>(
                          builder: (context, value, child) => DropdownButton(
                            value: value.dropdownValue,
                            items: value.items.map((String items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList(),
                            onChanged: (newValue) {
                              value.listAdding(newValue);
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), 
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 30), 
                        backgroundColor:
                            const Color.fromARGB(255, 5, 50, 87), 
                      ),
                      child: Text(
                        'Close',
                        style: TextStyle(
                            fontSize: 18), 
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
