import 'package:app/core.dart';
import 'package:app/user.dart';

class UserController extends Controller<User> {
  User? user;

  UserController() {
    Controller.onNew<SignInController>(
      (controller) => controller.listen(
        (event) {
          if (event.status == EventStatus.success) {
            user = event.user;
            send(user!);
          }
        },
      ),
    );
  }
}
