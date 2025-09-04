import 'package:bibliotecaapp/models/user_model.dart';
import 'package:bibliotecaapp/services/api_service.dart';

class UserController {
  // GET -> Buscar todos os usuários
  Future<List<UserController>> fetchAll() async {
    final list = await ApiService.getList("users?_sort=name");
    // Retorna a lista convertida para objetos UserModel
    return list.map<UserController>((item) => UserController.fromJson(item)).toList();
  }

  // POST -> Criar novo usuário
  Future<UserController> create(UserController u) async {
    final created = await ApiService.post("users", UserController.fromJson());
    // Retorna o usuário criado com ID
    return UserController.fromJson(created);
  }

  // GET -> Buscar um usuário pelo ID
  Future<UserController> fetchOne(String id) async {
    final user = await ApiService.getOne("users", id);
    // Retorna o usuário encontrado
    return UserController.fromJson(user);
  }

  // PUT -> Atualizar usuário
  Future<UserController> update(UserController u) async {
    final updated = await ApiService.put("users", u.toJson(), u.id!);
    // Retorna o usuário atualizado
    return UserController.fromJson(updated);
  }

  // DELETE -> Deletar usuário
  Future<void> delete(String id) async {
    await ApiService.delete("users", id);
    // Não há retorno; usuário deletado com sucesso
  }
  
  static fromJson(Map<String, dynamic> updated) async {}
  
  Map<String, dynamic> toJson() {
    throw UnimplementedError('toJson() has not been implemented.');
  }
}
