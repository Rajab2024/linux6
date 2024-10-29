DriversCars    |
---------|-----|
Driver_id|CarID|
---------------+

----------------+
DriversFines    |
---------|------|
Driver_id|FineID|
----------------+




- Найти все тройки вида <тип штрафа, номер телефона водителя, модель автомобиля>

PA:
(Fines JOIN Drivers JOIN Cars)[FineType, Phone, Model]

ИК:
RANGE OF F IS Fines
RANGE OF D IS Drivers
RANGE OF C IS Cars
RANGE OF DC IS DriversCars
RANGE OF DF IS DriversFines
(F.FineType, D.Phone, C.Model) WHERE ((DF.Driver_id = D.Driver_id) AND (C.CarID = DC.CarID) AND (DC.Driver_id = D.Driver_id) AND (F.FineID = DF.FineID))

SQL: 
SELECT Fines.FineType, Drivers.Phone, Cars.Model
  FROM Fines 
  JOIN DriversFines
  	ON DriversFines.Driver_id = Drivers.Driver_id
  JOIN DriversCars
  	ON DriversCars.Driver_id = Drivers.Driver_id
  JOIN Cars
  	ON DriversCars.CarID = Drivers.CarID;




- Найти телефоны водителей, у которых есть белая машина 2018 года выпуска

PA:
((Drivers JOIN Cars) WHERE Cars[Color] = 'white' and Cars[Year] = 2018)[Phone]

ИК:
RANGE OF C IS (Cars) WHERE Cars.Year = 2018 AND Cars.Color = 'white'
RANGE OF D IS Drivers
RANGE OF DC IS DriversCars
(Drivers.Phone) WHERE ((D.Driver_id = DC.Driver_id) AND (C.CarID = DC.CarID)) 

SQL:
SELECT Drivers.Phone
  FROM Drivers
  JOIN DriversCars
  	ON Drivers.Driver_id = DriversCars.Driver_id
  JOIN Cars
    ON DriversCars.CarID = Cars.CarID
 WHERE Cars.Color = 'white' AND Cars.Year = 2018;



 - Для кадого водителя вычислить колическо зарегистрированных автомобимлей

ИК:
RANGE OF D IS Drivers
RANGE OF C IS Cars
RANGE OF DC IS DriversCars

(D.Driver_id, COUNT(WHERE (DC.Driver_id = C.Driver_id) AND (DC.CarID = C.CarID))  AS CarsCount)

SQL:
 SELECT DISTINCT(Drivers.Driver_id), COUNT(*)
   FROM Drivers
   JOIN DriversCars
     ON Drivers.Driver_id = DriversCars.Driver_id
   JOIN Cars
     ON Cars.Driver_id = DriversCars.Driver_id
  GROUP BY Drivers.Driver_id;
