-- -------------------------------------------------------------
-- TablePlus 3.1.2(296)
--
-- https://tableplus.com/
--
-- Database: develop
-- Generation Time: 2563-02-26 14:03:02.0690
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE `orders` (
  `customer_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `item` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `sold_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB;

INSERT INTO `customer` (`id`, `name`) VALUES
('1', 'John'),
('2', 'Jame'),
('3', 'JoJo');

INSERT INTO `orders` (`customer_id`, `order_id`, `item`, `price`, `sold_at`) VALUES
('1', '1', 'Samsung', '1000', '2020-02-26 06:56:22'),
('1', '1', 'Huawei', '800', '2020-02-26 06:56:22'),
('1', '2', 'iPhone', '1200', '2020-02-28 06:56:22'),
('2', '3', 'Samsung', '1000', '2020-02-10 06:56:22'),
('2', '4', 'iPhone', '1200', '2020-02-20 06:56:22'),
('3', '5', 'Case Samsung', '100', '2020-02-05 06:56:22'),
('3', '5', 'Samsung', '1000', '2020-02-05 06:56:22');




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;