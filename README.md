# py-tpcc

1. 각종 라이브러리들 설치해야 함.

2. MongoDB에서 multi-document 트랜잭션 하기 위해서는 1. shared cluster, 2. replica set 둘 중 하나여야 함.
    - 여기선 a non-sharded Replica Set with 1 node로 설정.
    - 설정 방법?
        1. 열려있는 모든 mongo, mongod 프로세스 종료
        2. mongod --port 27017 --dbpath C:\data\db --replSet rs0 --bind_ip localhost
            - 윈도우 서비스로 등록시켜주면 이거 매번 안해도 됨.
        3. mongo 쉘에서 rs.initiate()
   
3. 벤치마크 방법
    1. 우선 configuration 파일을 뽑음
        - python ./tpcc.py --print-config mongodb > mongodb.config
 
    2. 그 뒤 데이터 load
        - python ./tpcc.py --no-execute --warehouses 1 --config=mongodb.config mongodb
        
        시간 재려면, PowerShell에서
        -  Measure-Command {python ./tpcc.py --no-execute --warehouses 1 --config=mongodb.config mongodb}
    3. 그 뒤 트랜잭션 실행
        - python ./tpcc.py --no-load --warehouses 1 --config=mongodb.config mongodb
        
        시간 재려면, PowerShell에서
        -  Measure-Command {python ./tpcc.py --no-load --warehouses 1 --config=mongodb.config mongodb}
    4. 테스트 후 데이터 삭제
        - mongo 쉘에서, 1. use tpcc, 2. db.dropDatabase(), 3. use local 후 2번 실행.
    - 옵션들
        - --warehouses=int
            - warehouse (TPC-C의 데이터 단위)의 수
        - --duration=int
            - 데이터를 로드한 후 벤치마크 때 실행시킬 시간 (초 단위)
        - --clientprocs=int
            - 각각의 클라이언트 노드에서 실행할 쓰레드 갯수 

## 환경

- OS: Windows 10, 2004
- CPU: R5 3600
- RAM: 16GB
- Storage: MX500 1TB
- MongoDB: 4.2.8
- Python: 3.8.2