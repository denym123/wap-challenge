import '../../../core/core.dart';
import '../../home/home.dart';

class HomeRepository extends RepositoryLifeCycle {
  Future<List<Task>> getTasks() async {
    final response = await httpAdapter.get('/tasks');
    return List<Task>.from(response.data.map((e) => Task.fromJson(e)));
  }

  Future<User> getUser() async {
    final response = await httpAdapter.get('/me');
    return User.fromJson(response.data);
  }
}
