select * from actor;

actor_id|first_name |last_name   |last_update                  |
--------+-----------+------------+-----------------------------+
       1|PENELOPE   |GUINESS     |2022-02-15 15:04:33.000 +0530|
       2|NICK       |WAHLBERG    |2022-02-15 15:04:33.000 +0530|
       3|ED         |CHASE       |2022-02-15 15:04:33.000 +0530|

select * from category;

category_id|name       |last_update                  |
-----------+-----------+-----------------------------+
          1|Action     |2022-02-15 15:16:27.000 +0530|
          2|Animation  |2022-02-15 15:16:27.000 +0530|
          3|Children   |2022-02-15 15:16:27.000 +0530|
          4|Classics   |2022-02-15 15:16:27.000 +0530|

select * from film;

film_id|title                      |description                                                                                                                       |release_year|language_id|original_language_id|rental_duration|rental_rate|length|replacement_cost|rating|last_update                  |special_features                                            |fulltext                                                                                                                                                                                                     |
-------+---------------------------+----------------------------------------------------------------------------------------------------------------------------------+------------+-----------+--------------------+---------------+-----------+------+----------------+------+-----------------------------+------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
      1|ACADEMY DINOSAUR           |A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                                  |        2012|          1|                    |              6|       0.99|    86|           20.99|PG    |2022-09-10 22:16:03.905 +0530|{"Deleted Scenes","Behind the Scenes"}                      |'academi':1 'battl':15 'canadian':20 'dinosaur':2 'drama':5 'epic':4 'feminist':8 'mad':11 'must':14 'rocki':21 'scientist':12 'teacher':17                                                                  |
      2|ACE GOLDFINGER             |A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China                              |        2023|          1|                    |              3|       4.99|    48|           12.99|G     |2022-09-10 22:16:03.905 +0530|{Trailers,"Deleted Scenes"}                                 |'ace':1 'administr':9 'ancient':19 'astound':4 'car':17 'china':20 'databas':8 'epistl':5 'explor':12 'find':15 'goldfing':2 'must':14                                                                       |
      3|ADAPTATION HOLES           |A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory                                  |        2017|          2|                    |              7|       2.99|    50|           18.99|NC-17 |2022-09-10 22:16:03.905 +0530|{Trailers,"Deleted Scenes"}                                 |'adapt':1 'astound':4 'baloon':19 'car':11 'factori':20 'hole':2 'lumberjack':8,16 'must':13 'reflect':5 'sink':14                                                                                           |
      4|AFFAIR PREJUDICE           |A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                                      |        2023|          6|                    |              5|       2.99|   117|           26.99|G     |2022-09-10 22:16:03.905 +0530|{Commentaries,"Behind the Scenes"}                          |'affair':1 'chase':14 'documentari':5 'fanci':4 'frisbe':8 'lumberjack':11 'monkey':16 'must':13 'prejudic':2 'shark':19 'tank':20                                                                           |

select * from film_actor;

actor_id|film_id|last_update                  |
--------+-------+-----------------------------+
       1|      1|2022-02-15 15:35:03.000 +0530|
       1|     23|2022-02-15 15:35:03.000 +0530|
       1|     25|2022-02-15 15:35:03.000 +0530|
       1|    106|2022-02-15 15:35:03.000 +0530|

select * from film_category;

film_id|category_id|last_update                  |
-------+-----------+-----------------------------+
     56|         11|2022-02-15 15:37:09.000 +0530|
     62|          5|2022-02-15 15:37:09.000 +0530|
     95|          6|2022-02-15 15:37:09.000 +0530|
     39|          8|2022-02-15 15:37:09.000 +0530|

select * from inventory;

inventory_id|film_id|store_id|last_update                  |
------------+-------+--------+-----------------------------+
           1|      1|       1|2022-02-15 15:39:17.000 +0530|
           2|      1|       1|2022-02-15 15:39:17.000 +0530|
           3|      1|       1|2022-02-15 15:39:17.000 +0530|
           4|      1|       1|2022-02-15 15:39:17.000 +0530|
           5|      1|       2|2022-02-15 15:39:17.000 +0530|

select * from language;

language_id|name                |last_update                  |
-----------+--------------------+-----------------------------+
          1|English             |2022-02-15 15:32:19.000 +0530|
          2|Italian             |2022-02-15 15:32:19.000 +0530|
          3|Japanese            |2022-02-15 15:32:19.000 +0530|
          4|Mandarin            |2022-02-15 15:32:19.000 +0530|
          5|French              |2022-02-15 15:32:19.000 +0530|
          6|German              |2022-02-15 15:32:19.000 +0530|

select * from payment;

payment_id|customer_id|staff_id|rental_id|amount|payment_date                 |
----------+-----------+--------+---------+------+-----------------------------+
     16051|        269|       1|       98|  0.99|2022-01-29 07:28:52.222 +0530|
     16065|        274|       1|      147|  2.99|2022-01-25 17:44:16.895 +0530|
     16109|        297|       2|      143|  0.99|2022-01-28 06:19:49.128 +0530|
     16195|        344|       2|      157|  2.99|2022-01-31 11:28:51.176 +0530|

select * from rental;

rental_id|rental_date                  |inventory_id|customer_id|return_date                  |staff_id|last_update                  |
---------+-----------------------------+------------+-----------+-----------------------------+--------+-----------------------------+
        2|2022-05-25 03:24:33.000 +0530|        1525|        459|2022-05-29 00:10:33.000 +0530|       1|2022-02-16 08:00:53.000 +0530|
        3|2022-05-25 03:33:39.000 +0530|        1711|        408|2022-06-02 02:42:39.000 +0530|       1|2022-02-16 08:00:53.000 +0530|
        4|2022-05-25 03:34:41.000 +0530|        2452|        333|2022-06-03 06:13:41.000 +0530|       2|2022-02-16 08:00:53.000 +0530|
        5|2022-05-25 03:35:21.000 +0530|        2079|        222|2022-06-02 09:03:21.000 +0530|       1|2022-02-16 08:00:53.000 +0530|

select * from staff;

staff_id|first_name |last_name   |address_id|email                                         |store_id|active|username             |password                                |last_update                  |picture|
--------+-----------+------------+----------+----------------------------------------------+--------+------+---------------------+----------------------------------------+-----------------------------+-------+
       0|Tisha      |DuBuque     |        28|schneider9987@rosenbaumreichert.com           |      23|true  |sina.corkery         |8cb2237d0679ca88db6464eac60da96345513964|2022-05-16 20:43:11.793 +0530|       |
       1|Warner     |Hudson      |        45|hartmann1448@ratkehaley.com                   |      25|true  |fay.kub              |8cb2237d0679ca88db6464eac60da96345513964|2022-05-16 20:43:11.793 +0530|       |
       2|Lavone     |O_Reilly    |         6|mclaughlin3045@kleinwisokyandswaniawski.com   |      33|true  |gaston.wuckert       |8cb2237d0679ca88db6464eac60da96345513964|2022-05-16 20:43:11.793 +0530|       |
       3|Louie      |Walter      |        28|ondricka8612@baileykeebler.com                |      18|true  |lewis.damore         |8cb2237d0679ca88db6464eac60da96345513964|2022-05-16 20:43:11.793 +0530|       |


select * from store;

store_id|manager_staff_id|address_id|last_update                  |
--------+----------------+----------+-----------------------------+
       0|               0|        73|2022-02-15 15:27:12.000 +0530|
       1|               1|       129|2022-02-15 15:27:12.000 +0530|
       2|               2|        12|2022-02-15 15:27:12.000 +0530|
       3|               3|        71|2022-02-15 15:27:12.000 +0530|


select * from customer;

customer_id|store_id|first_name|last_name |email                                |address_id|activebool|create_date|last_update                  |active|
-----------+--------+----------+----------+-------------------------------------+----------+----------+-----------+-----------------------------+------+
          1|       1|MARY      |SMITH     |MARY.SMITH@sakilacustomer.org        |         5|true      | 2022-02-14|2022-02-15 15:27:20.000 +0530|     1|
          2|       1|PATRICIA  |JOHNSON   |PATRICIA.JOHNSON@sakilacustomer.org  |         6|true      | 2022-02-14|2022-02-15 15:27:20.000 +0530|     1|
          3|       1|LINDA     |WILLIAMS  |LINDA.WILLIAMS@sakilacustomer.org    |         7|true      | 2022-02-14|2022-02-15 15:27:20.000 +0530|     1|

select * from address;

address_id|address                               |address2|district            |city_id|postal_code|phone       |last_update                  |
----------+--------------------------------------+--------+--------------------+-------+-----------+------------+-----------------------------+
         1|47 MySakila Drive                     |        |Alberta             |    300|           |            |2022-02-15 15:15:30.000 +0530|
         2|28 MySQL Boulevard                    |        |QLD                 |    576|           |            |2022-02-15 15:15:30.000 +0530|
         3|23 Workhaven Lane                     |        |Alberta             |    300|           |14033335568 |2022-02-15 15:15:30.000 +0530|

select * from city;

city_id|city                   |country_id|last_update                  |
-------+-----------------------+----------+-----------------------------+
      1|A Corua (La Corua)     |        87|2022-02-15 15:15:25.000 +0530|
      2|Abha                   |        82|2022-02-15 15:15:25.000 +0530|
      3|Abu Dhabi              |       101|2022-02-15 15:15:25.000 +0530|

select * from country;

country_id|country                              |last_update                  |
----------+-------------------------------------+-----------------------------+
         1|Afghanistan                          |2022-02-15 15:14:00.000 +0530|
         2|Algeria                              |2022-02-15 15:14:00.000 +0530|
         3|American Samoa                       |2022-02-15 15:14:00.000 +0530|

