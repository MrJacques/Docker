An educationional test case setting up a proxy meant to secure other containers serving up HTTP with SSL.

This simple test has three seperate stacks (each with one container.)

- Web server 01 - Simple default web server on port 80
- Web server 02 - Simple default web server on port 8000
- Web server proxy - Proxy server exposing port 1000 & 1001

All three stacks use an internal network myPrivateNet to communicate with each other.

The private network should be created before creating the stacks with the following command:

	docker network create \
	  --driver bridge \
	  --internal \
	  --subnet=172.18.0.0/24 \
	  --ip-range=172.18.0.2/24 \
	  --opt com.docker.network.bridge.name=myPrivateNet \
	  myPrivateNet
  
The following files should be modified to set the correct volume files:
- server-02-compose.yaml
- web-server-proxy.yaml

The following file should be modified with the correct host name of the docker server:
- nginx.conf

Use the make-certificate script in the make-ssl-certs directory to make the following certifictes:

- Signing cert (rootCA.crt) to be imported into your browser
- Server public key (server.crt) - Copy into ssl directory
- Server private key (server.key) - Copy into ssl directory

This will stop the "site not trusted" messages in the browser.

Once the certs are created and put where they belong, and after the private network has been created, the three stacks can be started.
 
 You should be able to navigate to the following urls:
 
 - https://YOUR_HOSTNAME:1000
 - https://YOUR_HOSTNAME:1001
 
 
