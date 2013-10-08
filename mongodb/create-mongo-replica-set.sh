#!/bin/bash
mkdir -p rs1 rs2 rs3
mongod --replSet dev --logpath "1.log" --dbpath rs1 --port 27017 --smallfiles --fork
mongod --replSet dev --logpath "2.log" --dbpath rs2 --port 27018 --smallfiles --fork
mongod --replSet dev --logpath "3.log" --dbpath rs3 --port 27019 --smallfiles --fork

sleep 5
# connect to one server and initiate the set
mongo --port 27017 << 'EOF'
config = { _id: "dev", members:[
          { _id : 0, host : "localhost:27017" },
          { _id : 1, host : "localhost:27018" },
          { _id : 2, host : "localhost:27019" }]};
rs.initiate(config)
EOF

