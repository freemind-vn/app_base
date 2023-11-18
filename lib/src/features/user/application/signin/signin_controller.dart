import 'package:app/core.dart';
import 'package:app/user.dart';

class SignInController extends Controller<AuthorizeEvent> {
  User? user;
  final formController = SigninFormController();
  final repository = SignInRepository();

  SignInController() {
    formController.on<SigninSubmitEvent>().listen((event) {
      login(event.username, event.password);
    });
  }

  login(String username, String password) {
    user = repository.signIn(username, password);
    if (user != null) {
      send(
        AuthorizeEvent(
          status: EventStatus.success,
          message: 'wellcome ${user!.username}',
        ),
      );
    }
  }

  @override
  void dispose() {
    formController.dispose();
    super.dispose();
  }
}
