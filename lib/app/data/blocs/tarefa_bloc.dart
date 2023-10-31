import 'package:bloc/bloc.dart';
import 'package:bloc_study/app/data/blocs/tarefa_event.dart';
import 'package:bloc_study/app/data/blocs/tarefa_state.dart';
import 'package:bloc_study/app/data/models/tarefa_model.dart';
import 'package:bloc_study/app/data/repositories/tarefa_repository.dart';

class TarefaBloc extends Bloc<TarefaEvent, TarefaState> {
  final _repository = TarefasRepository();

  TarefaBloc() : super(TarefaInitialState()) {
    on(_mapEventToState);
  }

  void _mapEventToState(TarefaEvent event, Emitter emit) async {
    List<TarefaModel> tarefas = [];

    emit(TarefaLoadingState());

    if (event is GetTarefas) {
      tarefas = await _repository.getTarefas();
    } else if (event is PostTarefas) {
      tarefas = await _repository.postTarefa(tarefa: event.tarefa);
    } else if (event is DeleteTarefas) {
      tarefas = await _repository.deleteTarefa(tarefa: event.tarefa);
    }

    emit(TarefaLoadedState(tarefas: tarefas));
  }
}
