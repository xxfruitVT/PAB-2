import 'package:flutter/material.dart';
import '../services/shopping_service.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final ShoppingService _service = ShoppingService();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Belanja')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Item belanja',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _service.addItem(_controller.text);
                      _controller.clear();
                    }
                  },
                  child: const Text('Tambah'),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _service.getItems(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    (snapshot.data! as dynamic).snapshot.value != null) {
                  Map data = (snapshot.data! as dynamic).snapshot.value;
                  List items = data.entries.toList();

                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      var item = items[index];
                      return ListTile(
                        title: Text(item.value['name']),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _service.deleteItem(item.key),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("Belum ada item."));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
