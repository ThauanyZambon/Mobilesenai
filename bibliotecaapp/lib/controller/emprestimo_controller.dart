import 'package:bibliotecaapp/controller/emprestimo_controller.dart';
import 'package:bibliotecaapp/models/emprestimo.dart';
import 'package:bibliotecaapp/services/api_service.dart';

class EmprestimoController {
  //métodos
  //Get do Empréstimo
  Future<List<EmprestimoController>> fetchAll() async {
    final list = await ApiService.getList("emprestimos?_sort=data_emprestimo");
    return list.map((item) => EmprestimoController.fromJson(item)).toList();
  }

  // Get de um único Empréstimo
  Future<EmprestimoController> fetchOne(String id) async {
    final emprestimo = await ApiService.getOne("emprestimos", id);
    return emprestimo.fromJson(emprestimo);
  }

  //Post -> Criar um novo Empréstimo
  Future<EmprestimoController> create(EmprestimoController emprestimo) async {
    final created = await ApiService.post("emprestimos", emprestimo.toJson());
    return emprestimo.FromJson(created);
  }

  //Put -> Alterar um Empréstimo
  Future<EmprestimoController> update(EmprestimoController emprestimo) async {
    final updated = await ApiService.put(
      "emprestimos",
      emprestimo.toJson(),
      emprestimo.id!,
    );
    return emprestimo.FromJson(updated);
  }

  //Delete -> Deletar um Empréstimo
  Future<void> delete(String id) async {
    await ApiService.delete("emprestimo", id);
  }
}

extension on Map<String, dynamic> {
  Future<EmprestimoController> fromJson(Map<String, dynamic> emprestimo) {}
}

mixin   EmprestimoFromJson {
  fromJson(Map<String, dynamic> map) {}
}

class FromJson {
}
