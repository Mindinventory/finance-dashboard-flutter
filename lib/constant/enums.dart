String enumToString(Object o) => o.toString().split('.').last;

T? enumFromString<T>(String key, List<T?> values) =>
    values.firstWhere((v) => key == enumToString(v!), orElse: () => null);

/// Example :
///FieldError fieldError = enumFromString<FieldError>('Empty',FieldError.Empty);


enum FieldError {
  Empty, Invalid, NotMatch, InvalidMinute, InvalidSecond
}