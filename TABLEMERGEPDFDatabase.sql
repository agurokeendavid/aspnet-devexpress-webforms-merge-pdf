CREATE TABLE TABLEMERGEPDF (
  ID             NVARCHAR2(50) DEFAULT SYS_GUID(),
  TITLE          NVARCHAR2(50) NOT NULL,
  FILEATTACHMENT BLOB          NOT NULL,
  FILENAME       NVARCHAR2(50) NOT NULL,
  CONSTRAINT PK_TABLEMERGEPDF_ID PRIMARY KEY (ID) USING INDEX TABLESPACE USERS STORAGE (INITIAL 64 K
                                                                                        NEXT 1 M
                                                                                        MAXEXTENTS UNLIMITED)
)
TABLESPACE USERS
STORAGE (INITIAL 64 K
         NEXT 1 M
         MAXEXTENTS UNLIMITED)
LOGGING;