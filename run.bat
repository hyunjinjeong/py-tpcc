python ./tpcc.py --reset --no-load --no-execute mongodb
python ./tpcc.py --no-execute --warehouses=100 --config=configs/trx_denorm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=1 --config=configs/trx_denorm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=1 --config=configs/notrx_denorm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=3 --config=configs/trx_denorm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=3 --config=configs/notrx_denorm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=6 --config=configs/trx_denorm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=6 --config=configs/notrx_denorm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=12 --config=configs/trx_denorm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=12 --config=configs/notrx_denorm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=24 --config=configs/trx_denorm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=24 --config=configs/notrx_denorm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=48 --config=configs/trx_denorm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=48 --config=configs/notrx_denorm.config mongodb
python ./tpcc.py --reset --no-load --no-execute mongodb
python ./tpcc.py --no-execute --warehouses=100 --config=configs/trx_norm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=1 --config=configs/trx_norm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=1 --config=configs/notrx_norm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=3 --config=configs/trx_norm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=3 --config=configs/notrx_norm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=6 --config=configs/trx_norm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=6 --config=configs/notrx_norm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=12 --config=configs/trx_norm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=12 --config=configs/notrx_norm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=24 --config=configs/trx_norm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=24 --config=configs/notrx_norm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=48 --config=configs/trx_norm.config mongodb
python ./tpcc.py --no-load --warehouses=100 --duration=600 --clients=48 --config=configs/notrx_norm.config mongodb
pause