import 'package:app/core.dart';
import 'package:app/user.dart';

class SignInController extends Controller<AuthorizeEvent> {
  final formController = SigninFormController();
  final repository = SignInRepository();

  SignInController() {
    formController.on<SigninSubmitEvent>().listen((event) {
      login(event.username, event.password);
    });
  }

  login(String username, String password) {
    final user = repository.signIn(username, password);
    send(
      AuthorizeEvent(
        status: EventStatus.success,
        message: 'wellcome ${user.username}',
        user: user,
      ),
    );
  }

  @override
  void dispose() {
    formController.dispose();
    super.dispose();
  }
}
