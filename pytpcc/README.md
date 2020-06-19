# py-tpcc

1. 각종 라이브러리들 설치해야 함.

2. MongoDB에서 multi-document 트랜잭션 하기 위해서는 1. shared cluster, 2. replica set 둘 중 하나여야 함.
    - 여기선 a non-sharded Replica Set with 1 node로 설정.
    - 설정 방법?
        1. 열려있는 모든 mongo, mongod 프로세스 종료
        2. mongod --port 27017 --dbpath C:\data\db --replSet rs0 --bind_ip localhost
        3. mongo 쉘에서 rs.initiate()
   
3. 벤치마크 방법
    1. 우선 configuration 파일을 뽑음
        - python ./tpcc.py --print-config mongodb > mongodb.config
    2. 그 뒤 데이터 load
        - python ./tpcc.py --no-execute --config=mongodb.config mongodb
    3. 그 뒤 트랜잭션 실행
        - python ./tpcc.py --no-load --config=mongodb.config mongodb
    4. 테스트 후 데이터 삭제
        - mongo 쉘에서, 1. use tpcc, 2. db.dropDatabase()
    