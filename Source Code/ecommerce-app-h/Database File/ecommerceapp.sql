-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2021 at 06:54 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerceapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(1, 'Abhiram', 'abhirammakam1729@gmail.com', 'abhirammakam1729', '0'),
(2, 'Anvesh crazyboy', 'anvesh@gmail.com', 'anvesh', '0'),
(3, 'Chandra shekhar', 'chandra@gmail.com', 'chandra', '0'),
(4, 'Gouri Pranay', 'pranay@gmail.com', 'pranay', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HealthXP'),
(2, 'Gorilla Labs'),
(3, 'Labrada'),
(4, 'BigMuscles'),
(5, 'MuscleBlaze'),
(6, 'NitroTech'),
(7, 'Gold Standards'),
(8, 'HerboBuild'),
(9, 'Optimum Nutrition'),
(10, 'GET RAW NUTRITION'),
(11, 'MTS NUTRITION');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(1, 4, '::1', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Protein'),
(3, 'Vitamin'),
(4, 'Creatine'),
(5, 'BCAA'),
(6, 'pre workout'),
(12, 'L-Carnitine'),
(13, 'Fat Burner');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 2, 1, 1, '9L434522M7706801A', 'Completed'),
(2, 1, 2, 1, '9L434522M7706801A', 'Completed'),
(3, 1, 3, 1, '9L434522M7706801A', 'Completed'),
(4, 2, 1, 1, '8AT7125245323433N', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 2, 1, 'HealthXP Whey Protein 2 kg', 3649,7, 'HealthXP 100% Whey Protein 2 Kg is one of the best health supplements that comes with rich quality ultra-filtered whey protein concentrate that helps you in building muscles and recovering fast after hard workouts. It delivers 25 grams (per serving) of fast-digesting Whey with insignificant ratios of fat lactose and cholesterol. Whether it’s to improve the metabolism of your body, accelerate immunity or to enhance your energy & stamina, this supplement fulfils all.', 'hxp_p.PNG', 'HealthXP, Protein, pro'),
(2, 6, 1, 'HealthXP L-Arginine For Men & Women, Amino Acid For Muscle Building & Endurance, Faster Recovery, Reduce Fatigue,300 Gm, Unflavoured ( 60 Servings )', 749, 15, 'L-Arginine is an essential amino acid that plays an important role in the synthesis of nitric oxide and hence primarily acts as a nitric oxide precursor. Supplying additional L-arginine will help maximize the potential nitric oxide production thus enhancing and optimizing vasolidation which helps relaxing of smooth muscle cells within arterial blood vessels. It will also enhance muscle pumps, oxygen and nitrogen utilization and nutrient delivery. ', 'hxp_pw.PNG', 'HealthXP, pre workout, pre'),
(3, 4, 1, 'HealthXP Micronized Creatine Monohydrate, 0.66 lbs, 300 gms ( 100 Servings )', 899, 11, 'Creatine fuels intense weight training and endurance activities to push harder, go faster and recover quicker. In the process, it stimulates lean muscle mass, acts as a support system to prevent against muscle breakdown, and aids in muscle recovery.', 'hxp_c.PNG', 'HealthXP, Creatine, c'),
(4, 13, 1, 'HealthXP Fat Burner For Both Men & Women With Herbs, L-Carnitine, Garcinia Cambogia, Green Coffee Beans & Green Tea Extracts For Weight Loss, 100 Caps', 399, 18, 'HealthXP Fat Burner is a blend of natural ingredients including 180mg Green Tea Extract, 50mg green coffee beans extract, and 100mg of L-Carnitine per serving that help lose weight naturally.', 'hxp_f.PNG', 'HealthXP, Fat Burner, f'),
(5, 3, 1, 'HealthXP Vitamin C & Zinc For Men & Women, With Multivitamin & Minerals To Builds Immunity And Supports Various Enzyme Functions | Antioxidant & Skincare – 60 Caps', 299, 10, 'It contains Vitamin C 500mg & Zinc 5mg. Vitamin C with Zinc is better absorbed in the body. It provides powerful antioxidant protection. Helps to maintain normal immune system activity during and after intensive physical activity. Vitamin C helps to ensure the normal metabolism of energy.', 'hxp_v.PNG', 'HealthXP, Vitamin, v'),
(6, 5, 1, 'HealthXP Prime BCAA 0.55 lbs, 250 gm Unflavoured ( 50 Servings )', 599, 6, 'HealthXP Prime BCAA is pure, potent and instantized amino acid supplement which reduces muscle soreness and maintains lean muscle mass. It contains three amino acids, L- Leucine, L-Isoleucine and L-Valine in the ratio 2:1:1 which reduces protein catabolism. This helps in muscle recovery, repair and in building stamina and endurance. It is ideal for both athletes and active adults who prefer consuming daily dosage after workouts.', 'hxp_b.PNG', 'HealthXP, BCAA, b'),
(7, 12, 1, 'HealthXP L-Carnitine Liquid Supplement with 3000 mg of Pure L-Carnitine Per Serving | Fat Burners for Men & Women – 30 Servings', 899, 12, 'HealthXP LIQUID CARNITINE 3000 providing the perfect complement to any fat burners or diet regimen. Packed with 3000mg of Carnipure™ liquid L-Carnitine per serving, it delivers one of the highest doses available. It’s great tasting and also free of artificial colours and flavours. it’s perfect for sports enthusiasts, weightlifters, athletes and anyone trying to improve their fitness and conditioning. It’s one of the most versatile supplements athletes can utilize. L-Carnitine helps the body convert food to energy, providing support for endurance exercise (aerobic) and during recovery from high-intensity activities such as weightlifting and sprinting', 'hxp_l.PNG', 'HealthXP, L-Carnitine, ca'),
(8, 2, 2, 'Gorilla Labs 100% Whey Protein Isolate & Concentrate 5.5 lbs, 2.5Kg', 4900, 15, 'Gorilla Whey serves as an optimal source of protein in delicious flavours to replenish nutrients post-workout . Every scoop is packed with 25g of fast-acting protein and digestive enzymes so that you can feed your muscles any time of the day. And it has minimal fat and carbs, so you’re left with a clean, simple protein. Whey protein is the most important weapon in your muscle-building arsenal. It promotes muscle growth counteracts muscle breakdown and supports your workout recovery.', 'gl_p.PNG', 'Gorilla Labs, Protein, pro'),
(9, 6, 2, 'Gorilla Labs Pump for Explosive Energy & Superior focus 0.66 lbs, 300 gm ( 30 Servings )', 1495, 20, 'Burn excess body fat and reshape your physique faster and more efficiently than ever before. Hyper Burn is a unique thermogenic supplement scientifically formulated to promote increased metabolism and control appetite. Hyper Burn is a breakthrough nutritional support formula to optimize your body’s metabolism. N Acetyl L Carnitine transports fat into the mitochondria where it works in concert with other metabolism promoters. Yohimbine has an extremely high affinity for the 2-adrenoreceptor (2-AR). These receptors (primarily in fat cells) control the rate of release of stored fat. By blocking Alpha 2 receptors, free fatty acids are released into the bloodstream so fat may be effectively burned o as energy. Combined with the potential appetite suppressant effects, this makes for a formidable fat burner. The end result is a great-tasting, easy-to-mix, healthy supplement that you can take any time to build Lean muscle and burn fat. Use Hyper Burn Formula to take your daily performance to a new level and achieve a lean, shredded physique.', 'gl_pw.PNG', 'Gorilla Labs, pre workout, pre'),
(10, 4, 2, 'Gorilla Labs ATP Surge 0.66 lbs, 300 gm ( 100 Servings )', 1000, 8, 'ATP Surge is the first-time fusion of Creatine Nitrate, Creatine Hydrochloride, and Creatine Monohydrate, along with Coconut Water Powder electrolyte matrix, will help you push harder, get stronger, recover quicker, and reach your goals faster than ever before. Experience the progress with every rep. ATP SURGE is an advanced blend of three forms of creatine, ie Creatine HCL, Creatine Nitrate & Creatine Monohydrate to provide you with explosive power and advanced muscle-building properties. ATP SURGE work synergistically to increase strength, stamina, recovery and blood-flow-vasodilatation. Also increase Nitric Oxide production that promotes muscle growth, increased strength, and faster muscle recovery.', 'gl_c.PNG', 'Gorilla Labs, Creatine, c'),
(11, 13, 2, 'Gorilla Labs Hyper Burn 0.66 lbs, 300 gm ( 60 Servings )', 1499, 10, 'Burn excess body fat and reshape your physique faster and more efficiently than ever before. Hyper Burn is a unique thermogenic supplement scientifically formulated to promote increased metabolism and control appetite. Hyper Burn is a breakthrough nutritional support formula to optimize your body’s metabolism. N Acetyl L Carnitine transports fat into the mitochondria where it works in concert with other metabolism promoters. Yohimbine has an extremely high affinity for the 2-adrenoreceptor (2-AR). These receptors (primarily in fat cells) control the rate of release of stored fat. By blocking Alpha 2 receptors, free fatty acids are released into the bloodstream so fat may be effectively burned o as energy. Combined with the potential appetite suppressant effects, this makes for a formidable fat burner. The end result is a great-tasting, easy-to-mix, healthy supplement that you can take any time to build Lean muscle and burn fat. Use Hyper Burn Formula to take your daily performance to a new level and achieve a lean, shredded physique.', 'gl_f.PNG', 'Gorilla Labs, Fat Burner, f'),
(12, 12, 3, 'Labrada Liquid Carnitine 450 ml', 1549, 12, 'Labrada L-Carnitine Liquid is a fast-acting liquid amino acid. L-Carnitine is an amino acid that plays a vital role in the metabolism of fat, and aids in the release of stored body fat and triglycerides into the bloodstream for energy. L-Carnitine also boosts energy by stimulating the body’s burning of triglycerides as fuel.', 'l_l.PNG', 'Labrada, L-Carnitine, ca'),
(13, 3, 3, 'Labrada Multivitamin 100 Tablets', 799, 16, 'Labrada’s Multi-vitamin gives you essential vitamins, minerals, and micronutrients that your body requires. This vegetarian product has 100 servings. Take 1 tablet daily. Labrada’s MULTI-VITAMIN has a single motto that is to keep our health in good condition. Each tablet contains essential vitamins, minerals, enzymes & other essential nutrients. The vitamins & minerals significantly reduce various physical as well as mental health problems. The enzymes play an essential role in physiological processes throughout the body such as it helps to improve digestion.', 'l_v.PNG', 'Labrada, Vitamin, v'),
(14, 6, 3, 'Labrada Super Charge Pre-Workout (L-Arginine, L-Citrulline Malate, Beta Alanine, Caffeine Anhydrous, Ashwagandha Extract, Zinc) 35 Servings', 2199, 7, 'Labrada’s SUPER CHARGE provides all the key nutrients that the athletes want to have. Per serving provides muscle pump & energy. For muscle pump, a blend of ingredients meant to increased blood and oxygen flow to working muscles during exercise. In every serving, contains 750mg L-Citrulline Malate and 1.5g L-arginine. Contains L-Theanine & Caffeine may help increase energy and cognitive performance. It also provides Ashwagandha & zinc could help increase testosterone levels in stressed individuals, possibly by reducing the stress hormone.', 'l_pw.PNG', 'Labrada, pre workout, pre'),
(15, 4, 3, 'Labrada Crealean 250gm, 0.55lb', 1099, 13, 'CreaLean 100% Creatine Monohydrate contains only pure creatine monohydrate. Research shows that daily oral administration of creatine monohydrate increases muscle stores of creatine, resulting in lean body mass gains. Creatine supplementation may also increase muscle torque production, support healthy levels of plasma ammonia, and aid muscle fiber in maintaining a high phosphocreatine level, resulting in the ability to sustain higher workout intensity levels for longer periods of time. Lee Labrada’s Quality Guarantee: “If it’s on the label, it’s in the bottle!” – This product is an independent lab assayed for purity.', 'l_c.PNG', 'Labrada, Creatine, c'),
(16, 2, 3, 'Labrada 100% Whey 2.2 lbs, 1 kg', 2599, 9, 'Labrada’s 100 percent whey protein is an excellent source of all the essential amino acids and is extremely rich in the branched chain amino acids (bcaas) leucine, isoleucine and valine. Bcaas make up one-third of muscle protein and are important to athletes because training increases the body’s demand for them. An adequate supply of bcaas in the blood is insurance against loss of muscle size and strength. Labrada’s 100 percent whey protein is also high in glutamine, which accounts for approximately 60 percent of all free amino acids in the body. It is made by a unique micro-filtration process that involves no heat or acid treatment like that used in ion-exchange whey protein production. Labrada’s 100 percent whey protein is gluten-free, perfect for individuals who must avoid gluten because they suffer from gluten sensitivities.', 'l_p.PNG', 'Labrada, Protein, pro'),
(17, 6, 4, 'FREAK - 15 servings', 549, 18, 'Feel extreme energy, mental focus, powerful pumps.  Breakthrough high boost matrix for maximum training intensity.freak next level pre-workout formulated increase feel extreme energy or mental focus . https://bit.ly/37pEQaS', 'bm_pw.PNG', 'Pre workout , pre , BigMuscles , FREAK'),
(18, 3, 4, 'VITAMIN D3', 319, 12, 'Vitamin D3 - Support Healthy Bone Immune System and Dental Health Calcium Absorption for Healthy Bones.As a dietary supplement, take 1 tablet once daily with meal.Calcium Absorption for Healthy Bones . https://bit.ly/3CVdN36', 'bm_v.PNG', 'vitamin , BigMuscles , VITAMIN D3 , D 3, v'),
(19, 2, 4, 'BigMuscles PREMIUM GOLD WHEY PROTEIN - 1kg', 1649, 10, 'Premium Gold Whey protein is made using the world finest quality of Whey Protein Isolate & Whey protein concentrate. Serves 25gm of High-quality protein per serving of 35gms. https://bit.ly/3CLiDjl', 'bm_p.PNG', 'BigMuscles , protein, pro'),
(20, 5, 4, 'REAL BCAA - 50 servings', 849, 15, 'Real BCAA - Intra-Workout powder for muscle growth & recovery.5 gm of Micronized 100% Vegan BCAA.100% Gluten & Preservative free prevent muscle loss.5 gm of Micronized. - 100% Vegan BCAA. https://bit.ly/3JjS474', 'bm_b.PNG', 'BCAA , BigMuscles , REAL BCAA, b'),
(21, 12, 4, 'CARNICUT (LIQUID CARNITINE)', 749, 20, 'Endurance in physical performance.Assists in conversion of Fat into ATP.Surpasses ordinary L-Carnitine. https://bit.ly/3Jk2sM6', 'BM_L.PNG', 'BigMuscles , bm , l- CARNITINE , l , carnitine, c'),
(22, 2, 5, 'MuscleBlaze Biozyme Performance Whey - 1kg', 2399, 15, 'MuscleBlaze ® Biozyme Performance Whey is a Labdoor, USA tested & certified whey protein formulation with the highest possible grading of A+ for its all-accurate claims & purity. Launched in a delicious Rich Chocolate flavour . https://bit.ly/3w8iqW4', 'mb_p.PNG', 'MuscleBlaze , Protein , mb , blaze, pro'),
(23, 3, 5, 'MuscleBlaze MB-VITE Daily Multivitamin', 529, 10, 'New & Improved Formulation: MB-Vite now has the potency of 6 powerful blends and 50 plus perfectly balanced ingredients. It enhances your lifestyle by upgrading your energy and endurance. https://bit.ly/3iivlwh', 'mb_v.PNG', 'Vitamin , MuscleBlaze, v'),
(24, 4, 5, 'MuscleBlaze Creatine Monohydrate - 250gm', 899, 16, 'Each serving of MuscleBlaze Creatine Monohydrate serves 3g of fast-absorbing micronized creatine for building strength and endurance . Instant absorption of creatine gives a continuous supply of energy to your muscles . https://bit.ly/3I9B3eE', 'mb_c.PNG', 'Creatine , MuscleBlaze, c'),
(25, 5, 5, 'MuscleBlaze BCAA Pro Essential Amino Acids', 999, 18, 'The new MuscleBlaze BCAA Pro Twin Flavour Pack offers two refreshing flavour options- Fruit Splash & Watermelon in a single unit .MuscleBlaze BCAA Pro is a robust intra-workout supplement that enhances your energy and muscle recovery. https://bit.ly/37AdNtH', 'mb_b.PNG', 'BCAA , MuscleBlaze, b'),
(26, 6, 5, 'MuscleBlaze Pre Workout Ripped - 250gm', 1700, 12, 'Pre-Workout Ripped is the new benchmark product from the house of MuscleBlaze® which fuels your mind and body and prepare you for intense workouts and burns fats simultaneously. https://bit.ly/3wjkhqW', 'mb_pw.PNG', 'pre workout , MuscleBlaze , caffeine, pre'),
(27, 12, 5, 'MuscleBlaze Liquid L-Carnitine', 799, 8, 'MuscleBlaze Liquid L-Carnitine offers 1100mg L-carnitine per serving. L- Carnitine helps in facilitating the transfer of long chain fatty acids to the cells to be metabolized into energy . https://bit.ly/3JjijL8', 'mb_l.PNG', 'MuscleBlaze , L-Carnitine , l , ca'),
(28, 13, 5, 'MuscleBlaze MB Fat Burner PRO', 849, 14, 'The all new & improved MuscleBlaze MB Burner Pro comprises super ingredients in potent quantities that will accelerate your weight management goals . https://bit.ly/3ia6mvd', 'mb_fb.PNG', 'Fat Burner , MuscleBlaze , fat, f'),
(29, 2, 6, 'Nitrotech protein Whey - 30g', 2389, 15, 'Nitrotech protein ,High on Whey Protein: MuscleTech Nitro-Tech provides you with lean muscle building 30g of premium whey protein, primarily from whey protein peptides and whey protein isolate  https://bit.ly/3q9Pmd7', 'nitro-tech elite protein.jpg', 'nitrotech , Protein , pro'),
(30, 4, 6, 'Nitrotech creatine- 30g', 4999, 18, 'Nitrotech creatine, Muscletech Nitro-Tech is a scientifically engineered whey isolate+ lean musclebuilder formula designed for all athletes who are looking for more muscle, more strength and better performance..https://bit.ly/3q9Pmd7 ', 'nitrotech cartine.jpg', 'nitrotech , creatine , c'),
(31, 6, 6, 'Nitrotech pre workout  - 1.81kg', 1899, 12, 'Nitrotech pre workout ,MuscleTech® designed this one-of-a-kind formula to deliver ultra-pure protein plus real weight loss results.NITRO-TECH RIPPED first provides a 30g blend of whey peptides and isolates for digestibility, https://bit.ly/34PileI', 'prreworkout.jpg', 'nitrotech , pre workout , pre'),
(32, 5, 6, 'Nitrotech Bcca  - 1.81kg', 1400, 8, 'Nitrotech bcca ,Nitro-Tech® contains protein sourced primarily from whey protein isolate and whey peptides – two of the cleanest and purest protein sources available. https://bit.ly/3thFpMF', 'nitro-tech bcca.jpg', 'nitrotech , bcca , b'),
(33, 5, 7, 'Gold standards Bcca  - 281g', 1948, 20, 'Gold standards bcca ,Health mall is distributor of now foods, jarrow formulas, nordic naturals, doctors besthttps://amzn.to/3iamxIO', 'golden standards bcaa.jpg', 'gold standards , bcca, b '),
(34, 2, 7, 'Gold standards proteins  - 1.81kg', 760, 14, 'Gold standards proteins Each serving of the world’s best-selling whey protein powder provides 24 grams of high-quality whey protein primarily from Whey Protein Isolatehttps://bit.ly/3MZ72C2', 'gold-standard protein.jpg', 'gold standards ,proteins , pro'),
(35, 12, 7, 'Gold standards l-carnite  - 21b', 6817, 18, 'Gold standards l-carnite a ,Acetyl-L-carnitine (ALCAR) is a supplement that improves mood, learning, and memory. ALCAR also may assist with thermogenesis, which can increase your endurance, give you an edge in the gym, and help you recover faster. https://bit.ly/3i9FueQ', 'l-carnite gold standards.jpg', 'gold standards, l-carnite , ca'),
(36, 6, 7, 'Gold standards pre-workout - 0.3kg', 2451, 6, 'Nitrotech bcca VITAMIN D Provides Immune Support PACKAGING MAY VARY - New look, with the same trusted Quality 175MG OF CAFFEINE- help fuel your mind and body to train at the highest level', 'gold standard pre workout.jpg', 'gold standards,preworkout , pre'),
(37, 2, 8, 'Herbobuild proteins', 289, 15, 'Herbobuild proteins ,HerboBuild is an Ayurvedic supplement for bodybuilders, athletes, and fitness enthusiasts to build muscle mass, strength, and stamina naturally.https://bit.ly/3qaMaxI', 'herbobiuld proteins.jpg', 'herbo build, proteins , pro'),
(38, 4, 9, 'Optimum Nutrition (ON) Micronized Creatine Powder - 250gm', 999, 12, 'Optimum Nutrition (ON) Micronized Creatine Powder - 250 Gram, 83 Serves, 3g of 100% Creatine Monohydrate per serve, Supports Athletic Performance & Power, Unflavored.Creatine is naturally produced in our body and it is used in the recycling of ATP which is our body’s energy currency. Creatine monohydrate is one of the most well-researched sports nutrition ingredients. When used in combination with regular weight training, it has been shown to support athletic performance and power.', 'ON_creatine.JPG', 'ON(Optimum Nutrition), ON, Optimum Nutrition, creatine, c'),
(39, 6, 9, 'Optimum Nutrition Gold Standard Pre-Workout - 300grams', 2518, 15, 'Optimum Nutrition Gold Standard Pre-Workout 175 mg Caffeine per Serving From Natural Sources 3 Grams of Creatine Monohydrate Per Serving 1.5 Grams of Beta-Alanine Per Serving, GOLD STANDARD PRE-WORKOUT combines caffeine from natural sources with creatine monohydrate and beta-alanine to help you unleash energy, focus, performance and endurance. Whether your goal is reach the pinnacle of your game, crush your next set, or get that last rep, get your energy with the pre-workout from one of the most trusted brands in sports nutrition. link:  https://bit.ly/3t9WuG', 'ON_pre_workout.JPG', 'ON(Optimum Nutrition), ON, Optimum Nutrition, pre'),
(40, 5, 9, 'Optimum Nutrition (ON) Instantized BCAA 5000 Powder - 60 Servings - (345 g)', 3110, 18, 'ON’s BCAA 5000 Powder delivers five grams of BCAAs per serving in the preferred 2:1:1 ratio of leucine to isoleucine and valine.* It’s instantized for easy mixing into water, juice or post-workout shakes. Mix the unflavored powder into any type of shake and enjoy! link:https://bit.ly/3JlD6h9', 'ON_bcaa.jpg', 'ON(Optimum Nutrition), ON, Optimum Nutrition, bcaa, b'),
(41, 2, 9, 'Optimum Nutrition (ON) Gold Standard 100% Whey Protein Powder - 907 g', 3059, 9, 'Each serving of the world’s best-selling whey protein powder provides 24 grams of high-quality whey protein primarily from Whey Protein Isolate, which has had excess carbohydrates, fat, and lactose ‘isolated’ out using sophisticated filtering technologies. The powder is also instantized for easy mixing using just a glass and spoon. With more than 20 different flavors – including naturally flavored options – there’s no doubt this is the Optimum Nutrition Gold Standard 100% Whey Protein. link:https://bit.ly/3CRgJ0l', 'ON_protein.jpg', 'ON(Optimum Nutrition), ON, Optimum Nutrition, protein, pro'),
(42, 3, 9, 'OPTI-MEN/ OPTI-WOMEN - 150 tablets', 2240, 14, 'Optimum Nutrition, On Opti-Men Multivitamin - 150 Tablets, providing 75+ active ingredients in 4 blends specifically designed to support the nutrient needs of active men/women. Each 3-tablet serving provides free form amino acids, antioxidant vitamins A, C and E, essential minerals and botanical extracts in foundational amounts that can be built on by consuming a healthy, balanced diet.¹ link:https://bit.ly/3wuOTGr', 'ON_vitamin.jpg', 'ON_vitamin, vitamin, v'),
(43, 6, 10, 'GET RAW NUTRITION RAW Pre', 3000, 17, 'RAW Pre comes loaded with ingredients that promote nitric oxide production, blood flow and cellular hydration. This formula includes agmatine sulfate, Nitrosogine®, and Glycersize™. Agmatine sulfate and Nitrosogine® are well-known and reliable ingredients – both with the ability to increase the body’s production of nitric oxide and blood flow into muscles. Glycersize™ enhances hydration of muscle tissue, further promoting intramuscular nutrient status. Together, these ingredients combine to support a performance ready environment for working muscle and sustained contractions. link:https://bit.ly/3MWQCtA', 'get_raw_pre.jpg', 'pre_workout, raw_pre, pre'),
(44, 2, 10, 'GET RAW NUTRITION PROTEIN - 900 g', 3850, 8, 'RAW Nutrition brings you our grass-fed micro-filtered isolate protein. Each scoop packs 25 grams of the highest quality protein with 0.5g of total fat and 1 gram of carbohydrates. RAW Protein is flavored with an all-natural sweetener - sweetly stevia to ensure superior taste with a 100% all-natural sweetener. RAW Protein does increase the gram per serving in order to get the perfect taste but it does not lower the quality of the whey protein itself. link:https://bit.ly/3iceyez', 'get-raw-protein.jpg', 'get_raw_protein, raw_protein, protein, pro'),
(45, 13, 10, 'GET RAW NUTRITION BURN - 516 - 30 servings', 2800, 14, 'RAW Nutrition brings you our fat loss formula which is based on creating an environment for fat burning and increasing thermogenesis without creating a high stimulant effect from caffeine. RAW Burn contains only 150mg of caffeine from green tea. Our focus on this product was creating a formulation of ingredients that are proven to increase fat loss and thermogenesis over time. Raw burn contains researched ingredients like acetyl-l-carnitine at 3,000mg, l-tyrosine at 3,000mg, yohimbine HCL at 2.5mg, and we have also added ingredients to keep you more focused without a hunger response during your cardio sessions to keep your fat loss approach more sustainable. link:https://bit.ly/3qdsrNY', 'get-raw-burn.jpg', 'get_raw_nutrition, raw, raw_burn, burn, fat_burner, f'),
(46, 4, 11, 'CREAPURE CREATINE POWDER - 400g - 80 servings', 3450, 12, 'MTS Nutrition Creatine uses Creapure®, the finest German Creatine. Pure, high-quality creatine (monohydrate) has been produced in Germany since the mid-1990s. Creapure®, manufactured by AlzChem Trostberg GmbH, is the only creatine made in Germany. This creatine is known around the world for its high quality and purity, which is due to their careful selection of raw materials, technologically and patented system for synthesizing creatine. link:https://bit.ly/34RrXpk', 'MTS_creatine.jpg', 'mts_nutrition, mts, creatine, c'),
(47, 6, 11, 'VASKY® STIMULANT FREE PUMP INDUCING PRE-WORKOUT - 264 g - 30 servings', 1600, 16, 'MTS Nutrition VASKY™ is the SCIENTIFICALLY-DOSED leader in non-stimulant pre-workout meant to be taken as a standalone or with your favorite stimulant based pre-workout such as MTS Nutrition CLASH® or Ruckus™. VASKY contains Nitrosigine™ which enhances nitric oxide for an extended period of time, along with HydroMax™ Glycerol which promotes hyper-saturation of the muscles. With Taurine, added for its positive performance and volumizing effects, VASKY is guaranteed to help you achieve the greatest pumps and best workouts you’ve EVER had! link:https://bit.ly/3IhXf6u', 'MTS_pre_work.jpg', 'mts_pre_work, pre_work, pre');


-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'Abhiram', 'Makam', 'abhiak@gmail.com', 'abhiak', '9177723634', 'Nandyal', 'Andhra Pradesh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
