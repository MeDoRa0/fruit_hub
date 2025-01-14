 abstract class Failuers {
 final String message;
  Failuers({required this.message});
}
class ServerFailuer extends Failuers {
  ServerFailuer( {required super.message});
}