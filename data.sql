CREATE TABLE pelanggan (
    KODE VARCHAR(11) PRIMARY KEY,
    NAMA VARCHAR(255),
    ALAMAT VARCHAR(255)
);

INSERT INTO pelanggan (KODE, NAMA, ALAMAT) VALUES
('P1', 'Yogi', 'JAKARTA'),
('P2', 'Anggi', 'BANDUNG'),
('P3', 'Rahma', 'BANDUNG');

CREATE TABLE barang (
    KODE VARCHAR(255) PRIMARY KEY,
    NAMA VARCHAR(255),
    HARGA_SATUAN INT
);

INSERT INTO barang (KODE, NAMA, HARGA_SATUAN) VALUES
('B1', 'Baju', 12000),
('B2', 'Celana', 10000),
('B3', 'Sepatu', 30000);

CREATE TABLE transaksi (
    KODE VARCHAR(255) PRIMARY KEY,
    TANGGAL DATE,
    KODE_PELANGGAN VARCHAR(11),
    KODE_BARANG VARCHAR(255),
    JUMLAH_BARANG DOUBLE(255, 0),
    FOREIGN KEY (KODE_PELANGGAN) REFERENCES pelanggan(KODE),
    FOREIGN KEY (KODE_BARANG) REFERENCES barang(KODE)
);

INSERT INTO transaksi (KODE, TANGGAL, KODE_PELANGGAN, KODE_BARANG, JUMLAH_BARANG) VALUES
('TRX001', '2019-10-01', 'P1', 'B1', 3),
('TRX002', '2019-10-02', 'P2', 'B2', 2),
('TRX003', '2019-10-08', 'P2', 'B1', 5),
('TRX004', '2019-10-10', 'P1', 'B1', 1),
('TRX005', '2019-10-17', 'P3', 'B2', 2),
('TRX006', '2019-10-17', 'P2', 'B3', 1),
('TRX007', '2019-10-18', 'P3', 'B1', 4),
('TRX008', '2019-10-18', 'P2', 'B2', 2);

SELECT * FROM barang 
ORDER BY HARGA_SATUAN ASC

SELECT  * FROM  pelanggan 
WHERE NAMA LIKE '%g%' AND ALAMAT = "Bandung"

SELECT 
    t.KODE,
    t.TANGGAL,
    p.NAMA AS NAMA_PELANGGAN,
    b.NAMA,
    t.JUMLAH_BARANG AS JUMLAH,
    b.HARGA_SATUAN,
    (t.JUMLAH_BARANG * b.HARGA_SATUAN) AS TOTAL
FROM 
    transaksi t
JOIN 
    pelanggan p ON t.KODE_PELANGGAN = p.KODE
JOIN 
    barang b ON t.KODE_BARANG = b.KODE
ORDER BY 
    t.KODE;
   
SELECT 
    p.NAMA AS NAMA_PELANGGAN,
    SUM(t.JUMLAH_BARANG) AS JUMLAH,
    SUM(t.JUMLAH_BARANG * b.HARGA_SATUAN) AS TOTAL_HARGA
FROM 
    transaksi t
JOIN 
    pelanggan p ON t.KODE_PELANGGAN = p.KODE
JOIN 
    barang b ON t.KODE_BARANG = b.KODE
GROUP BY 
    p.NAMA
ORDER BY 
    p.NAMA;

