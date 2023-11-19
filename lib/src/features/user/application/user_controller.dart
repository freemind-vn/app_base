import 'package:app/core.dart';
import 'package:app/user.dart';

class UserController extends Controller<User> {
  User? user;

  UserController() {
    Controller.onNew<SignInController>(
      (controller) => controller.byStatus(EventStatus.success).listen(
        (event) {
          user = event.user;
          send(user!);
        },
      ),
    );
  }
}
