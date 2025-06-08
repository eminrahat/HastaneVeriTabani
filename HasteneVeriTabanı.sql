CREATE TABLE Hastalar(
HastaID INT PRIMARY KEY IDENTITY(1,1),
AdSoyad NVARCHAR(50) NOT NULL,
TCNO CHAR(11) UNIQUE NOT NULL,
DogumTarihi DATE NOT NULL,
Cinsiyet CHAR(5) NOT NULL, 
TelNo CHAR(11) NOT NULL);

CREATE TABLE Klinikler (
KlinikID INT PRIMARY KEY IDENTITY(1,1),
KlinikAd� NVARCHAR(50) NOT NULL);

CREATE TABLE Doktorlar(
DoktorID INT PRIMARY KEY IDENTITY(1,1),
AdSoyad NVARCHAR(50) NOT NULL,
Uzmanl�k NVARCHAR(50) NOT NULL,
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

CREATE TABLE �demeler(
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
--        -- Ad Soyad (rastgele �rnekler)
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 8
--            WHEN 0 THEN N'Ahmet Y�lmaz'
--            WHEN 1 THEN N'Ay�e Demir'
--            WHEN 2 THEN N'Mehmet Kaya'
--            WHEN 3 THEN N'Fatma �elik'
--            WHEN 4 THEN N'Emre �ahin'
--            WHEN 5 THEN N'Zeynep Ko�'
--            WHEN 6 THEN N'Canan Arslan'
--            ELSE N'Sinan Ayd�n'
--        END,
--        -- TCNO: 11 haneli, UNIQUE olacak �ekilde @i eklenerek �retiliyor
--        RIGHT('1' + REPLICATE('0', 9) + CAST(@i AS VARCHAR(3)), 11),
--        -- Do�um Tarihi: 1970-01-01 ile 2010-12-31 aras� rastgele
--        DATEADD(DAY, (ABS(CHECKSUM(NEWID())+@i) % 15000), '1970-01-01'),
--        -- Cinsiyet: "Erkek" veya "Kad�n"
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 2
--            WHEN 0 THEN N'Erkek'
--            ELSE N'Kad�n'
--        END,
--        -- TelNo: 05xxxxxxxxx format�nda
--        '05' + RIGHT('0' + CAST(ABS(CHECKSUM(NEWID())+@i) % 1000000000 AS VARCHAR(9)), 9)
--    );
--    SET @i = @i + 1;
--END


--DECLARE @i INT = 1; --Klinikler Tablosu ��in Rastgele veri

--WHILE @i <= 100
--BEGIN
--    INSERT INTO Klinikler (KlinikAd�)
--    VALUES (
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 10
--            WHEN 0 THEN N'Kardiyoloji'
--            WHEN 1 THEN N'G�z Hastal�klar�'
--            WHEN 2 THEN N'Ortopedi'
--            WHEN 3 THEN N'Dahiliye'
--            WHEN 4 THEN N'�ocuk Sa�l���'
--            WHEN 5 THEN N'Kulak Burun Bo�az'
--            WHEN 6 THEN N'Cildiye'
--            WHEN 7 THEN N'Psikiyatri'
--            WHEN 8 THEN N'N�roloji'
--            ELSE N'Genel Cerrahi'
--        END
--    );
--    SET @i = @i + 1;
--END

--DECLARE @i INT = 1;

--WHILE @i <= 100
--BEGIN
--    INSERT INTO Doktorlar (AdSoyad, Uzmanl�k, KlinikID)
--    VALUES (
--        -- Doktor ad�
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 10
--            WHEN 0 THEN N'Ahmet Y�ld�z'
--            WHEN 1 THEN N'Ay�e Demir'
--            WHEN 2 THEN N'Mehmet Kaya'
--            WHEN 3 THEN N'Fatma �elik'
--            WHEN 4 THEN N'Emre �ahin'
--            WHEN 5 THEN N'Zeynep Ko�'
--            WHEN 6 THEN N'Canan Arslan'
--            WHEN 7 THEN N'Sinan Ayd�n'
--            WHEN 8 THEN N'Hasan Topal'
--            ELSE N'Elif G�ven'
--        END,
--        -- Uzmanl�k
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 10
--            WHEN 0 THEN N'Kardiyoloji'
--            WHEN 1 THEN N'G�z Hastal�klar�'
--            WHEN 2 THEN N'Ortopedi'
--            WHEN 3 THEN N'Dahiliye'
--            WHEN 4 THEN N'�ocuk Sa�l���'
--            WHEN 5 THEN N'Kulak Burun Bo�az'
--            WHEN 6 THEN N'Cildiye'
--            WHEN 7 THEN N'Psikiyatri'
--            WHEN 8 THEN N'N�roloji'
--            ELSE N'Genel Cerrahi'
--        END,
--        -- KlinikID (1-12 aras�)
--        (ABS(CHECKSUM(NEWID()) + @i) % 12) + 1
--    );
--    SET @i = @i + 1;
--END

--DECLARE @i INT = 1;

--WHILE @i <= 100
--BEGIN
--    INSERT INTO RENDEVULAR (HastaID, DoktorID, TarihSaat)
--    VALUES (
--        (ABS(CHECKSUM(NEWID()) + @i) % 100) + 1,    -- HastaID: 1-100 aras�
--        (ABS(CHECKSUM(NEWID()) + @i + 100) % 100) + 1,    -- DoktorID: 1-100 aras�
--        DATEADD(MINUTE, (ABS(CHECKSUM(NEWID()) + @i) % 60) * 15, 
--            DATEADD(DAY, (ABS(CHECKSUM(NEWID()) + @i) % 365), '2024-01-01'))
--        -- 2024 y�l�ndan ba�layarak rastgele g�n ve 15 dakikal�k aral�klarla saat
--    );
--    SET @i = @i + 1;
--END

--DECLARE @i INT = 1;

--WHILE @i <= 100
--BEGIN
--    INSERT INTO Tedaviler (RendevuID, Teshis, Recete)
--    VALUES (
--        (ABS(CHECKSUM(NEWID()) + @i) % 100) + 1, -- RandevuID: 1-100 aras� rastgele
--        -- Te�his �rnekleri
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 8
--            WHEN 0 THEN N'�st solunum yolu enfeksiyonu'
--            WHEN 1 THEN N'Migren'
--            WHEN 2 THEN N'Kas incinmesi'
--            WHEN 3 THEN N'Alerjik rinit'
--            WHEN 4 THEN N'Bron�it'
--            WHEN 5 THEN N'Gastrit'
--            WHEN 6 THEN N'Diyabet'
--            ELSE N'Hipertansiyon'
--        END,
--        -- Re�ete �rnekleri
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 8
--            WHEN 0 THEN N'Parol 500mg, g�nde 3 kez'
--            WHEN 1 THEN N'Migrex 5mg, ba� a�r�s� olunca'
--            WHEN 2 THEN N'Voltaren jel, g�nde 2 kez'
--            WHEN 3 THEN N'Aerius 5mg, ak�amlar�'
--            WHEN 4 THEN N'Ventolin inhaler, ihtiya� halinde'
--            WHEN 5 THEN N'Gaviscon, yemekten sonra'
--            WHEN 6 THEN N'Metformin 500mg, sabah-ak�am'
--            ELSE N'Diovan 80mg, sabahlar�'
--        END
--    );
--    SET @i = @i + 1;
--END

--DECLARE @i INT = 1;

--WHILE @i <= 100
--BEGIN
--    INSERT INTO �demeler (HastaID, Tutar, OdemeTarihi, Yontem)
--    VALUES (
--        (ABS(CHECKSUM(NEWID()) + @i) % 100) + 1, -- HastaID: 1-100 aras�
--        CAST((ABS(CHECKSUM(NEWID()) + @i) % 900) + 100 AS FLOAT), -- Tutar: 100-999 aras� (�rnek)
--        DATEADD(DAY, (ABS(CHECKSUM(NEWID()) + @i) % 365), '2024-01-01'), -- 2024 ve sonras� rastgele g�n
--        CASE ABS(CHECKSUM(NEWID()) + @i) % 3
--            WHEN 0 THEN N'Nakit'
--            WHEN 1 THEN N'Kart'
--            ELSE N'EFT'
--        END -- Y�ntem: Nakit, Kart veya EFT
--    );
--    SET @i = @i + 1;
--END

