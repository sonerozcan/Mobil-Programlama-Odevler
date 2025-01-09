CREATE TABLE Personel (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ad TEXT NOT NULL,
    soyad TEXT NOT NULL,
    departman TEXT,
    maas INTEGER
);

INSERT INTO Personel (ad, soyad, departman, maas) VALUES
('Ali', 'Yılmaz', 'Muhasebe', 4500),
('Ayşe', 'Kaya', 'IT', 6000),
('Mehmet', 'Demir', 'Muhasebe', 5000),
('Fatma', 'Çelik', 'IT', 5500),
('Ahmet', 'Güneş', 'Pazarlama', 4000);

SELECT * FROM Personel;
SELECT * FROM Personel WHERE departman = 'IT';

UPDATE Personel
SET maas = maas + 500
WHERE departman = 'IT';

DELETE FROM Personel
WHERE maas < 4500;

INSERT INTO Personel (ad, soyad, departman, maas) VALUES
('Zeynep', 'Yıldırım', 'Pazarlama', 4700);

SELECT departman, AVG(maas) AS OrtalamaMaas
FROM Personel
GROUP BY departman;

SELECT departman, COUNT(*) AS PersonelSayisi
FROM Personel
GROUP BY departman;

SELECT departman, SUM(maas) AS ToplamMaas
FROM Personel
GROUP BY departman
ORDER BY ToplamMaas DESC
LIMIT 1;
