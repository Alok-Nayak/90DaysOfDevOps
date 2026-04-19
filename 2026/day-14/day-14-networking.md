# day-14: Networking Fundamentals & Hands-on Checks

## OSI vs TCP/IP

OSI and TCP/IP are both logical models. They both describe how information is transmitted between two devices across a network.
- This help's in isolate points of failure more efficiently.
- OSI: Conceptual.
- TCP/IP: practical real world networking.

### OSI : Open Systems Interconnection
 - The OSI model is a conceptual framework that divides network communications functions into seven layers.
 - The OSI data model provides a universal language for computer networking, so diverse technologies can communicate using standard protocols or rules of communication.
 - It is a 7-layer conceptual framework used to understand and design network communication. 
 - Each layer has a clearly defined function and works independently of the others.

1. Layer 7: Application Layer 
2. Layer 6: Presentation Layer 
3. Layer 5: Session Layer
4. Layer 4: Transport Layer 
5. Layer 3: Network Layer
6. Layer 2: Data Link Layer
7. Layer 1: Physical Layer

#### Memory Trick OSI Model:
> (A)aare__(P)ushpa___(S)aath___(T)o___(N)ibha___(D)eti___(P)agli

### TCP/IP : Transmission Control Protocol/Internet Protocol

    - The TCP/IP model is a 5-layer practical networking framework used for real-world communication, especially on the Internet. 
    - It defines how data is packaged, addressed, transmitted, routed, and received across networks.

- TCP/IP model is comprised of five different layers: 

1. The physical layer
2. The data link layer
3. The network layer
4. The transport layer
5. They application layer
-----


|Protocol  | Layer      |
|----------|------------|
|IP	       |Internet    |
|TCP/UDP   |Transport   |
|HTTP/HTTPS|Application |
|DNS       |Application |

-----
**Example:** curl https://example.com → Application layer over TCP over IP

## Hands-on Checklist

Target service: `google.com`

1. Identity: `hostname -I ` (or `ip addr show`) — note your IP.
![hostname -i](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/2150df2fab6f5d833b64ac34a466f5cbcd360dd0/2026/day-14/day-14-networking-snapshots/day-14-1-hostname.png)    
2. Reachability: `ping <target>`  — mention latency and packet loss.
![ping](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/2150df2fab6f5d833b64ac34a466f5cbcd360dd0/2026/day-14/day-14-networking-snapshots/day-14%20-2-ping.png)    
Observation: Latency ~319 ms, 0% packet loss.
3. Path: `traceroute <target>` (or `tracepath`) — note any long hops/timeouts.
![traceroute](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/2150df2fab6f5d833b64ac34a466f5cbcd360dd0/2026/day-14/day-14-networking-snapshots/day-14-3-traceroute.png)    
Observation: Shows each hop and any long delays/timeouts (~343 ms).
4. Ports: `ss -tulpn` (or `netstat -tulpn`) — list one listening service and its port.
![ss -tulpn](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/2150df2fab6f5d833b64ac34a466f5cbcd360dd0/2026/day-14/day-14-networking-snapshots/day-14-4-ss-tulnp.png)  
Observation: Using ss -tulpn, I identified multiple listening services on my system.
A web service is listening on port 80, accessible on all interfaces, while a Python process is listening on 127.0.0.1, meaning it is only accessible locally.
5. Name resolution: ` dig <domain> ` or ` nslookup <domain> ` — record the resolved IP.
![dig](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/2150df2fab6f5d833b64ac34a466f5cbcd360dd0/2026/day-14/day-14-networking-snapshots/day-14-5-dig.png)  
Observation: Using dig and nslookup, I verified that the domain google.com successfully resolves to multiple IP addresses.
6. HTTP check: ` curl -I <http/https-url> ` — note the HTTP status code.
![curl -I](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/2150df2fab6f5d833b64ac34a466f5cbcd360dd0/2026/day-14/day-14-networking-snapshots/day-14-6-curl-I.png)    
Observation: The server returned a 301 redirect, indicating that requests to google.com are redirected to www.google.com. The response was served over HTTP/2.
7. Connections snapshot: `netstat -an | head `
![netstat -an](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/2150df2fab6f5d833b64ac34a466f5cbcd360dd0/2026/day-14/day-14-networking-snapshots/day-14-7-netstat.png) 
- I inspected active network connections and listening ports on my system. The output showed services listening on ports like 53 (DNS) and 80 (HTTP), along with several established HTTPS connections to external servers

----

# Port Probe & Interpret
command used:
```command
netstat -tulpn
```
Observation:
Connection is successful and port(80) is reachable.

Now to know which service is using that port we can check with:
```command
sudo ss -tulpn | grep :<port>
sudo lsof -i :<port>
```
- 
Check service status: ` systemctl status <service> `
Check iptables: ` sudo iptables -L -n ` 
-
![port, probe, internet](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/2150df2fab6f5d833b64ac34a466f5cbcd360dd0/2026/day-14/day-14-networking-snapshots/day-14-8-port-probe-internet.png)    
## Reflection
- Fastest signal when something is broken: ` ping <url>`
### What layer to check?
- If DNS fails:  Application layer (DNS) + Internet layer (IP)
- If HTTP 500:   Application layer (server-side issue)


### Follow-up checks in real incident

- Check service status and logs using ` systemctl status nginx `
- Identify crashes or config issues   ` journalctl -u nginx `
- Verify application response using `curl -I http://localhost`


