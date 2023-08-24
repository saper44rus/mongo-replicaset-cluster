db = db.getSiblingDB('admin');
rs.initiate({
    "_id": "my_mdb_rs", 
    "version": 1, 
    "writeConcernMajorityJournalDefault": true, 
    "members": [
      { 
        "_id": 0, 
        "host": "170.17.5.5:27017", 
      }, 
      { 
        "_id": 1, 
        "host": "170.17.5.6:27017", 
      }, 
      { 
        "_id": 2, 
        "host": "170.17.5.7:27017", 
        arbiterOnly: true 
      }
    ]
  });