-- Event_User  [rel8]
alter table "APP"."USER"  ADD COLUMN  "EVENT_OID"  varchar(255);
alter table "APP"."USER"   add constraint FK_EVENT foreign key ("EVENT_OID") references "APP"."EVENT" ("OID");


-- PermanentGuestlist_User  [rel9]
alter table "APP"."USER"  ADD COLUMN  "PERMANENTGUESTLIST_OID"  varchar(255);
alter table "APP"."USER"   add constraint FK_PERMANENTGUESTLIST foreign key ("PERMANENTGUESTLIST_OID") references "APP"."PERMANENTGUESTLIST" ("OID");


