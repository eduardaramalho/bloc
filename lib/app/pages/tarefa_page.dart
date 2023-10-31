import 'package:bloc_study/app/data/blocs/tarefa_bloc.dart';
import 'package:bloc_study/app/data/blocs/tarefa_event.dart';
import 'package:bloc_study/app/data/blocs/tarefa_state.dart';
import 'package:bloc_study/app/data/models/tarefa_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  late final TarefaBloc _tarefaBloc;

  @override
  void initState() {
    super.initState();
    _tarefaBloc = TarefaBloc();
    _tarefaBloc.add(GetTarefas());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Pattern'),
      ),
      body: BlocBuilder<TarefaBloc, TarefaState>(
          bloc: _tarefaBloc,
          builder: (context, state) {
            if (state is TarefaLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TarefaLoadedState) {
              final list = state.tarefas;
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Center(
                          child: Text(list[index].nome[0]),
                        ),
                      ),
                      title: Text(list[index].nome),
                      trailing: IconButton(
                          onPressed: () {
                            _tarefaBloc.add(
                              DeleteTarefas(
                                tarefa: list[index],
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete_rounded,
                            color: Colors.red,
                          )),
                    );
                  });
            } else {
              return const Center(child: Text('Erro'));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _tarefaBloc.add(PostTarefas(tarefa: TarefaModel(nome: 'Tarefa')));
        }),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _tarefaBloc.close();
    super.dispose();
  }
}
