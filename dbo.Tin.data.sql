select top 3 p.NgayDang, p.NoiDung, TenNguoiDung
from Tin t, PhanHoi p, NguoiDung n
where t.IDTin = p.IDTin and p.IDNguoiDung = n.IDNguoiDung and T.IDTin = 16
ORDER BY p.IDPhanHoi DESC