## Setting up

Ensure Nodejs version is sufficient, check with `node -v`. Install required packages with `npm i`.

Edit the `.env` file to fill in appropriate Oracle DB credientials.

Remember to [set up Oracle Instant Client on machine](https://www.students.cs.ubc.ca/~cs-304/resources/javascript-oracle-resources/node-setup.html#:~:text=Deploy%20on%20your,local%20set%20up)) if running on local machine.


## Starting the application

Expect the app to be running on [localhost:65535](http://localhost:65535)

### UBC remote
- SSH to UBC server, navigate to app folder, run `sh ./remote-start.sh`. Note the port number given.
- Connect to the Oracle database by running `.\scripts\win\server-tunnel.cmd` for Windows or `sh ./scripts/mac/server-tunnel.sh` for Mac in terminal. Enter the port number previously noted.


### Local
- Connect to the Oracle database by running `.\scripts\win\db-tunnel.cmd` for Windows or `sh ./scripts/mac/db-tunnel.sh` for Mac in terminal.
- Sign in with CWL as usual.
	- Keep this terminal open, it is required to maintain connection to the CS dept. servers.
- In a new terminal on local machine, run `local-start.cmd` for Windows or `sh local-start.sh` for Mac.

