-- このファイルに記述されたSQLコマンドが、マイグレーション時に実行されます。
alter table user add index myUindex1 (mail, password);
alter table department_role_member add index myDindex1 (belong, role_id);

-- ここから追記
--alter table match_group_member add index myindex1(user_id);
--alter table user add index myindex2 (entry_date, kana);
