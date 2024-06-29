// Mocks generated by Mockito 5.4.4 from annotations
// in poorlex/test/battle/battles_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i3;
import 'package:get/get.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;
import 'package:poorlex/controller/image_picker.dart' as _i11;
import 'package:poorlex/enums/day_of_week.dart' as _i13;
import 'package:poorlex/provider/battles_provider.dart' as _i4;
import 'package:poorlex/schema/battle_expenditure_response/battle_expenditure_response.dart'
    as _i12;
import 'package:poorlex/schema/battle_notification_response/battle_notification_response.dart'
    as _i15;
import 'package:poorlex/schema/battle_response/battle_response.dart' as _i8;
import 'package:poorlex/schema/error_response/error_response.dart' as _i16;
import 'package:poorlex/schema/finding_battle_response/finding_battle_response.dart'
    as _i7;
import 'package:poorlex/schema/member_complete_battle_response/member_complete_battle_response.dart'
    as _i10;
import 'package:poorlex/schema/member_progress_battle_response/member_progress_battle_response.dart'
    as _i9;
import 'package:poorlex/schema/participant_ranking_response/participant_ranking_response.dart'
    as _i17;
import 'package:poorlex/schema/vote_response/vote_response.dart' as _i14;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDuration_0 extends _i1.SmartFake implements Duration {
  _FakeDuration_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetHttpClient_1 extends _i1.SmartFake implements _i2.GetHttpClient {
  _FakeGetHttpClient_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInternalFinalCallback_2<T> extends _i1.SmartFake
    implements _i2.InternalFinalCallback<T> {
  _FakeInternalFinalCallback_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_3<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4<T1> extends _i1.SmartFake implements _i2.Response<T1> {
  _FakeResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetSocket_5 extends _i1.SmartFake implements _i2.GetSocket {
  _FakeGetSocket_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGraphQLResponse_6<T1> extends _i1.SmartFake
    implements _i2.GraphQLResponse<T1> {
  _FakeGraphQLResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [BattlesProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockBattlesProvider extends _i1.Mock implements _i4.BattlesProvider {
  MockBattlesProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get allowAutoSignedCert => (super.noSuchMethod(
        Invocation.getter(#allowAutoSignedCert),
        returnValue: false,
      ) as bool);

  @override
  set allowAutoSignedCert(bool? _allowAutoSignedCert) => super.noSuchMethod(
        Invocation.setter(
          #allowAutoSignedCert,
          _allowAutoSignedCert,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get userAgent => (super.noSuchMethod(
        Invocation.getter(#userAgent),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#userAgent),
        ),
      ) as String);

  @override
  set userAgent(String? _userAgent) => super.noSuchMethod(
        Invocation.setter(
          #userAgent,
          _userAgent,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get sendUserAgent => (super.noSuchMethod(
        Invocation.getter(#sendUserAgent),
        returnValue: false,
      ) as bool);

  @override
  set sendUserAgent(bool? _sendUserAgent) => super.noSuchMethod(
        Invocation.setter(
          #sendUserAgent,
          _sendUserAgent,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set baseUrl(String? _baseUrl) => super.noSuchMethod(
        Invocation.setter(
          #baseUrl,
          _baseUrl,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get defaultContentType => (super.noSuchMethod(
        Invocation.getter(#defaultContentType),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#defaultContentType),
        ),
      ) as String);

  @override
  set defaultContentType(String? _defaultContentType) => super.noSuchMethod(
        Invocation.setter(
          #defaultContentType,
          _defaultContentType,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get followRedirects => (super.noSuchMethod(
        Invocation.getter(#followRedirects),
        returnValue: false,
      ) as bool);

  @override
  set followRedirects(bool? _followRedirects) => super.noSuchMethod(
        Invocation.setter(
          #followRedirects,
          _followRedirects,
        ),
        returnValueForMissingStub: null,
      );

  @override
  int get maxRedirects => (super.noSuchMethod(
        Invocation.getter(#maxRedirects),
        returnValue: 0,
      ) as int);

  @override
  set maxRedirects(int? _maxRedirects) => super.noSuchMethod(
        Invocation.setter(
          #maxRedirects,
          _maxRedirects,
        ),
        returnValueForMissingStub: null,
      );

  @override
  int get maxAuthRetries => (super.noSuchMethod(
        Invocation.getter(#maxAuthRetries),
        returnValue: 0,
      ) as int);

  @override
  set maxAuthRetries(int? _maxAuthRetries) => super.noSuchMethod(
        Invocation.setter(
          #maxAuthRetries,
          _maxAuthRetries,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set defaultDecoder(_i2.Decoder<dynamic>? _defaultDecoder) =>
      super.noSuchMethod(
        Invocation.setter(
          #defaultDecoder,
          _defaultDecoder,
        ),
        returnValueForMissingStub: null,
      );

  @override
  Duration get timeout => (super.noSuchMethod(
        Invocation.getter(#timeout),
        returnValue: _FakeDuration_0(
          this,
          Invocation.getter(#timeout),
        ),
      ) as Duration);

  @override
  set timeout(Duration? _timeout) => super.noSuchMethod(
        Invocation.setter(
          #timeout,
          _timeout,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set trustedCertificates(List<_i2.TrustedCertificate>? _trustedCertificates) =>
      super.noSuchMethod(
        Invocation.setter(
          #trustedCertificates,
          _trustedCertificates,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set findProxy(String Function(Uri)? _findProxy) => super.noSuchMethod(
        Invocation.setter(
          #findProxy,
          _findProxy,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get withCredentials => (super.noSuchMethod(
        Invocation.getter(#withCredentials),
        returnValue: false,
      ) as bool);

  @override
  set withCredentials(bool? _withCredentials) => super.noSuchMethod(
        Invocation.setter(
          #withCredentials,
          _withCredentials,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i2.GetSocket> get sockets => (super.noSuchMethod(
        Invocation.getter(#sockets),
        returnValue: <_i2.GetSocket>[],
      ) as List<_i2.GetSocket>);

  @override
  _i2.GetHttpClient get httpClient => (super.noSuchMethod(
        Invocation.getter(#httpClient),
        returnValue: _FakeGetHttpClient_1(
          this,
          Invocation.getter(#httpClient),
        ),
      ) as _i2.GetHttpClient);

  @override
  bool get isDisposed => (super.noSuchMethod(
        Invocation.getter(#isDisposed),
        returnValue: false,
      ) as bool);

  @override
  set sockets(List<_i2.GetSocket>? _sockets) => super.noSuchMethod(
        Invocation.setter(
          #sockets,
          _sockets,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.InternalFinalCallback<void> get onStart => (super.noSuchMethod(
        Invocation.getter(#onStart),
        returnValue: _FakeInternalFinalCallback_2<void>(
          this,
          Invocation.getter(#onStart),
        ),
      ) as _i2.InternalFinalCallback<void>);

  @override
  _i2.InternalFinalCallback<void> get onDelete => (super.noSuchMethod(
        Invocation.getter(#onDelete),
        returnValue: _FakeInternalFinalCallback_2<void>(
          this,
          Invocation.getter(#onDelete),
        ),
      ) as _i2.InternalFinalCallback<void>);

  @override
  bool get initialized => (super.noSuchMethod(
        Invocation.getter(#initialized),
        returnValue: false,
      ) as bool);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void onInit() => super.noSuchMethod(
        Invocation.method(
          #onInit,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<List<_i7.FindingBattleResponse>> getAll(
          {required List<_i4.BattleStatus>? status}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
          {#status: status},
        ),
        returnValue: _i6.Future<List<_i7.FindingBattleResponse>>.value(
            <_i7.FindingBattleResponse>[]),
      ) as _i6.Future<List<_i7.FindingBattleResponse>>);

  @override
  _i6.Future<_i8.BattleResponse?> getDetailById({required int? battleId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetailById,
          [],
          {#battleId: battleId},
        ),
        returnValue: _i6.Future<_i8.BattleResponse?>.value(),
      ) as _i6.Future<_i8.BattleResponse?>);

  @override
  _i6.Future<List<_i9.MemberProgressBattleResponse>?> getProgress() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProgress,
          [],
        ),
        returnValue:
            _i6.Future<List<_i9.MemberProgressBattleResponse>?>.value(),
      ) as _i6.Future<List<_i9.MemberProgressBattleResponse>?>);

  @override
  _i6.Future<List<_i10.MemberCompleteBattleResponse>?> getComplete() =>
      (super.noSuchMethod(
        Invocation.method(
          #getComplete,
          [],
        ),
        returnValue:
            _i6.Future<List<_i10.MemberCompleteBattleResponse>?>.value(),
      ) as _i6.Future<List<_i10.MemberCompleteBattleResponse>?>);

  @override
  _i6.Future<bool> createBattles({
    required String? name,
    required String? introduction,
    required int? budget,
    required int? maxParticipantSize,
    required _i11.FileWithName? image,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createBattles,
          [],
          {
            #name: name,
            #introduction: introduction,
            #budget: budget,
            #maxParticipantSize: maxParticipantSize,
            #image: image,
          },
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<List<_i12.BattleExpenditureResponse>?> getExpenditures({
    required int? battleId,
    required _i13.DayOfWeek? dayOfWeek,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getExpenditures,
          [],
          {
            #battleId: battleId,
            #dayOfWeek: dayOfWeek,
          },
        ),
        returnValue: _i6.Future<List<_i12.BattleExpenditureResponse>?>.value(),
      ) as _i6.Future<List<_i12.BattleExpenditureResponse>?>);

  @override
  _i6.Future<List<_i12.BattleExpenditureResponse>?> getMemberExpenditures(
          {required int? battleId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMemberExpenditures,
          [],
          {#battleId: battleId},
        ),
        returnValue: _i6.Future<List<_i12.BattleExpenditureResponse>?>.value(),
      ) as _i6.Future<List<_i12.BattleExpenditureResponse>?>);

  @override
  _i6.Future<List<_i14.VoteResponse>?> getBattlesAlarms({
    required int? battleId,
    required DateTime? dateTime,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBattlesAlarms,
          [],
          {
            #battleId: battleId,
            #dateTime: dateTime,
          },
        ),
        returnValue: _i6.Future<List<_i14.VoteResponse>?>.value(),
      ) as _i6.Future<List<_i14.VoteResponse>?>);

  @override
  _i6.Future<int?> getUncheckedBattlesAlarms({required int? battleId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUncheckedBattlesAlarms,
          [],
          {#battleId: battleId},
        ),
        returnValue: _i6.Future<int?>.value(),
      ) as _i6.Future<int?>);

  @override
  _i6.Future<_i15.BattleNotificationResponse?> getBattleNotification(
          {required int? battleId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBattleNotification,
          [],
          {#battleId: battleId},
        ),
        returnValue: _i6.Future<_i15.BattleNotificationResponse?>.value(),
      ) as _i6.Future<_i15.BattleNotificationResponse?>);

  @override
  _i6.Future<bool> createBattleNotification({
    required int? battleId,
    required int? memberId,
    required String? content,
    required String? imageUrl,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createBattleNotification,
          [],
          {
            #battleId: battleId,
            #memberId: memberId,
            #content: content,
            #imageUrl: imageUrl,
          },
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<bool> patchBattleNotification({
    required int? battleId,
    required String? content,
    required String? imageUrl,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patchBattleNotification,
          [],
          {
            #battleId: battleId,
            #content: content,
            #imageUrl: imageUrl,
          },
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<_i3.Either<_i16.ErrorResponse, bool>> addParticipants(
          {required int? battleId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #addParticipants,
          [],
          {#battleId: battleId},
        ),
        returnValue: _i6.Future<_i3.Either<_i16.ErrorResponse, bool>>.value(
            _FakeEither_3<_i16.ErrorResponse, bool>(
          this,
          Invocation.method(
            #addParticipants,
            [],
            {#battleId: battleId},
          ),
        )),
      ) as _i6.Future<_i3.Either<_i16.ErrorResponse, bool>>);

  @override
  _i6.Future<_i3.Either<_i16.ErrorResponse, bool>> deleteParticipants(
          {required int? battleId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteParticipants,
          [],
          {#battleId: battleId},
        ),
        returnValue: _i6.Future<_i3.Either<_i16.ErrorResponse, bool>>.value(
            _FakeEither_3<_i16.ErrorResponse, bool>(
          this,
          Invocation.method(
            #deleteParticipants,
            [],
            {#battleId: battleId},
          ),
        )),
      ) as _i6.Future<_i3.Either<_i16.ErrorResponse, bool>>);

  @override
  _i6.Future<void> deleteBattle({required int? battleId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteBattle,
          [],
          {#battleId: battleId},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> patchBattle({
    required int? battleId,
    String? name,
    String? introduction,
    _i11.FileWithName? image,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patchBattle,
          [],
          {
            #battleId: battleId,
            #name: name,
            #introduction: introduction,
            #image: image,
          },
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<List<_i17.ParticipantRankingResponse>> getBattleRankings(
          {required int? battleId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBattleRankings,
          [],
          {#battleId: battleId},
        ),
        returnValue: _i6.Future<List<_i17.ParticipantRankingResponse>>.value(
            <_i17.ParticipantRankingResponse>[]),
      ) as _i6.Future<List<_i17.ParticipantRankingResponse>>);

  @override
  _i6.Future<_i2.Response<T>> get<T>(
    String? url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    _i2.Decoder<T>? decoder,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {
            #headers: headers,
            #contentType: contentType,
            #query: query,
            #decoder: decoder,
          },
        ),
        returnValue: _i6.Future<_i2.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #get,
            [url],
            {
              #headers: headers,
              #contentType: contentType,
              #query: query,
              #decoder: decoder,
            },
          ),
        )),
      ) as _i6.Future<_i2.Response<T>>);

  @override
  _i6.Future<_i2.Response<T>> post<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    _i2.Decoder<T>? decoder,
    _i2.Progress? uploadProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [
            url,
            body,
          ],
          {
            #contentType: contentType,
            #headers: headers,
            #query: query,
            #decoder: decoder,
            #uploadProgress: uploadProgress,
          },
        ),
        returnValue: _i6.Future<_i2.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #post,
            [
              url,
              body,
            ],
            {
              #contentType: contentType,
              #headers: headers,
              #query: query,
              #decoder: decoder,
              #uploadProgress: uploadProgress,
            },
          ),
        )),
      ) as _i6.Future<_i2.Response<T>>);

  @override
  _i6.Future<_i2.Response<T>> put<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    _i2.Decoder<T>? decoder,
    _i2.Progress? uploadProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [
            url,
            body,
          ],
          {
            #contentType: contentType,
            #headers: headers,
            #query: query,
            #decoder: decoder,
            #uploadProgress: uploadProgress,
          },
        ),
        returnValue: _i6.Future<_i2.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #put,
            [
              url,
              body,
            ],
            {
              #contentType: contentType,
              #headers: headers,
              #query: query,
              #decoder: decoder,
              #uploadProgress: uploadProgress,
            },
          ),
        )),
      ) as _i6.Future<_i2.Response<T>>);

  @override
  _i6.Future<_i2.Response<T>> patch<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    _i2.Decoder<T>? decoder,
    _i2.Progress? uploadProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [
            url,
            body,
          ],
          {
            #contentType: contentType,
            #headers: headers,
            #query: query,
            #decoder: decoder,
            #uploadProgress: uploadProgress,
          },
        ),
        returnValue: _i6.Future<_i2.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #patch,
            [
              url,
              body,
            ],
            {
              #contentType: contentType,
              #headers: headers,
              #query: query,
              #decoder: decoder,
              #uploadProgress: uploadProgress,
            },
          ),
        )),
      ) as _i6.Future<_i2.Response<T>>);

  @override
  _i6.Future<_i2.Response<T>> request<T>(
    String? url,
    String? method, {
    dynamic body,
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    _i2.Decoder<T>? decoder,
    _i2.Progress? uploadProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #request,
          [
            url,
            method,
          ],
          {
            #body: body,
            #contentType: contentType,
            #headers: headers,
            #query: query,
            #decoder: decoder,
            #uploadProgress: uploadProgress,
          },
        ),
        returnValue: _i6.Future<_i2.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #request,
            [
              url,
              method,
            ],
            {
              #body: body,
              #contentType: contentType,
              #headers: headers,
              #query: query,
              #decoder: decoder,
              #uploadProgress: uploadProgress,
            },
          ),
        )),
      ) as _i6.Future<_i2.Response<T>>);

  @override
  _i6.Future<_i2.Response<T>> delete<T>(
    String? url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    _i2.Decoder<T>? decoder,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #contentType: contentType,
            #query: query,
            #decoder: decoder,
          },
        ),
        returnValue: _i6.Future<_i2.Response<T>>.value(_FakeResponse_4<T>(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #contentType: contentType,
              #query: query,
              #decoder: decoder,
            },
          ),
        )),
      ) as _i6.Future<_i2.Response<T>>);

  @override
  _i2.GetSocket socket(
    String? url, {
    Duration? ping = const Duration(seconds: 5),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #socket,
          [url],
          {#ping: ping},
        ),
        returnValue: _FakeGetSocket_5(
          this,
          Invocation.method(
            #socket,
            [url],
            {#ping: ping},
          ),
        ),
      ) as _i2.GetSocket);

  @override
  _i6.Future<_i2.GraphQLResponse<T>> query<T>(
    String? query, {
    String? url,
    Map<String, dynamic>? variables,
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #query,
          [query],
          {
            #url: url,
            #variables: variables,
            #headers: headers,
          },
        ),
        returnValue:
            _i6.Future<_i2.GraphQLResponse<T>>.value(_FakeGraphQLResponse_6<T>(
          this,
          Invocation.method(
            #query,
            [query],
            {
              #url: url,
              #variables: variables,
              #headers: headers,
            },
          ),
        )),
      ) as _i6.Future<_i2.GraphQLResponse<T>>);

  @override
  _i6.Future<_i2.GraphQLResponse<T>> mutation<T>(
    String? mutation, {
    String? url,
    Map<String, dynamic>? variables,
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #mutation,
          [mutation],
          {
            #url: url,
            #variables: variables,
            #headers: headers,
          },
        ),
        returnValue:
            _i6.Future<_i2.GraphQLResponse<T>>.value(_FakeGraphQLResponse_6<T>(
          this,
          Invocation.method(
            #mutation,
            [mutation],
            {
              #url: url,
              #variables: variables,
              #headers: headers,
            },
          ),
        )),
      ) as _i6.Future<_i2.GraphQLResponse<T>>);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onReady() => super.noSuchMethod(
        Invocation.method(
          #onReady,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onClose() => super.noSuchMethod(
        Invocation.method(
          #onClose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void $configureLifeCycle() => super.noSuchMethod(
        Invocation.method(
          #$configureLifeCycle,
          [],
        ),
        returnValueForMissingStub: null,
      );
}