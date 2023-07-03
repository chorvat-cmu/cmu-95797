CREATE SCHEMA ny_transport_schema;

PRAGMA temp_directory='/home/cmhorvat/tmp.tmp';

CREATE TABLE daily_citi_bike_trip_counts_and_weater 
AS SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/daily_citi_bike_trip_counts_and_weather.csv');

CREATE TABLE central_park_weather
AS SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/central_park_weather.csv');

CREATE TABLE fhv_bases
AS SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/fhv_bases.csv');

CREATE TABLE fhv_tripdata (
    dispatching_base_num VARCHAR,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,
    pulocationid DOUBLE,
    dolocationid DOUBLE,
    sr_flag INT32,
    affiliated_base_number VARCHAR
);

INSERT INTO fhv_tripdata
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2020-01.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2020-02.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2020-03.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2020-04.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2020-05.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2020-06.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2020-07.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2020-08.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2020-09.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2020-10.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2020-11.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2020-12.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2021-01.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2021-02.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2021-03.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2021-04.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2021-05.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2021-06.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2021-07.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2021-08.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2021-09.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2021-10.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2021-11.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhv_tripdata_2021-12.parquet');

CREATE TABLE fhvhv_tripdata (
    hvfhs_license_num VARCHAR,
    dispatching_base_num VARCHAR,
    originating_base_num VARCHAR,
    request_datetime TIMESTAMP,
    on_scene_datetime TIMESTAMP,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,
    PULocationID DOUBLE,
    DOLocationID DOUBLE,
    trip_miles INT64,
    trip_time INT64,
    base_passenger_fare DOUBLE,
    tolls DOUBLE,
    bcf DOUBLE,
    sales_tax DOUBLE,
    congestion_surcharge DOUBLE,
    airport_fee DOUBLE,
    tips DOUBLE,
    driver_pay DOUBLE,
    shared_request_flag VARCHAR,
    shared_match_flag VARCHAR,
    access_a_ride_flag VARCHAR,
    wav_request_flag VARCHAR,
    wav_match_flag VARCHAR
);

INSERT INTO fhvhv_tripdata
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2020-01.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2020-02.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2020-03.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2020-04.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2020-05.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2020-06.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2020-07.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2020-08.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2020-09.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2020-10.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2020-11.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2020-12.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2021-01.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2021-02.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2021-03.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2021-04.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2021-05.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2021-06.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2021-07.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2021-08.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2021-09.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2021-10.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2021-11.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/fhvhv_tripdata_2021-12.parquet');

CREATE TABLE green_tripdata (
    VendorID INT64,
    lpep_pickup_datetime TIMESTAMP,
    lpep_dropoff_datetime TIMESTAMP,
    store_and_fwd_flag VARCHAR,
    RatecodeID DOUBLE,
    PULocationID INT64,
    DOLocationID INT64,
    passenger_count DOUBLE,
    trip_distance DOUBLE,
    fare_amount DOUBLE,
    extra DOUBLE,
    mta_tax DOUBLE,
    tip_amount DOUBLE,
    tolls_amount DOUBLE,
    ehail_fee INT32,
    improvement_surcharge DOUBLE,
    total_amount DOUBLE,
    payment_type DOUBLE,
    trip_type DOUBLE,
    congestion_surcharge DOUBLE
);

INSERT INTO green_tripdata
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2020-01.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2020-02.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2020-03.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2020-04.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2020-05.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2020-06.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2020-07.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2020-08.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2020-09.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2020-10.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2020-11.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2020-12.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2021-01.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2021-02.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2021-03.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2021-04.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2021-05.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2021-06.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2021-07.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2021-08.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2021-09.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2021-10.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2021-11.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/green_tripdata_2021-12.parquet');

CREATE TABLE yellow_tripdata (
    VendorID INT64,
    tpep_pickup_datetime TIMESTAMP,
    tpep_dropoff_datetime TIMESTAMP,
    passenger_count DOUBLE,
    trip_distance DOUBLE,
    RatecodeID DOUBLE,
    store_and_fwd_flag VARCHAR,
    PULocationID INT64,
    DOLocationID INT64,
    payment_type INT64,
    fare_amount DOUBLE,
    extra DOUBLE,
    mta_tax DOUBLE,
    tip_amount DOUBLE,
    tolls_amount DOUBLE,
    improvement_surcharge DOUBLE,
    total_amount DOUBLE,
    congestion_surcharge DOUBLE,
    airport_fee INT32
);

INSERT INTO yellow_tripdata
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2020-01.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2020-02.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2020-03.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2020-04.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2020-05.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2020-06.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2020-07.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2020-08.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2020-09.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2020-10.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2020-11.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2020-12.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2021-01.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2021-02.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2021-03.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2021-04.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2021-05.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2021-06.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2021-07.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2021-08.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2021-09.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2021-10.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2021-11.parquet')
UNION ALL
SELECT * FROM read_parquet('/home/cmhorvat/s3data/data/taxi/yellow_tripdata_2021-12.parquet');

CREATE TABLE bike_data (
    tripduration INT64,
    startime TIMESTAMP,
    stoptime TIMESTAMP,
    "start station id" DOUBLE,
    "start station name" VARCHAR,
    "start station latitude" DOUBLE,
    "start station longitude" DOUBLE,
    "end station id" DOUBLE,
    "end station name" VARCHAR,
    "end station latitude" DOUBLE,
    "end station longitude" DOUBLE,
    bikeid DOUBLE,
    usertype VARCHAR,
    "birth year" VARCHAR,
    gender VARCHAR
);

INSERT INTO bike_data
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202001-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202002-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202003-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202004-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202005-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202006-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202007-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202008-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202009-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202010-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202011-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202012-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202101-citibike-tripdata.csv.gz', ALL_VARCHAR=1);

CREATE TABLE bike_data_2 (
    ride_id VARCHAR,
    rideable_type VARCHAR,
    started_at VARCHAR,
    ended_at VARCHAR,
    start_station_name VARCHAR,
    start_station_id VARCHAR,
    end_station_name VARCHAR,
    end_station_id VARCHAR,
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR
);

INSERT INTO bike_data_2
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202102-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202103-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202104-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202105-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202106-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202107-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202108-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202109-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202110-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202111-citibike-tripdata.csv.gz', ALL_VARCHAR=1)
UNION ALL
SELECT * FROM read_csv_auto('/home/cmhorvat/s3data/data/bike/202112-citibike-tripdata.csv.gz', ALL_VARCHAR=1);


ALTER TABLE bike_data
ADD COLUMN ride_id VARCHAR,
ADD COLUMN rideable_type VARCHAR,
RENAME "start station id" TO start_station_id,
RENAME "start station name" TO start_station_name,
RENAME "start station latitude" TO start_lat,
RENAME "start station longitude" TO start_lng,
RENAME "end station id" TO end_station_id,
RENAME "end station name" TO end_station_name,
RENAME "end station latitude" TO end_lat,
RENAME "end station longitude" TO end_lng,
RENAME "startime" TO started_at,
RENAME "stoptime" TO ended_at,
RENAME "birth year" TO birth_year,
ADD COLUMN member_casual VARCHAR;

ALTER TABLE bike_data_2
ADD COLUMN tripduration VARCHAR,
ADD COLUMN birth_year,
ADD COLUMN gender,
ADD COLUMN usertype,
ADD COLUMN bikeid;

CREATE TABLE bike_data_all
SELECT ride_id,
    rideable_type,
    start_station_id,
    start_station_name,
    start_lat,
    start_lng,
    end_station_id,
    end_station_name,
    end_lat,
    end_lng,
    started_at,
    ended_at,
    tripduration,
    birth_year,
    gender,
    usertype,
    bikeid,
    member_casual
FROM bike_data
UNION ALL
SELECT ride_id,
    rideable_type,
    start_station_id,
    start_station_name,
    start_lat,
    start_lng,
    end_station_id,
    end_station_name,
    end_lat,
    end_lng,
    started_at,
    ended_at,
    tripduration,
    birth_year,
    gender,
    usertype,
    bikeid,
    member_casual
FROM bike_data_2;



CREATE TABLE bike_data_2 (
    ride_id VARCHAR,
    rideable_type VARCHAR,
    started_at VARCHAR,
    ended_at VARCHAR,
    start_station_name VARCHAR,
    start_station_id VARCHAR,
    end_station_name VARCHAR,
    end_station_id VARCHAR,
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR
);

CREATE TABLE bike_data (
    tripduration INT64,
    startime TIMESTAMP,
    stoptime TIMESTAMP,
    "start station id" DOUBLE,
    "start station name" VARCHAR,
    "start station latitude" DOUBLE,
    "start station longitude" DOUBLE,
    "end station id" DOUBLE,
    "end station name" VARCHAR,
    "end station latitude" DOUBLE,
    "end station longitude" DOUBLE,
    bikeid DOUBLE,
    usertype VARCHAR,
    "birth year" VARCHAR,
    gender VARCHAR
);