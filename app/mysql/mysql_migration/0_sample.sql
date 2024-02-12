-- このファイルに記述されたSQLコマンドが、マイグレーション時に実行されます。
alter table user add index id_index (mail, password);
