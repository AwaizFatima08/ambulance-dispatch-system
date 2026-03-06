import '../models/dispatch.dart';

class DispatchService {

  static final DispatchService _instance = DispatchService._internal();

  factory DispatchService() {
    return _instance;
  }

  DispatchService._internal();

  final List<Dispatch> _dispatchList = [];

  List<Dispatch> get dispatches => _dispatchList;

  void addDispatch(Dispatch dispatch) {
    _dispatchList.insert(0, dispatch);
  }
}
