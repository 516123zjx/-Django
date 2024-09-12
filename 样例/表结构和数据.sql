-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shadow
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app0_image`
--

DROP TABLE IF EXISTS `app0_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app0_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_info` varchar(64) NOT NULL,
  `path` varchar(256) NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app0_image_order_id_10184c08_fk_app0_order_id` (`order_id`),
  CONSTRAINT `app0_image_order_id_10184c08_fk_app0_order_id` FOREIGN KEY (`order_id`) REFERENCES `app0_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app0_image`
--

/*!40000 ALTER TABLE `app0_image` DISABLE KEYS */;
INSERT INTO `app0_image` VALUES (5,'米开朗琪罗广场.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\55a72454d09db04ff1cc34430e793209.jpg',3),(6,'埃菲尔铁塔.png','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\c1d72bd2a19344d2ae4877dabce46bfb.png',3),(7,'巴黎圣母院.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\c631475858ba060ec08ff49ea0ebca8e.jpg',3),(14,'渔人堡.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\cdd5ef85d6460d9c804064f459513c07.jpg',6),(16,'伦敦塔桥.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\5ff8aa399b861502ba59c9d1a8fbbe59.jpg',8),(17,'狮身人面像.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\649bd38df573847c90f96a51baccaff8.jpg',9),(18,'曼哈顿大桥.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\92de24e166938cbe56cb0bbc11eb94e1.jpg',10),(19,'巨石阵.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\7a7cbb094a0f17c81d206641440a2116.jpg',11),(20,'罗马斗兽场.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\458972d20f19d017693b045d68832c52.jpg',11),(21,'狮身人面像.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\649bd38df573847c90f96a51baccaff8.jpg',11),(25,'莫高窟.png','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\19aa7ce1304790c96430344c6d8fd907.png',13),(26,'慕田峪长城.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\eeb69ff767f00d08ed467b4b0a4c9d7f.jpg',13),(27,'东方明珠.png','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\a20ae9fed9f761393660c46bc751b516.png',13),(28,'罗马斗兽场.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\458972d20f19d017693b045d68832c52.jpg',14),(29,'伦敦塔桥.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\5ff8aa399b861502ba59c9d1a8fbbe59.jpg',14),(30,'伦敦眼.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\27b39803feb476ec5dc5cee74ea78019.jpg',14),(34,'bc13e3a3c07e3120443f5d172aa66d07.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\bc13e3a3c07e3120443f5d172aa66d07.jpg',18),(35,'7a7cbb094a0f17c81d206641440a2116.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\7a7cbb094a0f17c81d206641440a2116.jpg',19),(36,'d28d3c840093290775f060877a08cbc1.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\d28d3c840093290775f060877a08cbc1.jpg',20),(37,'eeb69ff767f00d08ed467b4b0a4c9d7f.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\eeb69ff767f00d08ed467b4b0a4c9d7f.jpg',21),(38,'曼哈顿大桥.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\92de24e166938cbe56cb0bbc11eb94e1.jpg',22),(39,'米开朗琪罗广场.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\55a72454d09db04ff1cc34430e793209.jpg',22),(40,'摩艾石像.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\55931ba43a7d6425010b79cb4d49f806.jpg',22),(41,'狮身人面像.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\649bd38df573847c90f96a51baccaff8.jpg',23),(42,'特莱维喷泉.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\e10112f0fe8bd5e59cbd6054e1663e6d.jpg',23),(43,'韦莱集团大厦.jpg','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\e75e5b702eb7f1065942726cfceac216.jpg',23);
/*!40000 ALTER TABLE `app0_image` ENABLE KEYS */;

--
-- Table structure for table `app0_order`
--

DROP TABLE IF EXISTS `app0_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app0_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `state` int NOT NULL,
  `type` int NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `finished_time` datetime(6) NOT NULL,
  `extra_info` longtext NOT NULL,
  `answer` longtext NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app0_order_user_id_ba395397_fk_app0_user_id` (`user_id`),
  CONSTRAINT `app0_order_user_id_ba395397_fk_app0_user_id` FOREIGN KEY (`user_id`) REFERENCES `app0_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app0_order`
--

/*!40000 ALTER TABLE `app0_order` DISABLE KEYS */;
INSERT INTO `app0_order` VALUES (3,1,1,'2024-07-18 13:45:38.956131','2024-07-18 13:46:24.214027','写1000字左右, 要非常浪漫','在曼谷的大皇宫，我捕捉到了一座高耸入云的佛塔，它由白色的砖块精心砌成，在阳光下熠熠生辉。这座建筑就是著名的黎明寺（Wat Arun），其塔身装饰着精细的雕刻和图案，每一层都呈现出不同的风格。天空湛蓝，白云飘过，为整个场景增添了一抹宁静与和谐。\n\n在巴黎的埃菲尔铁塔下，我捕捉到了这个城市的浪漫与活力。铁塔高耸入云，周围是繁忙的街道和美丽的花园。人们在草地上休息，享受着阳光和美好的天气。这是一个充满魅力和浪漫的城市，让人流连忘返。\n\n在巴黎圣母院前，我捕捉到了这座哥特式教堂的壮丽与精美。双塔高耸入云，中央玫瑰窗熠熠生辉。人群在周围漫步，被这座历史悠久的建筑所吸引。我感受到了巴黎的浪漫与文化的底蕴。\n\n这三幅画面仿佛是一首浪漫的交响曲，在 Bangkok、Paris 的街头巷尾回响。每一次快门按下，都是一次对浪漫的定格；每一次镜头对焦，都是一次对心灵的触动。在这些充满故事的建筑前，时间仿佛也变得温柔起来，让我们沉醉在浪漫的氛围中，感受生活的美好。\n\nBangkok 的黎明寺，以其精致的白色塔身和细腻的雕刻，成为了泰国浪漫的象征。每当夕阳西下，金色的余晖洒在这座佛塔上，仿佛是大自然为它披上了一层浪漫的外衣。站在寺庙前，看着那些虔诚朝拜的人们，心中不禁涌动起一种宁静和平和的情感。这不仅仅是一座宗教建筑，更是一个承载着人们美好愿望和浪漫情感的地方。\n\n而 Paris 的埃菲尔铁塔，则无疑是世界上最浪漫的建筑之一。每当夜幕降临，铁塔上的灯光闪烁，宛如天上的繁星。在铁塔下，情侣们相拥而立，诉说着彼此的心愿。这里见证了无数的爱情故事，也成为了无数人心中的浪漫圣地。\n\n最后，巴黎圣母院以其雄伟的哥特式建筑和精美的玫瑰窗，展现出了法国的浪漫与优雅。走进教堂，仿佛置身于艺术的殿堂，每一根柱子、每一扇窗户都讲述着一个古老的故事。在这里，我们可以感受到历史的厚重，也可以品味到浪漫的气息。\n\n这三幅画面，不仅仅是三个不同的地点，更是三种不同形式的浪漫。它们共同构成了我对浪漫的理解和对生活的热爱。在曼谷、Paris 的街头巷尾，我找到了心中的浪漫，也感受到了生活的美好。',4),(6,1,0,'2024-07-18 13:50:20.636800','2024-07-18 13:50:42.479491','渔人堡','**摄影计划：**\n\n**地点：** 布达佩斯的渔人堡\n\n**器材推荐：** 为了捕捉到渔人堡的壮丽景色和细节，建议使用一台全画幅相机和一支广角镜头。广角镜头可以更好地展现渔人堡的广阔视野和建筑群的布局。此外，一支长焦镜头可以帮助你拍摄远处的细节和人物。\n\n**摄影时间推荐：** 最佳摄影时间是日出前后和日落时分。日出时，阳光柔和，色彩丰富；日落时，天空呈现出美丽的橙红色调，与渔人堡的轮廓形成鲜明的对比。尽量避免在正午时分拍摄，因为此时阳光直射，可能会导致过曝或强烈的阴影。\n\n**分析地形、光线及特征：**  \n- 从地形上看，渔人堡位于一座小山上，这为摄影师提供了高处的视角，可以俯瞰整个布达佩斯市。利用这个优势，你可以拍摄到城市全景和渔人堡本身。\n- 光线方面，由于渔人堡位于多瑙河畔，自然光线条件优越。无论是早晨还是傍晚，都可以利用柔和的太阳光线来增强建筑的美感和色彩饱和度。\n- 特征方面，渔人堡以其独特的哥特式和新罗马式风格著称。你可以通过不同的角度展示这些建筑特点，例如从侧面拍摄来强调其尖塔和装饰性细节，或者从正面拍摄来展现其宏伟的规模和整体美感。\n\n**摄影角度推荐：**  \n- 鱼眼镜头视角：使用鱼眼镜头可以创造一种超广角的视觉效果，将渔人堡和周围的建筑群囊括在一个画面中。这种视角适合拍摄团体照或记录活动场面。\n- 仰视角度：仰视角度可以突出渔人堡的雄伟气势，使其显得更加壮观。同时，也可以用来拍摄广场上的活动和人们游玩的场景。\n- 侧拍角度：侧拍角度可以展示渔人堡的建筑线条和细节，使照片更具立体感。适合拍摄建筑物的外观和结构特点。\n- 低角度拍摄：低角度拍摄可以捕捉到渔人堡的顶部视角，以及周围环境的细节。这种视角适合拍摄渔人堡的尖塔和装饰性元素。',4),(8,1,0,'2024-07-18 13:50:39.180282','2024-07-18 13:51:25.554659','伦敦塔桥','**摄影计划**：\n\n- **摄影器材推荐**：为了捕捉到伦敦塔桥的壮丽景色和细节，建议使用一台高画质的全画幅相机和广角镜头。这样可以确保照片具有足够的分辨率和宽广的视角来涵盖整个桥梁和周围的环境。此外，三脚架可以稳定相机，避免模糊，尤其是在夜晚光线较暗的情况下。\n\n- **摄影时间推荐**：考虑到光线对摄影的影响，最佳的拍摄时间可能是日出前后的“黄金时刻”或日落时分，此时阳光柔和，色彩饱和度更高。如果想要捕捉到塔桥在夜幕下的灯光效果，那么选择傍晚至夜晚的时间段也是一个不错的选择，这时候的塔桥会被点亮，呈现出不同的美感。\n\n- **分析地形、光线等特征**：从图片中可以看出，伦敦塔桥位于一个开阔的水域旁，这为摄影提供了良好的背景。水域的反射特性可以在一定程度上增强桥梁的视觉效果。同时，天空中的云彩可能会影响光线的分布，为摄影增添更多的变化。因此，需要关注天气条件，选择多云或部分多云的日子进行拍摄，以获得最佳的光线效果。\n\n- **生成摄影角度推荐**：\n  1. 从泰晤士河的对岸拍摄，利用河流作为自然的分隔线，突出塔桥的孤立感和宏伟感。可以选择在较高的位置，如另一侧的桥梁上或建筑物顶部，以获得更广阔的视野。\n  2. 在靠近水域的地方寻找低角度，这样可以强调塔桥的高度和建筑细节，同时水面的反射也会增加画面的美感。可以使用长焦镜头压缩透视关系，让塔桥显得更加高大。\n  3. 如果可能的话，尝试找到一些独特的视角，比如通过隧道或其他结构物的缝隙拍摄，这样的角度可以打破常规，展现不一样的塔桥风貌。\n\n总之，要拍摄出满意的伦敦塔桥照片，需要综合考虑器材、时间、地点和光线等因素。不断实践和探索不同的拍摄方法，相信可以拍出令人满意的照片。',4),(9,1,0,'2024-07-18 13:54:21.469109','2024-07-18 13:54:40.902957','狮身人面像','摄影计划如下：\n\n**摄影器材推荐：**\n- 相机：建议使用高画质、快速连拍功能的单反或无反相机，以捕捉夜晚星空下的动态画面。\n- 镜头：长焦镜头可以更好地拍摄狮身人面像的细节，同时也能捕捉到银河。广角镜头则适合展现沙漠和天空的广阔景色。\n- 三脚架：在低光环境下，三脚架可以帮助稳定相机，避免模糊。\n- 快门线：如果使用手动模式，可以使用快门线来控制相机的曝光时间。\n\n**摄影时间推荐：**\n- 月亮阶段：新月或满月时，月亮的光线不会干扰星星的拍摄，且能照亮狮身人面像的一部分，形成剪影效果。\n- 星轨拍摄：选择一个晴朗无月的夜空，使用长时间曝光拍摄，可以捕捉到星星在天空中移动形成的轨迹。\n- 日出日落前后：此时阳光柔和，色彩丰富，可以拍摄到沙丘和狮身人面像的轮廓。\n\n**分析地形和光线特征：**\n- 狮身人面像位于埃及吉萨金字塔群附近，这里地势开阔，视野良好，适合拍摄星空和银河。\n- 狮身人面像背靠沙漠，前方有宽阔的空地，这些元素可以为照片增添层次感和空间感。\n- 夜晚时分，狮身人面像和周围的金字塔会被人工照明灯照亮，这为拍摄提供了稳定的光源。\n\n**摄影角度推荐：**\n- 从正面拍摄，突出狮身人面像的宏伟规模和细节特征。\n- 从侧面拍摄，展现狮身人面像与星空的对比，以及其与沙漠的融合。\n- 使用低角度拍摄，将狮身人面像置于星空之下，使其显得更加神秘和壮观。\n- 如果条件允许，还可以尝试使用无人机从空中拍摄，俯瞰整个场景，展现其壮丽的全景。',4),(10,1,0,'2024-07-18 13:56:53.802844','2024-07-18 13:57:16.962625','曼哈顿大桥','根据您提供的地标信息和图片，以下是为您生成的摄影计划：\n\n**摄影器材推荐**：由于您需要拍摄曼哈顿大桥这样的大型结构，并且可能需要在不同的距离和角度进行拍摄，建议使用一台具有良好画质和多功能性的相机，以及一支长焦镜头和一个广角镜头。这样可以确保您能够捕捉到大桥的不同部分和细节。\n\n**摄影时间推荐**：考虑到光线对摄影的影响，最佳的时间通常是在日出或日落时分的“黄金时刻”。此时阳光柔和，可以避免过于强烈的阴影和高光过曝，同时为大桥增添温暖色调。不过，如果您想要捕捉到纽约市繁忙的交通和城市景观，那么选择在白天的高峰时段也是一个不错的选择。\n\n**分析地形和光线特征**：从图片中可以看出，曼哈顿大桥位于一个开阔的区域，背景是晴朗的天空。这种情况下，光线直接照射在大桥上，可能会导致某些部分过度曝光。因此，可以使用渐变中性密度滤镜来平衡天空和桥梁之间的亮度差异。此外，由于大桥的结构复杂，可以尝试从不同的角度和位置进行拍摄，以找到最佳的视角展现其美感。\n\n**摄影角度推荐**：为了突出大桥的宏伟和壮观，可以选择以下几个角度：\n- 从地面水平线上方拍摄，这样可以强调大桥的高度和长度；\n- 使用低角度拍摄，使大桥显得更加雄伟；\n- 如果条件允许，可以登上附近的建筑物或桥梁，从高处俯瞰整个大桥，这样的视角可以展示大桥与周围环境的和谐共存。',4),(11,1,1,'2024-07-18 13:57:49.951373','2024-07-18 13:58:26.689836','写600字左右, 风格要原始狂野','在这片古老的土地上，时间似乎静止了。夕阳西下，天空被染成了橙红色，与巨石阵的轮廓相互映衬，形成了一幅绝美的画卷。每一块石头都仿佛承载着千年的记忆，诉说着远古的故事。站在这里，我仿佛能听到历史的回声，感受到古人的智慧与勇气。\n\n在罗马斗兽场，我感受到了古文明的辉煌。这座庞大的圆形剧场，建于公元72年，可容纳近万名观众，曾是角斗士战斗和猛兽表演的舞台。如今，它已成为罗马的象征，吸引着世界各地的游客前来参观。在这里，我不仅看到了古罗马建筑的宏伟，更感受到了历史的沧桑变迁。\n\n在埃及吉萨，我捕捉到了夜晚神秘而壮观的景象。巨大的狮身人面像在星空下屹立不倒，仿佛是岁月的守护者。银河清晰可见，宛如一条璀璨的河流穿越夜空。这张照片展现了人类历史与宇宙永恒之间的和谐共存。\n\n在这片土地上，我感受到了大自然的鬼斧神工和历史的厚重底蕴。无论是巨石阵的壮观景色，还是罗马斗兽场的辉煌建筑，抑或是埃及吉萨的神秘夜景，都给我留下了深刻的印象。\n\n通过镜头，我记录下了这些美丽的瞬间，让更多的人了解这片神奇的土地。同时，我也收获了成长与感悟，明白了珍惜当下、敬畏历史的重要性。\n\n在这片充满传奇的土地上，我度过了难忘的时光。每一次按下快门，都是一次与历史的对话，与自然的交融。我相信，这些美好的回忆将会永远留存在我的心中，激励着我继续前行，用镜头记录下更多美好的瞬间。',4),(13,1,1,'2024-07-18 14:03:55.461918','2024-07-18 14:04:25.941695','要描写出我国的大国风范, 写得非常红, 并在末尾背诵社会主义核心价值观','在上海浦东新区，我捕捉到了这张东方明珠塔的照片。它是一座高耸入云的建筑，由三个巨大的球体组成，每个球体都有不同的颜色和图案。在阳光的照射下，整个建筑显得格外壮观。  \n东方明珠塔是我国上海的标志性建筑之一，位于上海市浦东新区的陆家嘴金融贸易区。塔身高达468米，是世界上第二高的电视塔，仅次于加拿大的CN Tower（加拿大国家电视塔）。东方明珠塔的设计独特，由15个不同功能的观光厅和一个旋转餐厅组成，游客可以乘坐电梯到达不同高度的观光平台，俯瞰整个上海城市景观和黄浦江的美景。  \n此外，东方明珠塔附近还有其他著名的旅游景点，如上海中心大厦、金茂大厦、环球金融中心和上海迪士尼度假区等。这些建筑和景点共同构成了上海现代化都市的美丽画卷，展现了我国大国风范。  \n东方明珠塔不仅是一个旅游观光的好去处，也是上海文化娱乐活动的中心之一。塔内设有各种展览和文化活动，吸引了无数国内外游客前来参观体验。  \n总的来说，东方明珠塔作为上海的象征，以其独特的建筑风格和丰富的文化内涵，向世界展示了中国的大国风范。',4),(14,1,1,'2024-07-18 14:04:54.241133','2024-07-18 14:05:28.815927','要将这次摄影经历描写得非常悲伤','在罗马斗兽场的阴影下，我目睹了古文明的消亡与重生。这座曾经的角斗士生死决斗的舞台，如今只剩下断壁残垣，成为游客们拍照留念的背景。阳光下的废墟，虽然依旧壮观，却无法掩盖历史的沧桑变迁。在伦敦塔桥附近的泰晤士河边，我捕捉到了这个城市的夜景。灯火通明的塔桥与周围的建筑物交相辉映，呈现出一种独特的美丽。然而，这种美却带给我一丝忧伤，因为它隐藏着伦敦夜晚的孤独与寂寞。这次摄影让我深刻体会到了伦敦夜晚的忧伤，也让我更加珍惜这座城市的历史与记忆。在伦敦泰晤士河畔，我再次看到了大本钟和威斯敏斯特宫的壮丽景色。晴朗的天空下，云彩飘渺，为画面增添了几分诗意。阳光洒在哥特复兴式建筑上，使其更显辉煌。然而，一座桥梁跨越河流，连接两岸的人行道，却让我感到一丝忧伤。河面上的一艘游船缓缓行驶，留下了长长的水波纹，仿佛在诉说着伦敦的故事。整个场景充满了宁静与和谐，但也透露出一丝忧伤，展现了伦敦的美丽和历史底蕴。',4),(18,1,0,'2024-07-18 14:10:37.874207','2024-07-18 14:10:58.192879','帕特农神庙','**摄影计划：**\n\n**摄影器材推荐：**\n- 相机：建议使用全画幅相机或高画质APS-C相机，以捕捉帕特农神庙的细节和色彩。\n- 镜头：广角镜头可以拍摄到帕特农神庙的全貌，而长焦镜头则适合突出神庙的某个特定部分或捕捉游客。\n- 三脚架：在稳定光线下使用三脚架可以确保相机的稳定性，避免模糊。\n- 滤镜：渐变中性密度滤镜可以帮助平衡天空与地面之间的曝光差异。\n\n**摄影时间推荐：**\n- 日出前或日落时：此时阳光柔和，能营造出宁静的氛围，并减少游客干扰。\n- 晴朗天气的中午：此时阳光直射，可以清晰地展现神庙的细节。\n- 尽量避免在正午时分拍摄，因为此时阳光过于强烈，可能会导致过曝或强烈的阴影。\n\n**分析地形、光线等特征：**\n- 神庙位于一个开阔的广场上，提供了良好的拍摄视角。\n- 光线从东面照射过来，使得神庙的正面受到明亮的光线，而背面则相对较暗。\n- 可以通过调整拍摄位置来利用这些自然光线，创造出不同的效果。\n\n**摄影角度推荐：**\n- 从广场上直接拍摄，展现神庙的宏伟规模和柱子的排列。\n- 从侧面拍摄，突出神庙的长度和建筑线条。\n- 使用低角度拍摄，强调神庙的高度和雅典卫城的整体布局。\n- 如果可能的话，爬上一个附近的建筑物或山坡，获得更广阔的视角。',2),(19,1,0,'2024-07-18 14:10:42.527365','2024-07-18 14:11:22.324048','巨石阵','**摄影计划**：\n\n**地点**：巨石阵（Stonehenge）\n\n**器材推荐**：\n- 相机：建议使用全画幅相机或高画质APS-C相机，以捕捉细节和动态范围。\n- 镜头：广角镜头可以涵盖巨石阵的宏伟景象，长焦镜头则适合拍摄细节和远处的景观。\n- 三脚架：由于可能需要较长的曝光时间，三脚架可以帮助保持相机的稳定。\n- 滤镜：渐变中性密度滤镜可以帮助平衡天空和地面之间的曝光差异。\n\n**摄影时间推荐**：\n- 日出或日落时分：此时阳光柔和，色彩丰富，能够营造出梦幻的效果。\n- 晴朗的白天：如果必须选择白天，尽量避免正午时分强烈的阳光，可以选择早晨或傍晚的柔和光线下进行拍摄。\n\n**分析地形与光线特征**：\n- 巨石阵位于开阔的田野上，提供了极佳的视野。\n- 光线从东面照射进来时，会形成长长的阴影，突显石头的纹理。\n- 在日落时分，天空的色彩变化丰富，可以为照片增添戏剧性。\n\n**摄影角度推荐**：\n- 从远处拍摄，以展现巨石阵的规模和周围的开阔景色。\n- 利用低角度拍摄，强调石头的高度和宏伟。\n- 如果条件允许，可以尝试无人机摄影，从空中视角展示这个古老的遗址。\n\n请确保在前往拍摄之前了解当地的天气情况和摄影许可要求。同时，尊重历史遗迹，不要进行破坏或攀爬行为。',2),(20,1,0,'2024-07-18 14:10:53.317706','2024-07-18 14:11:46.852358','科隆大教堂','**摄影计划**\n\n**器材推荐：**\n- 相机：选择一款具有高画质和良好低光性能的相机，如全画幅或APS-C画幅的单反或无反相机。\n- 镜头：建议使用广角镜头以捕捉科隆大教堂的宏伟全景，同时准备一支长焦镜头用于拍摄细节特写。\n- 三脚架：为了稳定相机，尤其是在弱光环境下，三脚架是必不可少的。\n- 其他配件：包括快门线、遥控器、备用电池和存储卡等。\n\n**摄影时间推荐：**\n- 黄昏时分：在日落后的半小时内拍摄，此时天空的光线柔和，可以避免过于强烈的阳光造成的高光过曝和阴影过深。\n- 夜晚：利用城市灯光照亮科隆大教堂，营造一种神秘而壮观的氛围。可以选择在蓝调时刻（即日出前或日落后的宁静时刻）进行拍摄，此时天空的色彩最为丰富。\n\n**地形与光线特征分析：**\n- 科隆大教堂位于莱茵河畔，其哥特式建筑风格在自然光的映衬下更显壮观。\n- 白天：阳光直射可能导致部分区域产生过曝现象，因此需要使用遮光罩或偏振镜来减少眩光。\n- 夜晚：人工照明可能会产生一些色差，需要调整白平衡设置。此外，河面的反射光也会对拍摄造成一定影响。\n\n**摄影角度推荐：**\n- 从河对岸拍摄：可以突出科隆大教堂的规模和美感，同时将桥梁和河流纳入画面中，形成一幅美丽的对称构图。\n- 仰视角度：强调科隆大教堂的尖顶和建筑线条，展现其雄伟的建筑特点。\n- 侧面角度：捕捉科隆大教堂的完整外观，以及与周围环境的和谐共存。',2),(21,2,0,'2024-07-18 14:10:57.084190','2024-07-18 14:11:59.513988','慕田峪长城','',2),(22,1,1,'2024-07-18 14:11:24.508212','2024-07-18 14:12:46.002889','1000字左右, 写得壮观一点','在纽约威廉斯堡大桥附近，我捕捉到了这座标志性的悬索桥在晴朗天空下的雄伟景象。阳光洒在大桥上，使其金属结构更加熠熠生辉。桥下，施工墙上的涂鸦写着“PEAR FORTE”，为画面增添了一丝街头艺术的气息。远处曼哈顿的天际线若隐若现，与大桥共同构成了一幅充满活力的城市风景画。\n\n在曼谷的大皇宫，我捕捉到了一座高耸入云的佛塔，它由白色的砖块精心砌成，在阳光下闪闪发光。天空湛蓝，几朵白云悠悠地飘过，为这座古老的建筑增添了一抹宁静与神秘。\n\n在复活节岛，我捕捉到了一排神秘莫测的摩艾石像。它们矗立在草原上，沐浴在夕阳的金色光芒中。这些古老的雕像，面容安详，仿佛在诉说着一段悠久的历史。云彩飘过天空，为这幅壮观的景象增添了几分诗意。\n\n这三张照片虽然拍摄于不同的地点，但都展现出了各自独特的魅力和风格。从纽约繁华的城市风光到曼谷古老寺庙的宁静神秘，再到复活节岛摩艾石像的原始古朴，每一处都让人流连忘返。\n\n首先，我们来看纽约威廉斯堡大桥附近的照片。这张照片展现了一个充满活力和艺术氛围的场景。阳光照耀下的威廉斯堡大桥显得格外壮观，其金属结构在光线下闪烁着光芒，给人一种坚固而优雅的感觉。桥下的施工墙上有一行涂鸦，写着“PEAR FORTE”，这为整个场景增添了一抹街头艺术的色彩，使画面更加生动有趣。远处曼哈顿的天际线若隐若现，与大桥共同构成了一个充满都市感的背景。整个画面充满了活力和现代感，展现了纽约作为一个国际化大都市的魅力。\n\n接下来，我们来看曼谷大皇宫的照片。这张照片展现了一个庄严肃穆而又神秘莫测的场景。大皇宫是一座具有泰国传统建筑风格的宫殿，其高耸入云的佛塔由白色的砖块精心砌成，在阳光下显得格外耀眼。天空湛蓝，几朵白云悠悠地飘过，为整个场景增添了一抹宁静和神秘的氛围。佛塔的庄严和周围环境的和谐相得益彰，展现了一种佛教文化的庄重与神圣。\n\n最后，我们来看复活节岛摩艾石像的照片。这张照片展现了一个原始而又神秘的场景。摩艾石像是一种巨大的石雕人像，它们矗立在草原上，沐浴在夕阳的金色光芒中。这些古老的雕像面容安详，仿佛在诉说着一段悠久的历史。云彩飘过天空，为整个场景增添了几分诗意和神秘感。摩艾石像的原始和神秘感，以及周围自然环境的美丽，展现了一种原始文化的魅力和吸引力。\n\n总的来说，这三张照片分别展现了一个充满活力和艺术氛围、庄严肃穆而又神秘莫测、原始而又神秘的场景。每张照片都有其独特的魅力和风格，让人感受到不同地域文化的独特之处。',2),(23,1,1,'2024-07-18 14:12:03.494741','2024-07-18 14:13:21.990858','500字左右, 要求写得年代久远一点','在遥远的过去，有一个古老而神秘的国度——埃及。它位于非洲大陆的东北部，拥有悠久的历史和灿烂的文明。在那个时代，埃及人建造了举世闻名的金字塔和狮身人面像，成为了永恒的象征。  \n\n我曾经有幸前往埃及旅行，亲眼目睹了这些奇迹。当我站在宏伟的金字塔前，不禁感叹古人的智慧和力量。这些建筑不仅代表了当时建筑技术的巅峰，还蕴含着丰富的宗教和文化内涵。在月光的照耀下，狮身人面像显得更加神秘莫测。它那深邃的眼睛仿佛能洞察一切，令人心生敬畏。  \n\n除了这些建筑奇迹，埃及还有许多其他值得一游的地方。例如，卢克索的神庙和卡纳克的圣坛都是古代宗教活动的中心。那里雕刻精美的石柱和墙壁，展示了古埃及艺术的精髓。此外，埃及的博物馆也收藏了许多珍贵的文物和艺术品，为游客提供了深入了解古埃及文化的机会。  \n\n然而，随着时间的推移，埃及逐渐失去了其昔日的辉煌。历经多次外族入侵和王朝更迭，埃及一度陷入衰败。尽管如此，埃及依然保持着其独特的魅力，吸引着无数游客前来探索。  \n\n在现代社会，虽然我们已经不再相信那些古老的传说和神话，但埃及的文化遗产仍然值得我们尊重和学习。通过研究古埃及的建筑、艺术和历史，我们可以更好地理解人类文明的起源和发展。同时，埃及也是一个充满活力和美丽的国家，有着丰富的自然景观和文化遗产，等待着我们的发现和欣赏。',2);
/*!40000 ALTER TABLE `app0_order` ENABLE KEYS */;

--
-- Table structure for table `app0_user`
--

DROP TABLE IF EXISTS `app0_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app0_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `profile` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app0_user`
--

/*!40000 ALTER TABLE `app0_user` DISABLE KEYS */;
INSERT INTO `app0_user` VALUES (2,'2','2','2.com','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\d6f31adc0acd3c40bab8afc608d7b066.jpg'),(4,'1','1','1.com','D:\\YCdesktop\\code\\Python\\shadow_echo\\media\\7e0b39e1ae2e7a8dcc121b903223129c.jpg');
/*!40000 ALTER TABLE `app0_user` ENABLE KEYS */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add order',8,'add_order'),(30,'Can change order',8,'change_order'),(31,'Can delete order',8,'delete_order'),(32,'Can view order',8,'view_order'),(33,'Can add image',9,'add_image'),(34,'Can change image',9,'change_image'),(35,'Can delete image',9,'delete_image'),(36,'Can view image',9,'view_image');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(9,'app0','image'),(8,'app0','order'),(7,'app0','user'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-07-18 13:10:17.793346'),(2,'auth','0001_initial','2024-07-18 13:10:18.245854'),(3,'admin','0001_initial','2024-07-18 13:10:18.383313'),(4,'admin','0002_logentry_remove_auto_add','2024-07-18 13:10:18.383313'),(5,'admin','0003_logentry_add_action_flag_choices','2024-07-18 13:10:18.396185'),(6,'contenttypes','0002_remove_content_type_name','2024-07-18 13:10:18.452514'),(7,'auth','0002_alter_permission_name_max_length','2024-07-18 13:10:18.509210'),(8,'auth','0003_alter_user_email_max_length','2024-07-18 13:10:18.528279'),(9,'auth','0004_alter_user_username_opts','2024-07-18 13:10:18.538950'),(10,'auth','0005_alter_user_last_login_null','2024-07-18 13:10:18.588043'),(11,'auth','0006_require_contenttypes_0002','2024-07-18 13:10:18.588043'),(12,'auth','0007_alter_validators_add_error_messages','2024-07-18 13:10:18.603181'),(13,'auth','0008_alter_user_username_max_length','2024-07-18 13:10:18.652448'),(14,'auth','0009_alter_user_last_name_max_length','2024-07-18 13:10:18.718817'),(15,'auth','0010_alter_group_name_max_length','2024-07-18 13:10:18.746380'),(16,'auth','0011_update_proxy_permissions','2024-07-18 13:10:18.754637'),(17,'auth','0012_alter_user_first_name_max_length','2024-07-18 13:10:18.804965'),(18,'sessions','0001_initial','2024-07-18 13:10:18.837192'),(19,'app0','0001_initial','2024-07-18 13:15:30.394560');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

--
-- Dumping routines for database 'shadow'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-18 22:16:30
