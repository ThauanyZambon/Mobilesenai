import 'package:bibliotecaapp/models/book_model.dart';
import 'package:biblioteca_pp/models/user_model.dart';
import 'package:bibliotecaapp/services/api_service.dart';
import 'package:bibliotecaapp/services/api_service.dart';

class BookControler {
  //obs: não precisa instaciar obj de ApiService (métodos static)

  //métodos
  // GET dos Usuários
  Future<List<BookControler>> fetchAll() async{
    final list = await ApiService.getList("books?_sort=name"); //?_sort=name -> flag para organizar em order alfabetica
    //retorna a Lista de Usuário Convertidas para Book Model List<dynamic> => List<OBJ>
    return list.map<BookControler>((item)=>BookControler.fromMap(item)).toList();
  }

  // POST -> Criar novo usuário
  Future<BookControler> create(BookControler u) async{
    final created  = await ApiService.post("books", u.toMap());
    // adiciona um Usuário e Retorna o Usuário Criado -> ID
    return BookControler.fromMap(created);
  }

  // GET -> Buscar um Usuário
  Future<BookControler> fetchOne(String id) async{
    final book = await ApiService.getOne("books", id);
    // Retorna o Usuário Encontrado no Banco de Dados
    return BookControler.fromMap(book);
  }

  // PUT -> Atualizar Usuário
  Future<BookControler> update(BookControler u) async{
    final updated = await ApiService.put("books", u.toMap(), u.id!);
    //REtorna o Usuário Atualizado
    return BookControler.fromMap(updated);
  }

  Future<void> delete(String id) async{
    await ApiService.delete("Books", id);
    // Não há retorno, usuário deletado com sucesso
  }
  
  static  fromMap(created) async {}

}