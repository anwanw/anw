-- REL FK: Event_Account  [rel3]
alter table "APP"."EVENT"   add constraint FK_EVENT_USER foreign key ("ACCOUNT_OID") references "APP"."USER" ();


