-- このファイルに記述されたSQLコマンドが、マイグレーション時に実行されます。
alter table user add index myUindex1 (mail, password);
alter table user add index myUindex2 (entry_date, kana);
alter table user add index myUindex3 (goal);
alter table match_group_member add index myMindex1(user_id);
alter table department_role_member add index myDindex1 (belong, role_id);
