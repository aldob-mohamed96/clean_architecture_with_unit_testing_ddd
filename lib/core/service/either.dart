import 'package:functional/core/export/export.dart';

abstract class Either<L, R> extends Equatable {
  const Either();
}

final class Left<L, R> extends Either<L, R> {
  final L value;
  const Left(this.value);

  @override
  List<Object?> get props => [value];
}

final class Right<L, R> extends Either<L, R> {
  final R value;
  const Right(this.value);

  @override
  List<Object?> get props => [value];
}

final class Unit {
  const Unit._();
}



final class NoParam {
  const NoParam._();
}


final class NoData extends Equatable {
  const NoData._();

  @override
  List<Object?> get props => [];
}



final class SuccessOperation extends Equatable {
  final bool value;
  const SuccessOperation(this.value);

  @override
  List<Object?> get props => [value];
}



extension EitherUnitExtension<L, R> on Either<L, R> {
  Either<L, Unit> get toUnit => fold((l) => Left(l), (_) => const Right(unit));
}


extension EitherExtension<L, R> on Either<L, R> {
  R? get right => this is Right<L, R> ? (this as Right<L, R>).value : null;
  L? get left => this is Left<L, R> ? (this as Left<L, R>).value : null;
  // fold 
  T fold<T>(T Function(L) left, T Function(R) right) {
    if (this is Left<L, R>) {
      return left((this as Left<L, R>).value);
    } else {
      return right((this as Right<L, R>).value);
    }
  }

   //isRight
  bool get isRight => this is Right<L, R>;

  //isLeft
  bool get isLeft => this is Left<L, R>;


  Either<L, R> operator |(Either<L, R> Function() other) {
    if (this is Left<L, R>) {
      return other();
    } else {
      return this;
    }
  }

  Either<L, R> operator &(Either<L, R> Function() other) {
    if (this is Right<L, R>) {
      return other();
    } else {
      return this;
    }
  }

  Either<L, R> operator >>(Either<L, R> Function() other) {
    if (this is Right<L, R>) {
      return other();
    } else {
      return this;
    }
  }



}

extension EitherListExtension<L, R> on List<Either<L, R>> {
  List<R> get right => whereType<Right<L, R>>().map((e) => e.value).toList();
  List<L> get left => whereType<Left<L, R>>().map((e) => e.value).toList();
}

extension EitherFutureExtension<L, R> on Future<Either<L, R>> {
  Future<R?> get right async => (await this).right;
  Future<L?> get left async => (await this).left;

  
}

extension EitherFutureListExtension<L, R> on Future<List<Either<L, R>>> {
  Future<List<R>> get right async => (await this).right ;
  Future<List<L>> get left async => (await this).left;
}

extension EitherStreamExtension<L, R> on Stream<Either<L, R>> {
  Stream<R?> get right => map((e) => e.right);
  Stream<L?> get left => map((e) => e.left);
}

extension EitherStreamListExtension<L, R> on Stream<List<Either<L, R>>> {
  Stream<List<R>> get right => map((e) => e.right);
  Stream<List<L>> get left => map((e) => e.left);
}


const noParam = NoParam._();
const unit = Unit._();
const noData = NoData._();