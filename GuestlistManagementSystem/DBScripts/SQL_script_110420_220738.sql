-- User  [User]
create table "APP"."USER" (
   "OID"  integer  not null,
   "USERNAME"  varchar(255),
   "PASSWORD"  varchar(255),
   "EMAIL"  varchar(255),
  primary key ("OID")
);


-- Group  [Group]
create table "APP"."GROUP" (
   "OID"  integer  not null,
   "GROUPNAME"  varchar(255),
  primary key ("OID")
);


-- Module  [Module]
create table "APP"."MODULE" (
   "OID"  integer  not null,
   "MODULEID"  varchar(255),
   "MODULENAME"  varchar(255),
  primary key ("OID")
);


-- Account  [ent1]
create table "APP"."ACCOUNT" (
   "OID"  integer  not null,
   "ADDRESSLINE1"  varchar(255),
   "ADDRESSLINE2"  varchar(255),
   "CITY"  varchar(255),
   "COUNTRY"  varchar(255),
   "ZIP"  varchar(255),
   "PHONE"  varchar(255),
   "COMPANYNAME"  varchar(255),
  primary key ("OID")
);


-- Settings  [ent2]
create table "APP"."SETTINGS" (
   "OID"  integer  not null,
   "LANGUAGE"  varchar(255),
  primary key ("OID")
);


-- Event  [ent3]
create table "APP"."EVENT" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
   "DATE"  date,
   "LOCATION"  varchar(255),
  primary key ("OID")
);


-- Guestlist  [ent4]
create table "APP"."GUESTLIST" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
  primary key ("OID")
);


-- Invitation  [ent5]
create table "APP"."INVITATION" (
   "OID"  integer  not null,
   "FIRSTNAME"  varchar(255),
   "LASTNAME"  varchar(255),
   "NOTE"  varchar(255),
   "ISCHECKEDIN"  smallint,
   "CHECKINDATE"  date,
   "ACCOMPANIEDBY"  integer,
  primary key ("OID")
);


-- PermanentGuestlist  [ent6]
create table "APP"."PERMANENTGUESTLIST" (
   "OID"  integer  not null,
   "NAME"  varchar(255),
  primary key ("OID")
);


-- PermanentInvitation  [ent7]
create table "APP"."PERMANENTINVITATION" (
   "OID"  integer  not null,
   "FIRSTNAME"  varchar(255),
   "LASTNAME"  varchar(255),
   "NOTE"  varchar(255),
   "ISCHECKEDIN"  smallint,
   "CHECKINDATE"  date,
   "ACCOMPANIEDBY"  integer,
  primary key ("OID")
);


-- User_Group  [User2Group_Group2User]
create table "APP"."USER_GROUP" (
   "USER_OID"  integer not null,
   "GROUP_OID"  integer not null,
  primary key ("USER_OID", "GROUP_OID")
);
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_USER foreign key ("USER_OID") references "APP"."USER" ("OID");
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");


-- User_DefaultGroup  [User2DefaultGroup_DefaultGroup2User]
alter table "APP"."USER"  ADD COLUMN  "GROUP_OID"  integer;
alter table "APP"."USER"   add constraint FK_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");


-- Group_DefaultModule  [Group2DefaultModule_DefaultModule2Group]
alter table "APP"."GROUP"  ADD COLUMN  "MODULE_OID"  integer;
alter table "APP"."GROUP"   add constraint FK_MODULE foreign key ("MODULE_OID") references "APP"."MODULE" ("OID");


-- Group_Module  [Group2Module_Module2Group]
create table "APP"."GROUP_MODULE" (
   "GROUP_OID"  integer not null,
   "MODULE_OID"  integer not null,
  primary key ("GROUP_OID", "MODULE_OID")
);
alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");
alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_MODULE foreign key ("MODULE_OID") references "APP"."MODULE" ("OID");


-- Account_User  [rel1]
alter table "APP"."ACCOUNT"  ADD COLUMN  "USER_OID"  integer;
alter table "APP"."ACCOUNT"   add constraint FK_USER foreign key ("USER_OID") references "APP"."USER" ("OID");


-- Settings_Account  [rel2]
alter table "APP"."SETTINGS"  ADD COLUMN  "ACCOUNT_OID"  integer;
alter table "APP"."SETTINGS"   add constraint FK_ACCOUNT foreign key ("ACCOUNT_OID") references "APP"."ACCOUNT" ("OID");


-- Event_Guestlist  [rel4]
alter table "APP"."EVENT"  ADD COLUMN  "GUESTLIST_OID"  integer;
alter table "APP"."EVENT"   add constraint FK_GUESTLIST foreign key ("GUESTLIST_OID") references "APP"."GUESTLIST" ("OID");


-- Guestlist_Invitation  [rel5]
alter table "APP"."GUESTLIST"  ADD COLUMN  "INVITATION_OID"  integer;
alter table "APP"."GUESTLIST"   add constraint FK_INVITATION foreign key ("INVITATION_OID") references "APP"."INVITATION" ("OID");


-- PermanentGuestlist_PermanentInvitation  [rel7]
alter table "APP"."PERMANENTGUESTLIST"  ADD COLUMN  "PERMANENTINVITATION_OID"  integer;
alter table "APP"."PERMANENTGUESTLIST"   add constraint FK_PERMANENTINVITATION foreign key ("PERMANENTINVITATION_OID") references "APP"."PERMANENTINVITATION" ("OID");


-- Event_User  [rel8]
alter table "APP"."USER"  ADD COLUMN  "EVENT_OID"  integer;
alter table "APP"."USER"   add constraint FK_EVENT foreign key ("EVENT_OID") references "APP"."EVENT" ("OID");


-- PermanentGuestlist_User  [rel9]
alter table "APP"."USER"  ADD COLUMN  "PERMANENTGUESTLIST_OID"  integer;
alter table "APP"."USER"   add constraint FK_PERMANENTGUESTLIST foreign key ("PERMANENTGUESTLIST_OID") references "APP"."PERMANENTGUESTLIST" ("OID");


