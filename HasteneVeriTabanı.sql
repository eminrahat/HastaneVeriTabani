CREATE TABLE Hastalar(
HastaID INT PRIMARY KEY IDENTITY(1,1),
AdSoyad NVARCHAR(50) NOT NULL,
TCNO CHAR(11) UNIQUE NOT NULL,
DogumTarihi DATE NOT NULL,
Cinsiyet CHAR(5) NOT NULL, 
TelNo CHAR(11) NOT NULL);

CREATE TABLE Klinikler (
KlinikID INT PRIMARY KEY IDENTITY(1,1),
KlinikAdý NVARCHAR(50) NOT NULL);

CREATE TABLE Doktorlar(
DoktorID INT PRIMARY KEY IDENTITY(1,1),
AdSoyad NVARCHAR(50) NOT NULL,
Uzmanlýk NVARCHAR(50) NOT NULL,
KlinikID INT NOT NULL,
FOREIGN KEY (KlinikID) REFERENCES Klinikler(KlinikID));

CREATE TABLE RENDEVULAR(
RendevuID INT PRIMARY KEY IDENTITY(1,1),
HastaID INT NOT NULL,
DoktorID INT NOT NULL,
TarihSaat DATETIME NOT NULL,
FOREIGN KEY (HastaID) REFERENCES Hastalar(HastaID),
FOREIGN KEY (DoktorID) REFERENCES Doktorlar(DoktorID));

CREATE TABLE Tedaviler(
TedaviID INT PRIMARY KEY IDENTITY(1,1),
RendevuID INT NOT NULL,
Teshis NVARCHAR(100),
Recete NVARCHAR(150),
FOREIGN KEY (RendevuID) REFERENCES Rendevular(RendevuID));

CREATE TABLE Ödemeler(
OdemelerID INT PRIMARY KEY IDENTITY(1,1),
HastaID INT NOT NULL,
Tutar FLOAT,
OdemeTarihi DATE,
Yontem NVARCHAR(5),
FOREIGN KEY (HastaID) REFERENCES Hastalar(HastaID));




--DECLARE @i INT = 1;  "HASTALAR TABLOSN

--WHILE @i <= 100
--BEGIN  
--    INSERT INTO Hastalar (AdSoyad, TCNO, DogumTarihi, Cinsiyet, TelNo)
--    VALUES (
--        -- Ad Soyad (rastgele örnekler)
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 8
--            WHEN 0 THEN N'Ahmet Yýlmaz'
--            WHEN 1 THEN N'Ayþe Demir'
--            WHEN 2 THEN N'Mehmet Kaya'
--            WHEN 3 THEN N'Fatma Çelik'
--            WHEN 4 THEN N'Emre Þahin'
--            WHEN 5 THEN N'Zeynep Koç'
--            WHEN 6 THEN N'Canan Arslan'
--            ELSE N'Sinan Aydýn'
--        END,
--        -- TCNO: 11 haneli, UNIQUE olacak þekilde @i eklenerek üretiliyor
--        RIGHT('1' + REPLICATE('0', 9) + CAST(@i AS VARCHAR(3)), 11),
--        -- Doðum Tarihi: 1970-01-01 ile 2010-12-31 arasý rastgele
--        DATEADD(DAY, (ABS(CHECKSUM(NEWID())+@i) % 15000), '1970-01-01'),
--        -- Cinsiyet: "Erkek" veya "Kadýn"
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 2
--            WHEN 0 THEN N'Erkek'
--            ELSE N'Kadýn'
--        END,
--        -- TelNo: 05xxxxxxxxx formatýnda
--        '05' + RIGHT('0' + CAST(ABS(CHECKSUM(NEWID())+@i) % 1000000000 AS VARCHAR(9)), 9)
--    );
--    SET @i = @i + 1;
--END


--DECLARE @i INT = 1; --Klinikler Tablosu Ýçin Rastgele veri

--WHILE @i <= 100
--BEGIN
--    INSERT INTO Klinikler (KlinikAdý)
--    VALUES (
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 10
--            WHEN 0 THEN N'Kardiyoloji'
--            WHEN 1 THEN N'Göz Hastalýklarý'
--            WHEN 2 THEN N'Ortopedi'
--            WHEN 3 THEN N'Dahiliye'
--            WHEN 4 THEN N'Çocuk Saðlýðý'
--            WHEN 5 THEN N'Kulak Burun Boðaz'
--            WHEN 6 THEN N'Cildiye'
--            WHEN 7 THEN N'Psikiyatri'
--            WHEN 8 THEN N'Nöroloji'
--            ELSE N'Genel Cerrahi'
--        END
--    );
--    SET @i = @i + 1;
--END

--DECLARE @i INT = 1;

--WHILE @i <= 100
--BEGIN
--    INSERT INTO Doktorlar (AdSoyad, Uzmanlýk, KlinikID)
--    VALUES (
--        -- Doktor adý
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 10
--            WHEN 0 THEN N'Ahmet Yýldýz'
--            WHEN 1 THEN N'Ayþe Demir'
--            WHEN 2 THEN N'Mehmet Kaya'
--            WHEN 3 THEN N'Fatma Çelik'
--            WHEN 4 THEN N'Emre Þahin'
--            WHEN 5 THEN N'Zeynep Koç'
--            WHEN 6 THEN N'Canan Arslan'
--            WHEN 7 THEN N'Sinan Aydýn'
--            WHEN 8 THEN N'Hasan Topal'
--            ELSE N'Elif Güven'
--        END,
--        -- Uzmanlýk
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 10
--            WHEN 0 THEN N'Kardiyoloji'
--            WHEN 1 THEN N'Göz Hastalýklarý'
--            WHEN 2 THEN N'Ortopedi'
--            WHEN 3 THEN N'Dahiliye'
--            WHEN 4 THEN N'Çocuk Saðlýðý'
--            WHEN 5 THEN N'Kulak Burun Boðaz'
--            WHEN 6 THEN N'Cildiye'
--            WHEN 7 THEN N'Psikiyatri'
--            WHEN 8 THEN N'Nöroloji'
--            ELSE N'Genel Cerrahi'
--        END,
--        -- KlinikID (1-12 arasý)
--        (ABS(CHECKSUM(NEWID()) + @i) % 12) + 1
--    );
--    SET @i = @i + 1;
--END

--DECLARE @i INT = 1;

--WHILE @i <= 100
--BEGIN
--    INSERT INTO RENDEVULAR (HastaID, DoktorID, TarihSaat)
--    VALUES (
--        (ABS(CHECKSUM(NEWID()) + @i) % 100) + 1,    -- HastaID: 1-100 arasý
--        (ABS(CHECKSUM(NEWID()) + @i + 100) % 100) + 1,    -- DoktorID: 1-100 arasý
--        DATEADD(MINUTE, (ABS(CHECKSUM(NEWID()) + @i) % 60) * 15, 
--            DATEADD(DAY, (ABS(CHECKSUM(NEWID()) + @i) % 365), '2024-01-01'))
--        -- 2024 yýlýndan baþlayarak rastgele gün ve 15 dakikalýk aralýklarla saat
--    );
--    SET @i = @i + 1;
--END

--DECLARE @i INT = 1;

--WHILE @i <= 100
--BEGIN
--    INSERT INTO Tedaviler (RendevuID, Teshis, Recete)
--    VALUES (
--        (ABS(CHECKSUM(NEWID()) + @i) % 100) + 1, -- RandevuID: 1-100 arasý rastgele
--        -- Teþhis örnekleri
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 8
--            WHEN 0 THEN N'Üst solunum yolu enfeksiyonu'
--            WHEN 1 THEN N'Migren'
--            WHEN 2 THEN N'Kas incinmesi'
--            WHEN 3 THEN N'Alerjik rinit'
--            WHEN 4 THEN N'Bronþit'
--            WHEN 5 THEN N'Gastrit'
--            WHEN 6 THEN N'Diyabet'
--            ELSE N'Hipertansiyon'
--        END,
--        -- Reçete örnekleri
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 8
--            WHEN 0 THEN N'Parol 500mg, günde 3 kez'
--            WHEN 1 THEN N'Migrex 5mg, baþ aðrýsý olunca'
--            WHEN 2 THEN N'Voltaren jel, günde 2 kez'
--            WHEN 3 THEN N'Aerius 5mg, akþamlarý'
--            WHEN 4 THEN N'Ventolin inhaler, ihtiyaç halinde'
--            WHEN 5 THEN N'Gaviscon, yemekten sonra'
--            WHEN 6 THEN N'Metformin 500mg, sabah-akþam'
--            ELSE N'Diovan 80mg, sabahlarý'
--        END
--    );
--    SET @i = @i + 1;
--END

--DECLARE @i INT = 1;

--WHILE @i <= 100
--BEGIN
--    INSERT INTO Ödemeler (HastaID, Tutar, OdemeTarihi, Yontem)
--    VALUES (
--        (ABS(CHECKSUM(NEWID()) + @i) % 100) + 1, -- HastaID: 1-100 arasý
--        CAST((ABS(CHECKSUM(NEWID()) + @i) % 900) + 100 AS FLOAT), -- Tutar: 100-999 arasý (örnek)
--        DATEADD(DAY, (ABS(CHECKSUM(NEWID()) + @i) % 365), '2024-01-01'), -- 2024 ve sonrasý rastgele gün
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 3
--            WHEN 0 THEN N'Nakit'
--            WHEN 1 THEN N'Kart'
--            ELSE N'EFT'
--        END -- Yöntem: Nakit, Kart veya EFT
--    );
--    SET @i = @i + 1;
--END

