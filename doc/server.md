# Server installation for TS monitor

The application requires the TeamSpeak server to have the b_virtualserver_client_list permission enabled for everyone.

## Steps to enable the permission

Open a telnet connection with `telnet [server] 10011` and run the following commands:

1. login serveradmin [password]
2. use [serverid]
3. servergrouplist (find the sgid for the Guest Server Query group)
4. servergroupaddperm sgid=1 permsid=b_virtualserver_client_list permvalue=1 permnegated=0 permskip=0
5. servergrouppermlist sgid=[sgid] -permsid (check that the permissions was assigned)
