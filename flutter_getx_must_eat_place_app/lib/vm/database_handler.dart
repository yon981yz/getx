import 'package:flutter_getx_must_eat_place_app/model/address.dart';
import 'package:flutter_getx_must_eat_place_app/vm/image_handler.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler extends ImageHandler{

  var addresses = <Address>[].obs;

  Future<Database> initializeDB()async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'address.db'),
      onCreate: (db, version) async{
        await db.execute(
          '''create table address
            (id integer primary key autoincrement, 
            name text, phone text, 
            estimate text, 
            lat real, 
            lng real, 
            image blob, 
            actiondate text)
          '''
        );
      },
      version: 1
    );
  }

  insertAddress(Address address) async{
    final Database db = await initializeDB();
    await db.rawInsert(
      """
      insert into address(
      name,
      phone,
      estimate,
      lat,
      lng,
      image,
      actiondate
      ) values (?,?,?,?,?,?,datetime('now','localtime'))
      """,
      [
        address.name,
        address.phone,
        address.estimate,
        address.lat,
        address.lng,
        address.image
      ]
    );
  }

  queryAddress() async{
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult=
      await db.rawQuery("select * from address");
    addresses.value = queryResult.map((e)=> Address.fromMap(e)).toList();

  }

  updateAddress(Address address) async{
    final Database db = await initializeDB();
    await db.rawUpdate(
      """
      update address set
      name = ?,
      phone = ?,
      estimate = ?,
      lat = ?,
      lng = ?

      where id = ?
      """,
      [
        address.name,
        address.phone,
        address.estimate,
        address.lat,
        address.lng,
        address.id,
      ]
    );
  }
  updateAddressAll(Address address) async{
    final Database db = await initializeDB();
    await db.rawUpdate(
      """
      update address set
      name = ?,
      phone = ?,
      estimate = ?,
      lat = ?,
      lng = ?,
      image = ?

      where id = ?
      """,
      [
        address.name,
        address.phone,
        address.estimate,
        address.lat,
        address.lng,
        address.image,
        address.id,
      ]
    );
  }

  deleteAddress(int id) async{
    final Database db = await initializeDB();
    await db.rawDelete( """
        delete from address where id = ? 
      """, [id]
    );
  } 
}