create database store;

use store;

select * from supermarket;

--menghitung total quantity produk yang terjual
select sum(quantity) as quantity_total
from supermarket;

--menghitung jumlah total seluruh penjualan
select sum(sales) as total_sales
from supermarket;

--mencari mode pengiriman yang paling sering digunakan
select ship_mode, count(ship_mode) as total
from supermarket
group by ship_mode
order by count(ship_mode);

--menghitung jumlah pengunjung yang datang di setiap tahunnya
select year(order_date) as years, count(distinct customer_name) as Total_customer
from supermarket
group by year(Order_Date);

--menghitung total penjualan tiap tahunnya
select year(order_date) as years, sum(sales) as Total_sales
from supermarket
group by year(order_date)
order by year(order_date);

--menghitung rata-rata penjualan tiap tahun
select year(order_date) as year, avg(sales) as avg_sales
from supermarket
group by year(order_date)
order by year(order_date);

--mencari kategori barang yang paling banyak terjual
select category, count(category) as total_category
from supermarket
group by category
order by count(category);

--menghitung total sub kategori
select sub_category, count(sub_category) as total_sub_category
from supermarket
group by sub_category
order by count(sub_category);

--menghitung rata-rata penjualan tiap kategori
select category, avg(sales) as avg_sales
from supermarket
group by category;

--menghitung jumlah konsumen dari tiap kota
select city, sum(sales) as sales
from supermarket
group by city
order by sum(sales) desc;

--menghitung total jumlah quantity dan jumlah penjualan tiap sub category
select Sub_Category, sum(quantity) as total_quantity, sum(sales) as sales
from supermarket
group by Sub_Category;

--menghitung total penjualan di tiap negara bagian
select state, sum(sales) as sales
from supermarket
group by state
order by sum(sales) desc;

--mengkategorikan penjualan ke dalam kategori penjualan high, medium dan low
select category, quantity, sales,
CASE
	WHEN sales >= 1000 THEN 'high'
	WHEN sales <= 500 THEN 'low'
	else 'medium'
end as 'sales_category'
from supermarket
order by sales_category;
