# Web Infrastructure Design

### Task 0 - Simple one server architecture - Simple web stack
Consists of a single server containing the web server, app server, mysql db, and codebase. One set each.
.
Server - A server is a computer that listens for incoming requests to return the appropriate responses to the client.
.
The domain name is for easy remembrance by the end user.
.
The www in www.foobar.com is a CNAME record since www is a subdomain of the main domain foobar.com
.
The web server listens for HTTP requests and also responds in HTTP and returns something that can be viewed in a browser window, typically an HTML file.
.
The application server exposes the business logic of the application to clients, something like an API, but more than that.
.
The database stores data in an easy to access and secure manner. Usually manintained by a DBMS.
.
The server is using HTTP to communicate with the user's computer.
.
###### Here are the problems with this simple one server architecture:
SPOF - The entire system fails if the dns server goes down or the main nginx server goes down. There is little redundancy to counter the single points of failure. Every component is present in only one set.
.
If maintainance is being done, there will be downtime because all components appear in one set each.
.
Too much traffic may crash the server since there's no easy way to scale.

### Task 1 - Distributed web infrastructure
Load balancer - Balances the requests coming into the system between the two servers. It sends requests to the active server in the architecture.
.
A passive server - Is on standby to become active if the currently active server goes down for any reason. It provides redundancy to help minimize downtimes.
.
My load balancer is configured with HA Proxy that works with Round Robin algorithm which uses the servers in turns according to their weights. The higher the set weight of a server, the more connections it will receive. for instance, if one server has a weight of 5, and the other has a weight of 1, then the one with 5 will get 5 request connections for every 1 the other server gets.
Note: HA Proxy load balancers have other algorithms too, but mine is using the Round Robin.
.
I used Active - Passive and set the passive server weight to 0, to ensure it gets no connections while the active one is running. In Active-Active, both servers are running and receiving requests. In Active-Passive, only one is actively running with a heartbeat mechanism implemented between both servers to monitor them and automatically switch on the passive one if the active one goes down.
.
Database Primary-Replica works this way: The Primary/Master does all the active work. The Replica/Slave syncs up with the primary one regularly to have newest changes in it, and is switched on if the primary goes down.
.
I think the primary node is active, doing all the work. The replica syncs with the primary regularly to get the latest data. Any failover is automatically pushed to the replica node while the primary node is maintained.
.
###### Here are the problems with this architecture
SPOF - Load balancer and DNS Server
.
There are no firewalls to monitor traffic and no HTTPS to secure HTTP
.
No server monitoring to minimize downtime and security breaches
### Task 2 - Secured and monitored web infrastructure
