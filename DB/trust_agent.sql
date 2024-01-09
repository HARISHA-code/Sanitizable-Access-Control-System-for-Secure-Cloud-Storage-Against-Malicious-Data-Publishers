/*
SQLyog Community v12.02 (32 bit)
MySQL - 5.5.29 : Database - trust_agent
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`trust_agent` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `trust_agent`;

/*Table structure for table `file` */

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `id` varchar(200) DEFAULT NULL,
  `oname` varchar(200) DEFAULT NULL,
  `fname` text,
  `fkey` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `trapdoor` varchar(200) DEFAULT NULL,
  `content` text,
  `sto` text,
  `ste` text,
  `tf` text,
  `timedelay` text,
  `tput` text,
  `status` varchar(200) DEFAULT 'normal',
  `Proxy_Status` varchar(200) DEFAULT 'waiting'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `file` */

LOCK TABLES `file` WRITE;

insert  into `file`(`id`,`oname`,`fname`,`fkey`,`date`,`trapdoor`,`content`,`sto`,`ste`,`tf`,`timedelay`,`tput`,`status`,`Proxy_Status`) values ('1','padmasri','testdoc.txt','815','30/08/19 19:24:28','4488F397E483417C','this is the sample verification file','sample verification file','[sample verificate file]','file : 1 \nverificate : 1 \nsample : 1 \n','9079','9079070498','normal','Permitted'),('3','barath','Check.txt','7162','31/08/19 11:29:29','94F710F81602A93A','sample file to check this is the cloud related project','sample file check cloud related project','[sample file check cloud related project]','cloud : 1 \nfile : 1 \nrelated : 1 \nproject : 1 \ncheck : 1 \nsample : 1 \n','9483','9483070429','Attacked','waiting'),('1','padmasri','New Text Document.txt','3363','01/11/19 19:41:32','61457FE0DD4D9E3D','Consumers reviews in E-commerce systems are usually treated as the important resourcesthat reect users experience, feelings, and willingness to purchase items. All this information may involveconsumers views on things that can express interest, sentiments, and opinions. Many kinds of research haveshown that people are more likely to trust each other with the same attitude toward similar things. In thispaper, we consider seeking and accepting sentiments and suggestions in E-commerce systems somewhatimplies a form of trust between consumers during shopping. Following this view of point, an E-commercesystem reviews mining oriented sentiment similarity analysis approach is put forward to exploring userssimilarity and their trust. We divide the trust into two categories, namely direct trust, and propagation oftrust, which represents a trust relationship between two individuals. The direct trust degree is obtained fromsentiment similarity, and we present an entity-sentiment word pair mining method for similarity featureextraction. The propagation of trust is calculated according to the transitivity feature. Using the proposedtrust representation model, we use the shortest path to describe the tightness of trust and put forward animproved shortest path algorithm to gure out the propagation trust relationship between users. A large-scaleE-commerce website reviews dataset is collected to examine the accuracy of the algorithms and feasibilityof the models. The experimental results indicate that the sentiment similarity analysis can be an efcientmethod to nd trust between users in E-commerce systems.','Consumers reviews E-commerce systems usually treated important resourcesthat reect users experience feelings willingness purchase items information involveconsumers views things express interest sentiments opinions kinds research haveshown people likely trust attitude toward similar things thispaper consider seeking accepting sentiments suggestions E-commerce systems somewhatimplies form trust consumers shopping Following view point E-commercesystem reviews mining oriented sentiment similarity analysis approach put forward exploring userssimilarity trust divide trust two categories namely direct trust propagation oftrust represents trust relationship two individuals direct trust degree obtained fromsentiment similarity present entity-sentiment word pair mining method similarity featureextraction propagation trust calculated according transitivity feature Using proposedtrust representation model use shortest path describe tightness trust put forward animproved shortest path algorithm gure propagation trust relationship users large-scaleE-commerce website reviews dataset collected examine accuracy algorithms feasibilityof models experimental results indicate sentiment similarity analysis efcientmethod nd trust users E-commerce systems','[Consumer reviews E-commerce systems usually treated important resourcesthate reect user experience feel willing purchase items informate involveconsumer views th express interest sentiments opinions kinds research haveshown people likely trust attitude toward similar th thispaper consider seeking accept sentiments suggestions E-commerce systems somewhatimplies form trust consumer shopping Following view point E-commercesystem reviews min oriented sentiment similarity analysis approach put forward explor userssimilarity trust divide trust two categories namely direct trust propagate oftrust represents trust relationship two individuals direct trust degree obtained fromsentiment similarity present entity-sentiment word pair min method similarity featureextraction propagate trust calculated accord transitivity feature Use proposedtrust representate model use shortest path describe tight trust put forward animproved shortest path algorithm gure propagate trust relationship user large-scaleE-commerce website reviews dataset collected examine accuracy algorithms feasibilityof models experimental results indic sentiment similarity analysis efcientmethod nd trust user E-commerce systems]','gure : 1 \naccuracy : 1 \ncollected : 1 \nexperimental : 1 \napproach : 1 \nput : 2 \npath : 2 \nConsumer : 1 \nmodel : 1 \nusually : 1 \nshopping : 1 \nshortest : 2 \nalgorithm : 1 \nlikely : 1 \nsimilar : 1 \nmodels : 1 \nmethod : 1 \nreect : 1 \nanalysis : 2 \nproposedtrust : 1 \nthispaper : 1 \nanimproved : 1 \naccept : 1 \ntoward : 1 \nexplor : 1 \nobtained : 1 \nitems : 1 \nword : 1 \nattitude : 1 \nalgorithms : 1 \nuserssimilarity : 1 \nentity-sentiment : 1 \nexamine : 1 \ndirect : 2 \nkinds : 1 \ntwo : 2 \nmin : 2 \nfeature : 1 \nsystems : 3 \ncategories : 1 \nrelationship : 2 \nwebsite : 1 \nforward : 2 \nUse : 1 \nnamely : 1 \nFollowing : 1 \nfromsentiment : 1 \npeople : 1 \nth : 2 \ntransitivity : 1 \ndescribe : 1 \nsomewhatimplies : 1 \ndataset : 1 \nwilling : 1 \nuse : 1 \ninvolveconsumer : 1 \nE-commerce : 3 \nfeel : 1 \nexpress : 1 \nexperience : 1 \nindividuals : 1 \ntight : 1 \nresearch : 1 \nview : 1 \nreviews : 3 \nfeasibilityof : 1 \npropagate : 3 \nconsider : 1 \noftrust : 1 \ncalculated : 1 \nresults : 1 \ntreated : 1 \nE-commercesystem : 1 \ndegree : 1 \nresourcesthate : 1 \nimportant : 1 \nhaveshown : 1 \nrepresentate : 1 \noriented : 1 \npresent : 1 \nfeatureextraction : 1 \nlarge-scaleE-commerce : 1 \ntrust : 11 \nsentiment : 2 \nindic : 1 \nsentiments : 2 \npoint : 1 \nrepresents : 1 \nnd : 1 \ninterest : 1 \nsimilarity : 4 \ndivide : 1 \nviews : 1 \nconsumer : 1 \nefcientmethod : 1 \naccord : 1 \npurchase : 1 \nseeking : 1 \npair : 1 \nform : 1 \ninformate : 1 \nopinions : 1 \nsuggestions : 1 \nuser : 3 \n','9000','9000078207','normal','waiting'),('4','nivetha','New Text Document.txt','4197','02/11/19 11:20:39','EFAF0B75EA4107CF','Consumers reviews in E-commerce systems are usually treated as the important resourcesthat reect users experience, feelings, and willingness to purchase items. All this information may involveconsumers views on things that can express interest, sentiments, and opinions. Many kinds of research haveshown that people are more likely to trust each other with the same attitude toward similar things. In thispaper, we consider seeking and accepting sentiments and suggestions in E-commerce systems somewhatimplies a form of trust between consumers during shopping. Following this view of point, an E-commercesystem reviews mining oriented sentiment similarity analysis approach is put forward to exploring userssimilarity and their trust. We divide the trust into two categories, namely direct trust, and propagation oftrust, which represents a trust relationship between two individuals. The direct trust degree is obtained fromsentiment similarity, and we present an entity-sentiment word pair mining method for similarity featureextraction. The propagation of trust is calculated according to the transitivity feature. Using the proposedtrust representation model, we use the shortest path to describe the tightness of trust and put forward animproved shortest path algorithm to gure out the propagation trust relationship between users. A large-scaleE-commerce website reviews dataset is collected to examine the accuracy of the algorithms and feasibilityof the models. The experimental results indicate that the sentiment similarity analysis can be an efcientmethod to nd trust between users in E-commerce systems.','Consumers reviews E-commerce systems usually treated important resourcesthat reect users experience feelings willingness purchase items information involveconsumers views things express interest sentiments opinions kinds research haveshown people likely trust attitude toward similar things thispaper consider seeking accepting sentiments suggestions E-commerce systems somewhatimplies form trust consumers shopping Following view point E-commercesystem reviews mining oriented sentiment similarity analysis approach put forward exploring userssimilarity trust divide trust two categories namely direct trust propagation oftrust represents trust relationship two individuals direct trust degree obtained fromsentiment similarity present entity-sentiment word pair mining method similarity featureextraction propagation trust calculated according transitivity feature Using proposedtrust representation model use shortest path describe tightness trust put forward animproved shortest path algorithm gure propagation trust relationship users large-scaleE-commerce website reviews dataset collected examine accuracy algorithms feasibilityof models experimental results indicate sentiment similarity analysis efcientmethod nd trust users E-commerce systems','[Consumer reviews E-commerce systems usually treated important resourcesthate reect user experience feel willing purchase items informate involveconsumer views th express interest sentiments opinions kinds research haveshown people likely trust attitude toward similar th thispaper consider seeking accept sentiments suggestions E-commerce systems somewhatimplies form trust consumer shopping Following view point E-commercesystem reviews min oriented sentiment similarity analysis approach put forward explor userssimilarity trust divide trust two categories namely direct trust propagate oftrust represents trust relationship two individuals direct trust degree obtained fromsentiment similarity present entity-sentiment word pair min method similarity featureextraction propagate trust calculated accord transitivity feature Use proposedtrust representate model use shortest path describe tight trust put forward animproved shortest path algorithm gure propagate trust relationship user large-scaleE-commerce website reviews dataset collected examine accuracy algorithms feasibilityof models experimental results indic sentiment similarity analysis efcientmethod nd trust user E-commerce systems]','gure : 1 \naccuracy : 1 \ncollected : 1 \nexperimental : 1 \napproach : 1 \nput : 2 \npath : 2 \nConsumer : 1 \nmodel : 1 \nusually : 1 \nshopping : 1 \nshortest : 2 \nalgorithm : 1 \nlikely : 1 \nsimilar : 1 \nmodels : 1 \nmethod : 1 \nreect : 1 \nanalysis : 2 \nproposedtrust : 1 \nthispaper : 1 \nanimproved : 1 \naccept : 1 \ntoward : 1 \nexplor : 1 \nobtained : 1 \nitems : 1 \nword : 1 \nattitude : 1 \nalgorithms : 1 \nuserssimilarity : 1 \nentity-sentiment : 1 \nexamine : 1 \ndirect : 2 \nkinds : 1 \ntwo : 2 \nmin : 2 \nfeature : 1 \nsystems : 3 \ncategories : 1 \nrelationship : 2 \nwebsite : 1 \nforward : 2 \nUse : 1 \nnamely : 1 \nFollowing : 1 \nfromsentiment : 1 \npeople : 1 \nth : 2 \ntransitivity : 1 \ndescribe : 1 \nsomewhatimplies : 1 \ndataset : 1 \nwilling : 1 \nuse : 1 \ninvolveconsumer : 1 \nE-commerce : 3 \nfeel : 1 \nexpress : 1 \nexperience : 1 \nindividuals : 1 \ntight : 1 \nresearch : 1 \nview : 1 \nreviews : 3 \nfeasibilityof : 1 \npropagate : 3 \nconsider : 1 \noftrust : 1 \ncalculated : 1 \nresults : 1 \ntreated : 1 \nE-commercesystem : 1 \ndegree : 1 \nresourcesthate : 1 \nimportant : 1 \nhaveshown : 1 \nrepresentate : 1 \noriented : 1 \npresent : 1 \nfeatureextraction : 1 \nlarge-scaleE-commerce : 1 \ntrust : 11 \nsentiment : 2 \nindic : 1 \nsentiments : 2 \npoint : 1 \nrepresents : 1 \nnd : 1 \ninterest : 1 \nsimilarity : 4 \ndivide : 1 \nviews : 1 \nconsumer : 1 \nefcientmethod : 1 \naccord : 1 \npurchase : 1 \nseeking : 1 \npair : 1 \nform : 1 \ninformate : 1 \nopinions : 1 \nsuggestions : 1 \nuser : 3 \n','8927','8927545534','Attacked','Permitted'),('5','Gokul','Project Status.txt','811','29/04/23 10:29:04','03BC6940C9884381','1355-Topic not Confirmed1361-Cancel(Doing frd project)1357-Not Pick1329-Topic not Confirmed1318-Topic Confirmed 1312-Topic not Confirmed1302-Topic not Confirmed1301-Topic not Confirmed1300-Python Topic Confirmed (need cost detail)1292-Topic Confirmed1CP22/810--- Not Pick1CP22/806--Topic Confirmed on tommorrow1CP22/874-Not Pick1CP22/1029--Not Pick1CP22/1045--Not Reachable1CP22/1060--Topic not Confirmed1CP22/1238.......Busy1CP22/1280.......Switch Off1CP22/1264.......Cancel(Doing senior project)1CP22/1257........Topic Confirmed on tommorrow1CP22/1238.....Topic not Confirmed1CP22/1065-Busy1CP22/1061-Not Pick1CP22/1045-Not Reachable1CP22/1184----Not Pick1CP22/1179----Topic not Confirmed1CP22/1174...Out of Service1CP22/1115...Not Pick1CP22/1065...Not Pick','1355-Topic Confirmed1361-CancelDoing frd project1357-Not Pick1329-Topic Confirmed1318-Topic Confirmed 1312-Topic Confirmed1302-Topic Confirmed1301-Topic Confirmed1300-Python Topic Confirmed need cost detail1292-Topic Confirmed1CP22/810--- Pick1CP22/806--Topic Confirmed tommorrow1CP22/874-Not Pick1CP22/1029--Not Pick1CP22/1045--Not Reachable1CP22/1060--Topic Confirmed1CP22/1238Busy1CP22/1280Switch Off1CP22/1264CancelDoing senior project1CP22/1257Topic Confirmed tommorrow1CP22/1238Topic Confirmed1CP22/1065-Busy1CP22/1061-Not Pick1CP22/1045-Not Reachable1CP22/1184----Not Pick1CP22/1179----Topic Confirmed1CP22/1174Out Service1CP22/1115Not Pick1CP22/1065Not Pick','[1355-Topic Confirmed1361-CancelDoing frd project1357-Not Pick1329-Topic Confirmed1318-Topic Confirmed 1312-Topic Confirmed1302-Topic Confirmed1301-Topic Confirmed1300-Python Topic Confirmed need cost detail1292-Topic Confirmed1CP22/810--- Pick1CP22/806--Topic Confirmed tommorrow1CP22/874-Not Pick1CP22/1029--Not Pick1CP22/1045--Not Reachable1CP22/1060--Topic Confirmed1CP22/1238Busy1CP22/1280Switch Off1CP22/1264CancelDoing senior project1CP22/1257Topic Confirmed tommorrow1CP22/1238Topic Confirmed1CP22/1065-Busy1CP22/1061-Not Pick1CP22/1045-Not Reachable1CP22/1184----Not Pick1CP22/1179----Topic Confirmed1CP22/1174Out Service1CP22/1115Not Pick1CP22/1065Not Pick]','Pick1CP22/1045--Not : 1 \nproject1357-Not : 1 \nPick1CP22/806--Topic : 1 \nConfirmed1CP22/1065-Busy1CP22/1061-Not : 1 \nConfirmed1302-Topic : 1 \nPick1329-Topic : 1 \n1355-Topic : 1 \ntommorrow1CP22/1238Topic : 1 \nReachable1CP22/1060--Topic : 1 \ntommorrow1CP22/874-Not : 1 \nReachable1CP22/1184----Not : 1 \nfrd : 1 \nPick1CP22/1065Not : 1 \n1312-Topic : 1 \nTopic : 1 \nConfirmed1300-Python : 1 \ndetail1292-Topic : 1 \nConfirmed1301-Topic : 1 \nPick1CP22/1179----Topic : 1 \ncost : 1 \nPick : 1 \nneed : 1 \nPick1CP22/1029--Not : 1 \nConfirmed1CP22/810--- : 1 \nConfirmed1361-CancelDoing : 1 \nConfirmed1CP22/1174Out : 1 \nPick1CP22/1045-Not : 1 \nsenior : 1 \nproject1CP22/1257Topic : 1 \nConfirmed1CP22/1238Busy1CP22/1280Switch : 1 \nConfirmed1318-Topic : 1 \nConfirmed : 4 \nService1CP22/1115Not : 1 \nOff1CP22/1264CancelDoing : 1 \n','5702','5702403600','normal','Permitted');

UNLOCK TABLES;

/*Table structure for table `filereq` */

DROP TABLE IF EXISTS `filereq`;

CREATE TABLE `filereq` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `fname` text,
  `fkey` varchar(200) DEFAULT NULL,
  `trapdoor` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `timedelay` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT 'not-accept',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `filereq` */

LOCK TABLES `filereq` WRITE;

insert  into `filereq`(`id`,`name`,`fname`,`fkey`,`trapdoor`,`date`,`timedelay`,`status`) values (1,'nivetha','Check.txt','9229','4DEAB6E12F3F5F01','30/08/19 17:38:44','8566','Active'),(2,'sri','Check.txt','9229','4DEAB6E12F3F5F01','30/08/19 17:38:44','8566','Active'),(3,'sri','testdoc.txt','815','4488F397E483417C','30/08/19 19:24:28','9079','Active'),(4,'sathya','New Text Document.txt','3363','61457FE0DD4D9E3D','01/11/19 19:41:32','9000','Active');

UNLOCK TABLES;

/*Table structure for table `highlevel` */

DROP TABLE IF EXISTS `highlevel`;

CREATE TABLE `highlevel` (
  `filename` varchar(100) DEFAULT NULL,
  `rank` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `highlevel` */

LOCK TABLES `highlevel` WRITE;

insert  into `highlevel`(`filename`,`rank`) values ('New Text Document.txt','3'),('New Text Document.txt','3'),('New Text Document.txt','3'),('New Text Document.txt','3');

UNLOCK TABLES;

/*Table structure for table `keyword_request` */

DROP TABLE IF EXISTS `keyword_request`;

CREATE TABLE `keyword_request` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `uid` varchar(200) DEFAULT NULL,
  `uname` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT 'waiting',
  `skey` varchar(200) DEFAULT '-',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `keyword_request` */

LOCK TABLES `keyword_request` WRITE;

insert  into `keyword_request`(`id`,`uid`,`uname`,`status`,`skey`) values (1,'2','sri','waiting','9376'),(2,'3','sathya','Active','4425'),(5,'4','Abi','Active','4214'),(6,'4','Abi','Active','4214'),(7,'4','Abi','Active','4214');

UNLOCK TABLES;

/*Table structure for table `provider_register` */

DROP TABLE IF EXISTS `provider_register`;

CREATE TABLE `provider_register` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `mail` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `profile` text,
  `status` varchar(200) DEFAULT 'waiting',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `provider_register` */

LOCK TABLES `provider_register` WRITE;

insert  into `provider_register`(`id`,`name`,`password`,`mobile`,`mail`,`city`,`profile`,`status`) values (1,'padmasri','padma','7299913961','1croreprojects.javateam@gmail.com','chennai','1.png','Accept'),(2,'madhuri','madhu','9988776655','1croreprojects.javateam@gmail.com','chennai','backimg.jpg','Accept'),(3,'barath','12345','7299913961','1croreprojects.javateam@gmail.com','chennai','Tulips.jpg','Accept'),(4,'nivetha ','nive','7299913961','1croreprojects.javateam@gmail.com','chennai','Tulips.jpg','Accept'),(5,'Gokul','1234','7967756445','gokulabi@gmail.com','Vadapalani','images.png','Accept');

UNLOCK TABLES;

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `fname` varchar(200) DEFAULT NULL,
  `count` int(200) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `result` */

LOCK TABLES `result` WRITE;

insert  into `result`(`id`,`fname`,`count`) values (1,'New Text Document.txt',6),(2,'New Text Document.txt',6);

UNLOCK TABLES;

/*Table structure for table `user_register` */

DROP TABLE IF EXISTS `user_register`;

CREATE TABLE `user_register` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `mail` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `profile` text,
  `status` varchar(200) DEFAULT 'waiting',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `user_register` */

LOCK TABLES `user_register` WRITE;

insert  into `user_register`(`id`,`name`,`password`,`mobile`,`mail`,`city`,`profile`,`status`) values (1,'nivetha','nive','8765676562','1croreprojects.javateam@gmail.com','chennai','Penguins.jpg','Accept'),(2,'sri','sri','8877665544','1croreprojects.javateam@gmail.com','chennai','Koala.jpg','Accept'),(3,'sathya','12345','2345678922','1croreprojects.javateam@gmail.com','vadapalani','Desert.jpg','Accept'),(4,'Abi','1234','7967756445','gokulabi@gmail.com','Vellore','images.png','Accept');

UNLOCK TABLES;

/*Table structure for table `val` */

DROP TABLE IF EXISTS `val`;

CREATE TABLE `val` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `fname` varchar(200) DEFAULT NULL,
  `ke` varchar(200) DEFAULT NULL,
  `count` int(200) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `val` */

LOCK TABLES `val` WRITE;

insert  into `val`(`id`,`fname`,`ke`,`count`) values (1,'New Text Document.txt','reviews',3),(2,'New Text Document.txt','reviews',3);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
