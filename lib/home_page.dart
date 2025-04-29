import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarTarefas();
  }

  void _addTarefa() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _tarefas.add(_controllerTarefa.text);
        _controllerTarefa.clear();
        _salvarTarefas();
      });
    }
  }

  void _carregarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tarefaJson = prefs.getString('tarefas');

    if (tarefaJson != null) {
      setState(() {
        _tarefas.addAll(List<String>.from(jsonDecode(tarefaJson)));
      });
    }
  }

  void _salvarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tarefaJson = json.encode(_tarefas);
    await prefs.setString('tarefas', tarefaJson);
  }

  void _removerTarefa(int index) {
    setState(() {
      _tarefas.removeAt(index);
      _salvarTarefas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tarefas', style: TextStyle(color: Colors.white)),
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
          InkWell(
            onTap: _addTarefa,
            child: Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              width: double.infinity,
              height: 30,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Cadastrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
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
                  subtitle: Text('Clique na lixeira para remover'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removerTarefa(index),
                  ),
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
