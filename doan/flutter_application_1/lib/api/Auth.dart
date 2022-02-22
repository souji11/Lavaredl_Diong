import '../Models/user.dart';
import '../Models/order.dart';
import '../Models/order_details.dart';

class Auth {
  static User user = User.empty();
  static Order order = Order.empty();
  static OrderDetails orderDetails = OrderDetails.empty();
}
