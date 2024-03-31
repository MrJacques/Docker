
# Description

This directory contains the configuration and setup for various services of the website.

- `filebrowser/`: This directory contains the setup for the FileBrowser service. The `setup_filebrowser.csh` script sets up the necessary directories and environment for FileBrowser. The `config/` and `data/` directories are created by this script for FileBrowser's configuration and data respectively.

- `nginx/`: This directory contains the configuration for the Nginx service. The `conf.d/` directory is where you can place your server block configurations. The `nginx-compose.yaml` file is used to set up the Nginx service with Docker Compose.

- `site1-jupyter/`: This directory contains the Docker Compose configuration for the Jupyter service in `site1-jupyter-compose.yaml`.

- `site1-wordpress/`: This directory contains the setup for the WordPress service. The `wp-config.php` file contains the configuration for WordPress, including handling of HTTPS when behind a proxy server.

## Network and SSL Configuration

All the services (stacks) are connected to the private `nginx-network`. This network is defined in the `nginx-compose.yaml` file and is used to facilitate communication between the Nginx service and the other services.

Nginx acts as a reverse proxy for all the other services providing a public facing SSL layer. It accepts all incoming requests and forwards them to the appropriate service based on the request's URL. This allows all services to be accessible from a single entry point, simplifying the network configuration.
