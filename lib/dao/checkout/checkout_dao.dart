import 'package:moor_flutter/moor_flutter.dart';
import 'package:tech_alchemy/dao/app_database.dart';

part 'checkout_dao.g.dart';

@UseDao(
  tables: [Checkouts],
)
class CheckoutsDao extends DatabaseAccessor<AppDatabase>
    with _$CheckoutsDaoMixin {
  CheckoutsDao(AppDatabase db) : super(db);

  Future<void> saveCheckOutDetails(List<Checkout> entries) {
    return batch((batch) {
      batch.insertAll(
        checkouts,
        entries,
        mode: InsertMode.insertOrReplace,
      );
    });
  }
  Future<Checkout> getSingleCheckOutData(int id) {
    return (select(checkouts)..where((checkout) => checkout.eventId.equals(id)))
        .getSingle();
  }

  Future<List<Checkout>> getAllCheckouts() {
    return (select(checkouts))
        .get();
  }

  Future getDeleteAllCheckouts() {
    return (delete(checkouts))
        .go();
  }

  Stream<List<Checkout>> watchAllCheckouts(List<String> statusList) {
    return (select(checkouts))
        .watch();
  }
}

class Checkouts extends Table {
  TextColumn get id => text()();

  IntColumn get eventId => integer().nullable()();

  TextColumn get eventName => text().nullable()();

  TextColumn get eventDateTime => text().nullable()();

  RealColumn get price => real().nullable()();

  BoolColumn get isPrivate => boolean().withDefault(const Constant(false))();

  TextColumn get location => text().nullable()();

  TextColumn get gameLength => text().nullable()();

  TextColumn get paymentMethodUnsupported => text().nullable()();

  TextColumn get mainImage => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
