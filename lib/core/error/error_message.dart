import 'package:ecommers_app2/core/error/failure.dart';

const serverFailureMessage = 'Server Failure';
const cachedFailureMessage = 'Cache Failure';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureMessage;
    case CacheFailure:
      return cachedFailureMessage;
    default:
      return 'Unexpected Error';
  }
}
