import 'package:bloc_study/app/data/models/tarefa_model.dart';

class TarefasRepository{
   final List<TarefaModel> _tarefas = [];
   List<TarefaModel> get tarefas =>  _tarefas;

   Future<List<TarefaModel>> getTarefas() async{
    _tarefas.addAll([
      TarefaModel(nome: 'Estudar BLoC'),
      TarefaModel(nome: 'Estudar SQFLite')
    ]); 

    return Future.delayed(const Duration(seconds: 2), () => _tarefas);
   }

   Future<List<TarefaModel>> postTarefa({required TarefaModel tarefa}) async{
    _tarefas.add(tarefa);

    return Future.delayed(const Duration(seconds: 2), () => _tarefas );
   }

   Future<List<TarefaModel>> deleteTarefa ({required TarefaModel tarefa}) async{
    _tarefas.remove(tarefa);

    return Future.delayed(const Duration(seconds: 2), () => _tarefas );
   }
}