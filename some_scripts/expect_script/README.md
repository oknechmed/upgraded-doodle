# Expect_script
This script used for remote configuration of linux servers:

1. `expect_script.exp` take first entry with server information from `stations.csv`. 
2. `expect_script.exp` uploads and executes `script.sh`. 
3. After completion of `script.sh`, `expect_script.exp` removes that script from the remote server.
4. Take next entry and repeat steps 2 and 3
5. Quits when no more entries left
