import 'package:intl/intl.dart';

class FormatterHelper {
  static final _currencyFormatter =
      NumberFormat.currency(locale: 'pt_BR', symbol: r'R$');
  FormatterHelper._();

  static String formatCurrency(double value) {
    return _currencyFormatter.format(value);
  }
}
