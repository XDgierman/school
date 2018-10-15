CREATE TABLE PrzedstawicieleHandlowi (
  IDprzedstawiciela AUTOINCREMENT PRIMARY KEY,
  NazwiskoPrzedstawiciela CHAR (30) NOT NULL,
  ImiePrzedstawiciela CHAR (30) NOT NULL,
  DataUrodzeniaUcznia DATETIME NOT NULL,
  IDproducenta INTEGER NOT NULL
);
