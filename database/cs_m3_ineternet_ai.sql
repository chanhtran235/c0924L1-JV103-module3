
create database if not exists cs_m3_ineternet_ai;
use cs_m3_ineternet_ai;

CREATE TABLE `User` (
  `Id`  int primary key auto_increment,
  `Username` varchar(50),
  `Password` varchar(50),
  `isAdmin` bool
);

CREATE TABLE `Computer` (
   `Id`  int primary key auto_increment,
  `Name` varchar(50),
  `Description` varchar(50),
  `Status` varchar(50)
);

CREATE TABLE `Service` (
   `Id`  int primary key auto_increment,
  `ServiceName` varchar(50),
  `Description` text,
  `Price` float
);

CREATE TABLE `Customer` (
   `Id`  int primary key auto_increment,
  `Name` varchar(50),
  `Email` varchar(50)
);

CREATE TABLE `Rental` (
  `Id`  int primary key auto_increment,
  `ComputerId` int,
  `CustomerId` int,
  `StartTime` datetime,
  `EndTime` datetime,
  `TotalCost` float
);

CREATE TABLE `AdditionalService` (
 `Id` int auto_increment,
  `RentalId` varchar(50),
  `ServiceId` varchar(50),
  `Quantity` int
);

