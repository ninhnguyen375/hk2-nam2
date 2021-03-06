-- -- -- Create a new stored procedure called 'QLHocVien' in schema 'dbo'
-- -- -- Drop the stored procedure if it already exists
-- -- IF EXISTS (
-- -- SELECT *
-- -- FROM INFORMATION_SCHEMA.ROUTINES
-- -- WHERE SPECIFIC_SCHEMA = N'dbo'
-- --     AND SPECIFIC_NAME = N'tinhTong'
-- --     AND ROUTINE_TYPE = N'PROCEDURE'
-- -- )
-- -- DROP PROC dbo.tinhTong
-- -- GO
-- -- -- Create the stored procedure in the specified schema
-- -- CREATE PROC dbo.tinhTong
-- --     @x int,
-- --     @y int,
-- --     @tong int out
-- -- -- add more stored procedure parameters here
-- -- AS
-- -- begin
-- --     set @tong = @x + @y
-- -- end
-- -- GO
-- -- DECLARE @tong int
-- -- EXEC dbo.tinhTong 1, 2, @tong out
-- -- print @tong
-- -- GO
-- -- Add a new column '[DanhGia]' to table '[TableName]' in schema '[dbo]'
-- -- ALTER TABLE [dbo].[MONHOC]
-- --     ADD [DanhGia] /*new_column_name*/ NVARCHAR(20) /*new_column_datatype*/ NULL /*new_column_nullability*/
-- -- GO
-- -- -- Dieu kien 1
-- -- create proc uspKiemTraDK1 @MaMH NVARCHAR(50), @kq int out
-- -- as 
-- -- BEGIN
-- --     if(not exists (select * from MONHOC mh WHERE mh.MaMonHoc = @MaMH ))
-- --         set @kq = 0
-- --     else 
-- --         set @kq = 1
-- -- END
-- -- go 
-- -- -- Dieu kien 2
-- -- create proc uspKiemTraDK2 @MaMH NVARCHAR(50), @kq int out
-- -- as 
-- -- BEGIN
-- --     if((select count(*) from GIAOVIEN_DAY_MONHOC gv WHERE gv.MaMH = @MaMH ) < 2)
-- --         set @kq = 0
-- --     else 
-- --         set @kq = 1
-- -- END
-- -- go 
-- -- DECLARE @kq int
-- -- exec uspKiemTraDK2 'MH00001', @kq out
-- -- print @kq
-- -- Add a new column '[DanhGia]' to table '[GIAOVIEN_DAY_MONHOC]' in schema '[dbo]'
-- -- ALTER TABLE [dbo].[GIAOVIEN_DAY_MONHOC]
-- --     ADD [DanhGia] /*new_column_name*/ NVARCHAR(20) /*new_column_datatype*/ NULL /*new_column_nullability*/
-- -- -- GO
-- -- IF EXISTS (
-- -- SELECT *
-- -- FROM INFORMATION_SCHEMA.ROUTINES
-- -- WHERE SPECIFIC_SCHEMA = N'dbo'
-- --     AND SPECIFIC_NAME = N'uspKiemTraDK2'
-- --     AND ROUTINE_TYPE = N'PROCEDURE'
-- -- )
-- -- DROP PROC dbo.uspKiemTraDK2
-- -- GO
-- -- create proc uspKiemTraDK2
-- --     @MaGV VARCHAR(50),
-- --     @MaMH VARCHAR(50),
-- --     @kq int out
-- -- as
-- -- BEGIN
-- --     if((select count(*)
-- --         from PHANCONG pc
-- --         WHERE pc.MaGV = @MaGV and 
-- --             @MaMH  = pc.MaMH) < 2 )
-- --         set @kq = 0
-- --     else
-- --         set @kq = 1
-- -- END
-- -- go
-- -- DECLARE @kq int
-- -- EXEC uspKiemTraDK2 'GV00005   ','MH00008   ', @kq out
-- -- print @kq
-- -- Create a new stored procedure called 'tinh3' in schema 'dbo'
-- -- Drop the stored procedure if it already exists
-- IF EXISTS (
-- SELECT *
-- FROM INFORMATION_SCHEMA.ROUTINES
-- WHERE SPECIFIC_SCHEMA = N'dbo'
--     AND SPECIFIC_NAME = N'tinh3'
--     AND ROUTINE_TYPE = N'PROCEDURE'
-- )
-- DROP PROCEDURE dbo.tinh3
-- GO
-- -- Create the stored procedure in the specified schema
-- CREATE PROCEDURE dbo.tinh3
--     @MaGV VARCHAR(50),
--     @MaMH VARCHAR(50),
--     @kq int out
-- -- add more stored procedure parameters here
-- AS
-- BEGIN
--     DECLARE @tongMon int
--     DECLARE @tongDay int
--     select @tongMon = count(*)
--     from PHANCONG pc
--     WHERE pc.MaMH = @MaMH
--     select @tongDay = count(*)
--     from PHANCONG pc
--     WHERE pc.MaGV = @MaGV and pc.MaMH = @MaMH
--     print @tongDay
--     print @tongMon
--     if(2 <= 1)
--         print '='
--     else print 'ko ='
--     print << @tongDay >> + << @tongMon >>
-- END
-- GO
-- DECLARE @kq int
-- EXEC tinh3 'GV00005   ','MH00008   ', @kq out
-- print @kq
-- CREATE FUNCTION tinhdtb (@mahv VARCHAR(50))
-- RETURNS FLOAT
-- AS
-- BEGIN
--     DECLARE @stc INT
--     DECLARE @d FLOAT

--     SELECT @stc = sum(mh.sochi)
--         , @d = sum(kq.diem * mh.sochi)
--     FROM ketqua kq
--         , monhoc mh
--     WHERE kq.mamonhoc = mh.mamonhoc
--         AND kq.lanthi >= ALL (
--             SELECT kq1.lanthi
--             FROM ketqua kq1
--             WHERE kq1.mamonhoc = kq.mamonhoc
--                 AND kq1.mahv = kq.mahv
--             )
--         AND kq.mahv = @mahv

--     RETURN round(@d / @stc, 2)
-- END

-- SELECT malop
--     , dbo.ninh2(malop) 'TB LOP'
-- FROM LOPHOC

-- CREATE FUNCTION ninh2 (@malop VARCHAR(50))
-- RETURNS FLOAT
-- AS
-- BEGIN
--     DECLARE @tb FLOAT

--     SELECT @tb = avg(dbo.tinhdtb(mahocvien))
--     FROM hocvien h
--     WHERE h.MaHocVien IN (
--             SELECT k.MaHV
--             FROM ketqua k
--             )
--         AND h.MaLop = @malop

--     RETURN @tb
-- END


select hv.MaHocVien, hv.TenHocVien
from HOCVIEN hv WHERE hv.TenHocVien like N'%a%'