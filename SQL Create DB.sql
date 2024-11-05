Create Database [SebarSenang]
GO

USE [SebarSenang]
GO
/****** Object:  Table [dbo].[Barang]    Script Date: 06-Nov-24 1:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barang](
	[BarangId] [uniqueidentifier] NOT NULL,
	[NamaBarang] [nvarchar](100) NOT NULL,
	[Deskripsi] [nvarchar](255) NULL,
	[HargaPerHari] [decimal](10, 2) NOT NULL,
	[Kategori] [nvarchar](50) NULL,
	[StatusKetersediaan] [bit] NOT NULL,
	[PenyediaId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BarangId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penyedia]    Script Date: 06-Nov-24 1:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penyedia](
	[PenyediaId] [uniqueidentifier] NOT NULL,
	[Nama] [nvarchar](100) NOT NULL,
	[Alamat] [nvarchar](255) NULL,
	[Telepon] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PenyediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penyewa]    Script Date: 06-Nov-24 1:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penyewa](
	[PenyewaId] [uniqueidentifier] NOT NULL,
	[Nama] [nvarchar](100) NOT NULL,
	[Alamat] [nvarchar](255) NULL,
	[Telepon] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PenyewaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penyewaan]    Script Date: 06-Nov-24 1:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penyewaan](
	[PenyewaanId] [uniqueidentifier] NOT NULL,
	[BarangId] [uniqueidentifier] NOT NULL,
	[PenyewaId] [uniqueidentifier] NOT NULL,
	[TanggalMulai] [datetime] NOT NULL,
	[TanggalSelesai] [datetime] NOT NULL,
	[DurasiHari]  AS (datediff(day,[TanggalMulai],[TanggalSelesai])),
	[TotalHarga] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[PenyewaanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaksi]    Script Date: 06-Nov-24 1:32:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaksi](
	[TransaksiId] [uniqueidentifier] NOT NULL,
	[PenyewaanId] [uniqueidentifier] NOT NULL,
	[JumlahBayar] [decimal](10, 2) NOT NULL,
	[TanggalTransaksi] [datetime] NOT NULL,
	[MetodePembayaran] [nvarchar](50) NULL,
	[StatusPembayaran] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TransaksiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Barang] ([BarangId], [NamaBarang], [Deskripsi], [HargaPerHari], [Kategori], [StatusKetersediaan], [PenyediaId]) VALUES (N'24489e70-32ae-4ec8-abc7-1b4f640389ee', N'Sewa Laptop Gaming', N'Laptop gaming untuk keperluan gaming', CAST(500000.00 AS Decimal(10, 2)), N'Elektronik', 1, N'32894fcc-32ff-45e7-b4c3-562c2156340d')
GO
INSERT [dbo].[Barang] ([BarangId], [NamaBarang], [Deskripsi], [HargaPerHari], [Kategori], [StatusKetersediaan], [PenyediaId]) VALUES (N'019fa7ae-4171-4af3-afab-7338551e9546', N'Sewa Drone', N'Drone untuk fotografi udara', CAST(400000.00 AS Decimal(10, 2)), N'Elektronik', 1, N'13ad10fa-0b13-4b25-8eb5-736aac86c2a5')
GO
INSERT [dbo].[Barang] ([BarangId], [NamaBarang], [Deskripsi], [HargaPerHari], [Kategori], [StatusKetersediaan], [PenyediaId]) VALUES (N'65066a84-e89a-4667-8b0f-85c42c09e26a', N'Sewa Alat Pesta', N'Alat pesta untuk acara', CAST(250000.00 AS Decimal(10, 2)), N'Perlengkapan', 1, N'13ad10fa-0b13-4b25-8eb5-736aac86c2a5')
GO
INSERT [dbo].[Barang] ([BarangId], [NamaBarang], [Deskripsi], [HargaPerHari], [Kategori], [StatusKetersediaan], [PenyediaId]) VALUES (N'50b7c447-df55-405c-a6dd-937e0293cdab', N'Sewa Sepeda Gunung', N'Sepeda gunung untuk trekking', CAST(75000.00 AS Decimal(10, 2)), N'Sepeda', 1, N'32894fcc-32ff-45e7-b4c3-562c2156340d')
GO
INSERT [dbo].[Barang] ([BarangId], [NamaBarang], [Deskripsi], [HargaPerHari], [Kategori], [StatusKetersediaan], [PenyediaId]) VALUES (N'ecef6101-f331-4456-990a-b49af03624f7', N'Sewa Kamera DSLR', N'Kamera DSLR untuk foto profesional', CAST(350000.00 AS Decimal(10, 2)), N'Elektronik', 1, N'13ad10fa-0b13-4b25-8eb5-736aac86c2a5')
GO
INSERT [dbo].[Barang] ([BarangId], [NamaBarang], [Deskripsi], [HargaPerHari], [Kategori], [StatusKetersediaan], [PenyediaId]) VALUES (N'c94fc23e-d19d-4e5a-919f-c7a634654212', N'Sewa Tenda Camping', N'Tenda camping untuk kegiatan luar ruangan', CAST(150000.00 AS Decimal(10, 2)), N'Perlengkapan', 1, N'13ad10fa-0b13-4b25-8eb5-736aac86c2a5')
GO
INSERT [dbo].[Barang] ([BarangId], [NamaBarang], [Deskripsi], [HargaPerHari], [Kategori], [StatusKetersediaan], [PenyediaId]) VALUES (N'9f91aacc-6edf-4061-9bb7-cf8a4a364162', N'Sewa Proyektor', N'Proyektor untuk presentasi', CAST(200000.00 AS Decimal(10, 2)), N'Elektronik', 1, N'13ad10fa-0b13-4b25-8eb5-736aac86c2a5')
GO
INSERT [dbo].[Barang] ([BarangId], [NamaBarang], [Deskripsi], [HargaPerHari], [Kategori], [StatusKetersediaan], [PenyediaId]) VALUES (N'45a1e893-b555-4d82-99e0-e54f80c30b22', N'Sewa Motor Sport', N'Motor sport dengan performa tinggi', CAST(150000.00 AS Decimal(10, 2)), N'Motor', 1, N'120d5552-5d2c-4ac0-91bc-0228ec9e9681')
GO
INSERT [dbo].[Barang] ([BarangId], [NamaBarang], [Deskripsi], [HargaPerHari], [Kategori], [StatusKetersediaan], [PenyediaId]) VALUES (N'92dca226-7443-43b7-a44b-f862a170c02b', N'Sewa Mobil Sedan', N'Mobil sedan untuk sewa harian', CAST(300000.00 AS Decimal(10, 2)), N'Mobil', 1, N'120d5552-5d2c-4ac0-91bc-0228ec9e9681')
GO
INSERT [dbo].[Barang] ([BarangId], [NamaBarang], [Deskripsi], [HargaPerHari], [Kategori], [StatusKetersediaan], [PenyediaId]) VALUES (N'3dbd08e4-9c9c-4391-9dee-fee0e40f7e58', N'Sewa Kasur Lipat', N'Kasur lipat untuk penginapan', CAST(100000.00 AS Decimal(10, 2)), N'Perlengkapan', 1, N'13ad10fa-0b13-4b25-8eb5-736aac86c2a5')
GO
INSERT [dbo].[Penyedia] ([PenyediaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'120d5552-5d2c-4ac0-91bc-0228ec9e9681', N'Penyedia I', N'Jl. Diponegoro No.9, Palembang', N'081234567898', N'penyediaI@example.com')
GO
INSERT [dbo].[Penyedia] ([PenyediaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'ce9b2b25-f8d8-4026-b229-5620e0a6a0d5', N'Penyedia J', N'Jl. Pahlawan No.10, Malang', N'081234567899', N'penyediaJ@example.com')
GO
INSERT [dbo].[Penyedia] ([PenyediaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'32894fcc-32ff-45e7-b4c3-562c2156340d', N'Penyedia E', N'Jl. Thamrin No.5, Medan', N'081234567894', N'penyediaE@example.com')
GO
INSERT [dbo].[Penyedia] ([PenyediaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'2bc107ad-cf0c-4223-b7b8-6eece3fee9f8', N'Penyedia B', N'Jl. Kebangsaan No.2, Bandung', N'081234567891', N'penyediaB@example.com')
GO
INSERT [dbo].[Penyedia] ([PenyediaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'13ad10fa-0b13-4b25-8eb5-736aac86c2a5', N'Penyedia H', N'Jl. Malioboro No.8, Semarang', N'081234567897', N'penyediaH@example.com')
GO
INSERT [dbo].[Penyedia] ([PenyediaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'07c727a4-8541-4a87-b990-7dd30fdffa59', N'Penyedia G', N'Jl. Asia Afrika No.7, Makassar', N'081234567896', N'penyediaG@example.com')
GO
INSERT [dbo].[Penyedia] ([PenyediaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'7a17168d-f898-45c0-9fae-809430618cb8', N'Penyedia F', N'Jl. Gatot Subroto No.6, Bali', N'081234567895', N'penyediaF@example.com')
GO
INSERT [dbo].[Penyedia] ([PenyediaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'5be2479d-e1a8-4bcb-941a-efae9bf90e45', N'Penyedia A', N'Jl. Merdeka No.1, Jakarta', N'081234567890', N'penyediaA@example.com')
GO
INSERT [dbo].[Penyedia] ([PenyediaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'05665431-92f9-4410-88dd-fb785db02bdc', N'Penyedia D', N'Jl. Sudirman No.4, Yogyakarta', N'081234567893', N'penyediaD@example.com')
GO
INSERT [dbo].[Penyedia] ([PenyediaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'd5d88a2b-3950-433a-a280-fdec10a4e4b8', N'Penyedia C', N'Jl. Soekarno Hatta No.3, Surabaya', N'081234567892', N'penyediaC@example.com')
GO
INSERT [dbo].[Penyewa] ([PenyewaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'217f8a59-92b7-41b8-9308-0970848c7540', N'Penyewa B', N'Jl. Jendral Sudirman No.2, Bandung', N'081234567801', N'penyewaB@example.com')
GO
INSERT [dbo].[Penyewa] ([PenyewaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'f54e2c87-9311-4ae2-b345-451ab238b0de', N'Penyewa J', N'Jl. Cendana No.10, Malang', N'081234567809', N'penyewaJ@example.com')
GO
INSERT [dbo].[Penyewa] ([PenyewaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'007d4ee5-b17a-433a-bd02-545e7d3e808d', N'Penyewa E', N'Jl. Kebon Sirih No.5, Medan', N'081234567804', N'penyewaE@example.com')
GO
INSERT [dbo].[Penyewa] ([PenyewaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'0d85cea0-6080-4654-9040-6b9f72db6f32', N'Penyewa D', N'Jl. Pahlawan No.4, Yogyakarta', N'081234567803', N'penyewaD@example.com')
GO
INSERT [dbo].[Penyewa] ([PenyewaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'd3eace85-132a-4502-8ec2-6c4061784dd0', N'Penyewa F', N'Jl. Guntur No.6, Bali', N'081234567805', N'penyewaF@example.com')
GO
INSERT [dbo].[Penyewa] ([PenyewaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'685d33c2-eab0-4f58-8d4f-6c9c1070eeb5', N'Penyewa I', N'Jl. Anggrek No.9, Palembang', N'081234567808', N'penyewaI@example.com')
GO
INSERT [dbo].[Penyewa] ([PenyewaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'71ba7ae3-3c99-4ef6-8f43-77e12ed35155', N'Penyewa G', N'Jl. Udayana No.7, Makassar', N'081234567806', N'penyewaG@example.com')
GO
INSERT [dbo].[Penyewa] ([PenyewaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'cfdec95b-77eb-48bc-b202-9efd8d26e846', N'Penyewa A', N'Jl. Raya No.1, Jakarta', N'081234567800', N'penyewaA@example.com')
GO
INSERT [dbo].[Penyewa] ([PenyewaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'c1cb0c0e-e238-4ea7-863c-9fe2d59fde7c', N'Penyewa C', N'Jl. Diponegoro No.3, Surabaya', N'081234567802', N'penyewaC@example.com')
GO
INSERT [dbo].[Penyewa] ([PenyewaId], [Nama], [Alamat], [Telepon], [Email]) VALUES (N'c96bb6c2-fff2-40c7-aa89-c6362f583703', N'Penyewa H', N'Jl. Siliwangi No.8, Semarang', N'081234567807', N'penyewaH@example.com')
GO
INSERT [dbo].[Penyewaan] ([PenyewaanId], [BarangId], [PenyewaId], [TanggalMulai], [TanggalSelesai], [TotalHarga]) VALUES (N'73eea35c-eb50-4d11-a7f4-003a7d88a6a4', N'24489e70-32ae-4ec8-abc7-1b4f640389ee', N'cfdec95b-77eb-48bc-b202-9efd8d26e846', CAST(N'2024-11-09T00:00:00.000' AS DateTime), CAST(N'2024-11-13T00:00:00.000' AS DateTime), CAST(2000000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Penyewaan] ([PenyewaanId], [BarangId], [PenyewaId], [TanggalMulai], [TanggalSelesai], [TotalHarga]) VALUES (N'ee288863-a466-446a-b186-122cf5de9df5', N'24489e70-32ae-4ec8-abc7-1b4f640389ee', N'cfdec95b-77eb-48bc-b202-9efd8d26e846', CAST(N'2024-11-02T00:00:00.000' AS DateTime), CAST(N'2024-11-06T00:00:00.000' AS DateTime), CAST(2000000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Penyewaan] ([PenyewaanId], [BarangId], [PenyewaId], [TanggalMulai], [TanggalSelesai], [TotalHarga]) VALUES (N'65994755-7aef-4a24-9e29-4f35a313af7c', N'24489e70-32ae-4ec8-abc7-1b4f640389ee', N'cfdec95b-77eb-48bc-b202-9efd8d26e846', CAST(N'2024-11-05T00:00:00.000' AS DateTime), CAST(N'2024-11-09T00:00:00.000' AS DateTime), CAST(2000000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Penyewaan] ([PenyewaanId], [BarangId], [PenyewaId], [TanggalMulai], [TanggalSelesai], [TotalHarga]) VALUES (N'618bfeaa-2f32-4306-98e4-5503c850c4d0', N'24489e70-32ae-4ec8-abc7-1b4f640389ee', N'cfdec95b-77eb-48bc-b202-9efd8d26e846', CAST(N'2024-11-08T00:00:00.000' AS DateTime), CAST(N'2024-11-12T00:00:00.000' AS DateTime), CAST(2000000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Penyewaan] ([PenyewaanId], [BarangId], [PenyewaId], [TanggalMulai], [TanggalSelesai], [TotalHarga]) VALUES (N'001d0e9c-c036-40ad-8cf0-7aeab0cb43a2', N'24489e70-32ae-4ec8-abc7-1b4f640389ee', N'cfdec95b-77eb-48bc-b202-9efd8d26e846', CAST(N'2024-11-04T00:00:00.000' AS DateTime), CAST(N'2024-11-08T00:00:00.000' AS DateTime), CAST(2000000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Penyewaan] ([PenyewaanId], [BarangId], [PenyewaId], [TanggalMulai], [TanggalSelesai], [TotalHarga]) VALUES (N'4d5366b4-7167-426f-b6a0-98b9015eec15', N'24489e70-32ae-4ec8-abc7-1b4f640389ee', N'cfdec95b-77eb-48bc-b202-9efd8d26e846', CAST(N'2024-11-10T00:00:00.000' AS DateTime), CAST(N'2024-11-14T00:00:00.000' AS DateTime), CAST(2000000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Penyewaan] ([PenyewaanId], [BarangId], [PenyewaId], [TanggalMulai], [TanggalSelesai], [TotalHarga]) VALUES (N'150ddd8e-d9f1-4778-9d92-b7e753ca6f63', N'24489e70-32ae-4ec8-abc7-1b4f640389ee', N'cfdec95b-77eb-48bc-b202-9efd8d26e846', CAST(N'2024-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-05T00:00:00.000' AS DateTime), CAST(2000000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Penyewaan] ([PenyewaanId], [BarangId], [PenyewaId], [TanggalMulai], [TanggalSelesai], [TotalHarga]) VALUES (N'6a798c73-ee62-40b0-90f3-e48cdd401517', N'24489e70-32ae-4ec8-abc7-1b4f640389ee', N'cfdec95b-77eb-48bc-b202-9efd8d26e846', CAST(N'2024-11-06T00:00:00.000' AS DateTime), CAST(N'2024-11-10T00:00:00.000' AS DateTime), CAST(2000000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Penyewaan] ([PenyewaanId], [BarangId], [PenyewaId], [TanggalMulai], [TanggalSelesai], [TotalHarga]) VALUES (N'f9ca61fc-041e-4a9b-a988-f25e8e9b68d1', N'24489e70-32ae-4ec8-abc7-1b4f640389ee', N'cfdec95b-77eb-48bc-b202-9efd8d26e846', CAST(N'2024-11-07T00:00:00.000' AS DateTime), CAST(N'2024-11-11T00:00:00.000' AS DateTime), CAST(2000000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Penyewaan] ([PenyewaanId], [BarangId], [PenyewaId], [TanggalMulai], [TanggalSelesai], [TotalHarga]) VALUES (N'daa4d8d9-1ab5-4925-89c8-f70486c6fff4', N'24489e70-32ae-4ec8-abc7-1b4f640389ee', N'cfdec95b-77eb-48bc-b202-9efd8d26e846', CAST(N'2024-11-03T00:00:00.000' AS DateTime), CAST(N'2024-11-07T00:00:00.000' AS DateTime), CAST(2000000.00 AS Decimal(10, 2)))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Email]    Script Date: 06-Nov-24 1:32:40 AM ******/
ALTER TABLE [dbo].[Penyedia] ADD  CONSTRAINT [UC_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_EmailPenyewa]    Script Date: 06-Nov-24 1:32:40 AM ******/
ALTER TABLE [dbo].[Penyewa] ADD  CONSTRAINT [UC_EmailPenyewa] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Barang] ADD  DEFAULT (newid()) FOR [BarangId]
GO
ALTER TABLE [dbo].[Barang] ADD  DEFAULT ((1)) FOR [StatusKetersediaan]
GO
ALTER TABLE [dbo].[Penyedia] ADD  DEFAULT (newid()) FOR [PenyediaId]
GO
ALTER TABLE [dbo].[Penyewa] ADD  DEFAULT (newid()) FOR [PenyewaId]
GO
ALTER TABLE [dbo].[Penyewaan] ADD  DEFAULT (newid()) FOR [PenyewaanId]
GO
ALTER TABLE [dbo].[Transaksi] ADD  DEFAULT (newid()) FOR [TransaksiId]
GO
ALTER TABLE [dbo].[Transaksi] ADD  DEFAULT (getdate()) FOR [TanggalTransaksi]
GO
ALTER TABLE [dbo].[Barang]  WITH CHECK ADD FOREIGN KEY([PenyediaId])
REFERENCES [dbo].[Penyedia] ([PenyediaId])
GO
ALTER TABLE [dbo].[Penyewaan]  WITH CHECK ADD FOREIGN KEY([BarangId])
REFERENCES [dbo].[Barang] ([BarangId])
GO
ALTER TABLE [dbo].[Penyewaan]  WITH CHECK ADD FOREIGN KEY([PenyewaId])
REFERENCES [dbo].[Penyewa] ([PenyewaId])
GO
ALTER TABLE [dbo].[Transaksi]  WITH CHECK ADD FOREIGN KEY([PenyewaanId])
REFERENCES [dbo].[Penyewaan] ([PenyewaanId])
GO
ALTER TABLE [dbo].[Transaksi]  WITH CHECK ADD CHECK  (([StatusPembayaran]='Belum Lunas' OR [StatusPembayaran]='Lunas'))
GO

USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [sebarsenang]    Script Date: 06-Nov-24 1:48:26 AM ******/
CREATE LOGIN [sebarsenang] WITH PASSWORD=N'GLQcD+ENak70HW0aTIwOS27UqLK0O+rpf61XWOYyfJQ=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [sebarsenang] DISABLE
GO

ALTER SERVER ROLE [sysadmin] ADD MEMBER [sebarsenang]
GO

ALTER SERVER ROLE [securityadmin] ADD MEMBER [sebarsenang]
GO

ALTER SERVER ROLE [serveradmin] ADD MEMBER [sebarsenang]
GO

ALTER SERVER ROLE [setupadmin] ADD MEMBER [sebarsenang]
GO

ALTER SERVER ROLE [processadmin] ADD MEMBER [sebarsenang]
GO

ALTER SERVER ROLE [diskadmin] ADD MEMBER [sebarsenang]
GO

ALTER SERVER ROLE [dbcreator] ADD MEMBER [sebarsenang]
GO

ALTER SERVER ROLE [bulkadmin] ADD MEMBER [sebarsenang]
GO


