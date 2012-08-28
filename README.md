redis-scripts
=============

Redis Lua scripts for extended functionality

Usage suggestion:
* First load the scripts from the commandline:
  ``` 
  $ redis-cli script load $(cat /path/to/lua/script/file) 
  ```
* The above command outputs an sha1sum, use that from the client libraries you are using with the EVALSHA command