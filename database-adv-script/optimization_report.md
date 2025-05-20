
# Before optimisation

QUERY PLAN                                                             
-----------------------------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=40.91..70.25 rows=1002 width=392) (actual time=0.469..1.355 rows=1004 loops=1)
   Hash Cond: (b.property_id = p.property_id)
   ->  Hash Join  (cost=38.85..65.33 rows=1002 width=102) (actual time=0.439..1.082 rows=1004 loops=1)
         Hash Cond: (b.user_id = u.user_id)
         ->  Hash Right Join  (cost=36.55..60.21 rows=1002 width=84) (actual time=0.411..0.830 rows=1004 loops=1)
               Hash Cond: (pm.booking_id = b.booking_id)
               ->  Seq Scan on payment pm  (cost=0.00..21.02 rows=1002 width=34) (actual time=0.004..0.104 rows=1002 loops=1)
               ->  Hash  (cost=24.02..24.02 rows=1002 width=66) (actual time=0.401..0.402 rows=1002 loops=1)
                     Buckets: 1024  Batches: 1  Memory Usage: 106kB
                     ->  Seq Scan on booking b  (cost=0.00..24.02 rows=1002 width=66) (actual time=0.004..0.177 rows=1002 loops=1)
         ->  Hash  (cost=1.58..1.58 rows=58 width=50) (actual time=0.025..0.025 rows=58 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 13kB
               ->  Seq Scan on "User" u  (cost=0.00..1.58 rows=58 width=50) (actual time=0.004..0.012 rows=58 loops=1)
   ->  Hash  (cost=1.47..1.47 rows=47 width=306) (actual time=0.026..0.026 rows=47 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 12kB
         ->  Seq Scan on "Property" p  (cost=0.00..1.47 rows=47 width=306) (actual time=0.008..0.014 rows=47 loops=1)
 Planning Time: 0.419 ms
 Execution Time: 1.432 ms
(18 rows)
