# MongoDB Adapted TPC-C Benchmark Using Python 3

The goal of this repository is to benchmark MongoDB using the TPC-C benchmark.

For more information about TPC-C benchmark adaption for MongoDB, please see [this paper](http://www.vldb.org/pvldb/vol12/p2254-kamsky.pdf).

## Prerequisite

1. Install [MongoDB](https://www.mongodb.com/download-center/community).

2. Install [Python](https://www.python.org/downloads/).

3. Install pip modules.

    ```shell
    pip install pymongo
    pip install execnet
    ```

## Setup

To use multi-document actions on MongoDB, a database should be either a shared cluster or a replica set.

In this test, I used a non-shared replica set with one node in order to make configuration simple.

To run 'mongod' as a replica set on localhost, run the server as below:

1. Terminate all the mongo and mongod process.

2. Run the MongoDB server.
    ```powershell
    mongod --port 27017 --dbpath YOUR_DB_DIRECTORY_PATH --replSet rs0 --bind_ip localhost
    ```

3. Initialize a replica set on client side.
    ```powershell
    mongo # start mongo shell
    > rs.initiate()
    ```

## Run the benchmark

In TPC-C tests, the amount of data is determined by the number of `warehouses`.

In this test, I used 100 warehouses and the benchmarks ran for 600 seconds. 

The number of clients (threads) varied from 1 to 48.

1. First, generate a MongoDB configuration file.
    ```powershell
    python ./tpcc.py --print-config mongodb > mongodb.config
    ```

2. Load the data.
    ```powershell
    # It takes about an hour and a half when there are 100 warehouses.
    python ./tpcc.py --no-execute --warehouses=100 --config=mongodb.config mongodb
    ```
    To measure how long the command takes to run on Windows, use this line instead.
    ```powershell
    Measure-Command {python ./tpcc.py --no-execute --warehouses=100 --config=mongodb.config mongodb}
    ```
    Once you load the data, the data can be reused through multiple benchmarks.
    
3. Execute the benchmark
    ```powershell
    python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=1 --config=mongodb.config mongodb
    # If you would like to measure the elapsed time
    Measure-Command {python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=1 --config=mongodb.config mongodb}
    ```
    
4. Delete the data after finishing the tests.
    ```powershell
    mongo
    > use tpcc
    > db.dropDatabase()
    > use local
    > db.dropDatabase() # The mongo server has to stop running to drop local.
    ```
    
## Arguments

1. `--no-execute`: Load the data only.

2. `--no-load`: Execute the benchmark only.

3. `--warehouses=int`: The number of warehouses to use. Default: 4.

4. `--duration=int`: How long to the execution phase of the benchmark (in seconds). Default: 60.

5. `--clients=int`: The process number of a single node (for concurrent execution). Default: 1.

## Environment

- `OS`: Windows 10, 2004

- `CPU`: R5 3600

- `RAM`: 16GB

- `Storage`: MX500 1TB

- `MongoDB`: 4.2.8

- `Python`: 3.8.2
