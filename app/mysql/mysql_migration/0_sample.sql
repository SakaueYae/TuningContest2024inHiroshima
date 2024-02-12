-- このファイルに記述されたSQLコマンドが、マイグレーション時に実行されます。
alter table user add index id_index (mail, password);
alter table department_role_member add index belong_index (belong);
alter table department_role_member add index role_id_index (role_id);
