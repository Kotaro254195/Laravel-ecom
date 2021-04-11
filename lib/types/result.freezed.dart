// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ResultTearOff {
  const _$ResultTearOff();

// ignore: unused_element
  ShopResult<T> shop<T>(T value) {
    return ShopResult<T>(
      value,
    );
  }

// ignore: unused_element
  TweetResult<T> tweet<T>(T value) {
    return TweetResult<T>(
      value,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Result = _$ResultTearOff();

/// @nodoc
mixin _$Result<T> {
  T get value;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult shop(T value),
    @required TResult tweet(T value),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult shop(T value),
    TResult tweet(T value),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult shop(ShopResult<T> value),
    @required TResult tweet(TweetResult<T> value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult shop(ShopResult<T> value),
    TResult tweet(TweetResult<T> value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $ResultCopyWith<T, Result<T>> get copyWith;
}

/// @nodoc
abstract class $ResultCopyWith<T, $Res> {
  factory $ResultCopyWith(Result<T> value, $Res Function(Result<T>) then) =
      _$ResultCopyWithImpl<T, $Res>;
  $Res call({T value});
}

/// @nodoc
class _$ResultCopyWithImpl<T, $Res> implements $ResultCopyWith<T, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<T> _value;
  // ignore: unused_field
  final $Res Function(Result<T>) _then;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed ? _value.value : value as T,
    ));
  }
}

/// @nodoc
abstract class $ShopResultCopyWith<T, $Res>
    implements $ResultCopyWith<T, $Res> {
  factory $ShopResultCopyWith(
          ShopResult<T> value, $Res Function(ShopResult<T>) then) =
      _$ShopResultCopyWithImpl<T, $Res>;
  @override
  $Res call({T value});
}

/// @nodoc
class _$ShopResultCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements $ShopResultCopyWith<T, $Res> {
  _$ShopResultCopyWithImpl(
      ShopResult<T> _value, $Res Function(ShopResult<T>) _then)
      : super(_value, (v) => _then(v as ShopResult<T>));

  @override
  ShopResult<T> get _value => super._value as ShopResult<T>;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(ShopResult<T>(
      value == freezed ? _value.value : value as T,
    ));
  }
}

/// @nodoc
class _$ShopResult<T> with DiagnosticableTreeMixin implements ShopResult<T> {
  const _$ShopResult(this.value) : assert(value != null);

  @override
  final T value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$T>.shop(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result<$T>.shop'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShopResult<T> &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $ShopResultCopyWith<T, ShopResult<T>> get copyWith =>
      _$ShopResultCopyWithImpl<T, ShopResult<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult shop(T value),
    @required TResult tweet(T value),
  }) {
    assert(shop != null);
    assert(tweet != null);
    return shop(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult shop(T value),
    TResult tweet(T value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (shop != null) {
      return shop(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult shop(ShopResult<T> value),
    @required TResult tweet(TweetResult<T> value),
  }) {
    assert(shop != null);
    assert(tweet != null);
    return shop(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult shop(ShopResult<T> value),
    TResult tweet(TweetResult<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (shop != null) {
      return shop(this);
    }
    return orElse();
  }
}

abstract class ShopResult<T> implements Result<T> {
  const factory ShopResult(T value) = _$ShopResult<T>;

  @override
  T get value;
  @override
  @JsonKey(ignore: true)
  $ShopResultCopyWith<T, ShopResult<T>> get copyWith;
}

/// @nodoc
abstract class $TweetResultCopyWith<T, $Res>
    implements $ResultCopyWith<T, $Res> {
  factory $TweetResultCopyWith(
          TweetResult<T> value, $Res Function(TweetResult<T>) then) =
      _$TweetResultCopyWithImpl<T, $Res>;
  @override
  $Res call({T value});
}

/// @nodoc
class _$TweetResultCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements $TweetResultCopyWith<T, $Res> {
  _$TweetResultCopyWithImpl(
      TweetResult<T> _value, $Res Function(TweetResult<T>) _then)
      : super(_value, (v) => _then(v as TweetResult<T>));

  @override
  TweetResult<T> get _value => super._value as TweetResult<T>;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(TweetResult<T>(
      value == freezed ? _value.value : value as T,
    ));
  }
}

/// @nodoc
class _$TweetResult<T> with DiagnosticableTreeMixin implements TweetResult<T> {
  const _$TweetResult(this.value) : assert(value != null);

  @override
  final T value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Result<$T>.tweet(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Result<$T>.tweet'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TweetResult<T> &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $TweetResultCopyWith<T, TweetResult<T>> get copyWith =>
      _$TweetResultCopyWithImpl<T, TweetResult<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult shop(T value),
    @required TResult tweet(T value),
  }) {
    assert(shop != null);
    assert(tweet != null);
    return tweet(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult shop(T value),
    TResult tweet(T value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (tweet != null) {
      return tweet(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult shop(ShopResult<T> value),
    @required TResult tweet(TweetResult<T> value),
  }) {
    assert(shop != null);
    assert(tweet != null);
    return tweet(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult shop(ShopResult<T> value),
    TResult tweet(TweetResult<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (tweet != null) {
      return tweet(this);
    }
    return orElse();
  }
}

abstract class TweetResult<T> implements Result<T> {
  const factory TweetResult(T value) = _$TweetResult<T>;

  @override
  T get value;
  @override
  @JsonKey(ignore: true)
  $TweetResultCopyWith<T, TweetResult<T>> get copyWith;
}
