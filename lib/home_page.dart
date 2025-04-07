import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controllerTarefa = TextEditingController();
  final List<String> _tarefas = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void _addTarefa() {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _tarefas.add(_controllerTarefa.text);
          _controllerTarefa.clear();
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Lista', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _formKey,
              child: TextFormField(
                controller: _controllerTarefa,
                decoration: InputDecoration(
                  labelText: 'Digite uma tarefa',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Preencha o campo corretamente';
                  }
                  if (value.length < 3) {
                    return 'Digite ao menos 3 caracteres';
                  }
                  return null;
                },
              ),
            ),
          ),
          ElevatedButton(onPressed: _addTarefa, child: Text('Cadastrar')),
          Expanded(
            child: ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/9709/9709605.png',
                  ),
                  title: Text(
                    _tarefas[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Mais informações'),
                  trailing: Icon(Icons.more),
                  dense: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
