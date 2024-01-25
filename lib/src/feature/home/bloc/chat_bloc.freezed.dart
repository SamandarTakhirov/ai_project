// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) send,
    required TResult Function() rest,
    required TResult Function() stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? send,
    TResult? Function()? rest,
    TResult? Function()? stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? send,
    TResult Function()? rest,
    TResult Function()? stop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendEvent value) send,
    required TResult Function(_RestartEvent value) rest,
    required TResult Function(_StopEvent value) stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendEvent value)? send,
    TResult? Function(_RestartEvent value)? rest,
    TResult? Function(_StopEvent value)? stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendEvent value)? send,
    TResult Function(_RestartEvent value)? rest,
    TResult Function(_StopEvent value)? stop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SendEventImplCopyWith<$Res> {
  factory _$$SendEventImplCopyWith(
          _$SendEventImpl value, $Res Function(_$SendEventImpl) then) =
      __$$SendEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$SendEventImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$SendEventImpl>
    implements _$$SendEventImplCopyWith<$Res> {
  __$$SendEventImplCopyWithImpl(
      _$SendEventImpl _value, $Res Function(_$SendEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$SendEventImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendEventImpl implements _SendEvent {
  const _$SendEventImpl({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'ChatEvent.send(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEventImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendEventImplCopyWith<_$SendEventImpl> get copyWith =>
      __$$SendEventImplCopyWithImpl<_$SendEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) send,
    required TResult Function() rest,
    required TResult Function() stop,
  }) {
    return send(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? send,
    TResult? Function()? rest,
    TResult? Function()? stop,
  }) {
    return send?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? send,
    TResult Function()? rest,
    TResult Function()? stop,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendEvent value) send,
    required TResult Function(_RestartEvent value) rest,
    required TResult Function(_StopEvent value) stop,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendEvent value)? send,
    TResult? Function(_RestartEvent value)? rest,
    TResult? Function(_StopEvent value)? stop,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendEvent value)? send,
    TResult Function(_RestartEvent value)? rest,
    TResult Function(_StopEvent value)? stop,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _SendEvent implements ChatEvent {
  const factory _SendEvent({required final String text}) = _$SendEventImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$SendEventImplCopyWith<_$SendEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RestartEventImplCopyWith<$Res> {
  factory _$$RestartEventImplCopyWith(
          _$RestartEventImpl value, $Res Function(_$RestartEventImpl) then) =
      __$$RestartEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestartEventImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$RestartEventImpl>
    implements _$$RestartEventImplCopyWith<$Res> {
  __$$RestartEventImplCopyWithImpl(
      _$RestartEventImpl _value, $Res Function(_$RestartEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RestartEventImpl implements _RestartEvent {
  const _$RestartEventImpl();

  @override
  String toString() {
    return 'ChatEvent.rest()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RestartEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) send,
    required TResult Function() rest,
    required TResult Function() stop,
  }) {
    return rest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? send,
    TResult? Function()? rest,
    TResult? Function()? stop,
  }) {
    return rest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? send,
    TResult Function()? rest,
    TResult Function()? stop,
    required TResult orElse(),
  }) {
    if (rest != null) {
      return rest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendEvent value) send,
    required TResult Function(_RestartEvent value) rest,
    required TResult Function(_StopEvent value) stop,
  }) {
    return rest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendEvent value)? send,
    TResult? Function(_RestartEvent value)? rest,
    TResult? Function(_StopEvent value)? stop,
  }) {
    return rest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendEvent value)? send,
    TResult Function(_RestartEvent value)? rest,
    TResult Function(_StopEvent value)? stop,
    required TResult orElse(),
  }) {
    if (rest != null) {
      return rest(this);
    }
    return orElse();
  }
}

abstract class _RestartEvent implements ChatEvent {
  const factory _RestartEvent() = _$RestartEventImpl;
}

/// @nodoc
abstract class _$$StopEventImplCopyWith<$Res> {
  factory _$$StopEventImplCopyWith(
          _$StopEventImpl value, $Res Function(_$StopEventImpl) then) =
      __$$StopEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopEventImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$StopEventImpl>
    implements _$$StopEventImplCopyWith<$Res> {
  __$$StopEventImplCopyWithImpl(
      _$StopEventImpl _value, $Res Function(_$StopEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StopEventImpl implements _StopEvent {
  const _$StopEventImpl();

  @override
  String toString() {
    return 'ChatEvent.stop()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) send,
    required TResult Function() rest,
    required TResult Function() stop,
  }) {
    return stop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? send,
    TResult? Function()? rest,
    TResult? Function()? stop,
  }) {
    return stop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? send,
    TResult Function()? rest,
    TResult Function()? stop,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendEvent value) send,
    required TResult Function(_RestartEvent value) rest,
    required TResult Function(_StopEvent value) stop,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendEvent value)? send,
    TResult? Function(_RestartEvent value)? rest,
    TResult? Function(_StopEvent value)? stop,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendEvent value)? send,
    TResult Function(_RestartEvent value)? rest,
    TResult Function(_StopEvent value)? stop,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class _StopEvent implements ChatEvent {
  const factory _StopEvent() = _$StopEventImpl;
}

/// @nodoc
mixin _$ChatState {
  List<Content> get contents => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call({List<Content> contents, bool isLoading, String? error});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<Content>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
          _$ChatStateImpl value, $Res Function(_$ChatStateImpl) then) =
      __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Content> contents, bool isLoading, String? error});
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
      _$ChatStateImpl _value, $Res Function(_$ChatStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$ChatStateImpl(
      contents: null == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<Content>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl(
      {final List<Content> contents = const [],
      this.isLoading = false,
      this.error = null})
      : _contents = contents;

  final List<Content> _contents;
  @override
  @JsonKey()
  List<Content> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? error;

  @override
  String toString() {
    return 'ChatState(contents: $contents, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_contents), isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {final List<Content> contents,
      final bool isLoading,
      final String? error}) = _$ChatStateImpl;

  @override
  List<Content> get contents;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
