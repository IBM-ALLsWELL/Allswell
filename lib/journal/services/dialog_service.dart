import 'dart:async';

class DialogService {
  Function _onShowListener;
  Completer _dialogCompleter;

  setOnshowListener(Function(DialogInfo) onShowListener) {
    _onShowListener = onShowListener;
  }

  showAlertDialog(String message, {bool barrierDismissible}) {
    _dialogCompleter = Completer<DialogAction>();
    _onShowListener(
        DialogInfo(message: message, barrierDismissible: barrierDismissible));
    return _dialogCompleter.future;
  }

  dialogComplete(DialogAction dialogAction) {
    _dialogCompleter.complete(dialogAction);
    _dialogCompleter = null;
  }
}
