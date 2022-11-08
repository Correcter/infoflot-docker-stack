## Docker Build: Nginx, php-fpm, HAProxy + MariaDB + phpMyAdmin, Redis

Docker Build: Configuration of LHNMPRR stack instances.

##### Assembly Features:

For dynamic configuration management of distributed applications, it is proposed to use **[Blocking](https://github.com/ehazlett/interlock/tags )** extension.

Basic configuration:
- **1** Cyclic proxy server based on nginx:alpine;
- **2** Nginx nginx servers:alpine;
- **3** instances of php7.0-fpm;
- **1** redis node:3.2-Alpine;
- **1** HAProxy node for MariaDB load balancing;
- **2** the MariaDB Gallery node in the cluster;
- **1** phpMyAdmin instance for working with MariaDB Gallery in graphical mode;

<span style="color:blue">*Note*</span>

- The basic stack configuration may not meet the optimal settings for your hardware;
- To clarify the configuration of the preset, read the instructions [Optimal workload](https://github.com/Correcter/infoflot-docker-stack/blob/master/workload.md )
- each node is scaled n-times depending on the load on the system

<span style="color:red">*Attention*</span>

Installation with default parameters:
``
curl https://raw.githubusercontent.com/Correcter/infoflot-docker-stack/master/install.sh | sudo bash
``
#### Installer work:

- Installation of all necessary components for Docker operation;
- Build and configure the application stack, database with replica;
- Stack rescaling (default);
- Downloading and configuring __**demo**__ projects from public repositories;
- Installation of current dependencies via **php composer**

```
Docker Requirements:
   17.04.0+ 

Use with custom settings:
      
docker-create COMMANDS:
    "up" up the application stack
   --scale <application> = num_of_instances
   --help, h Shows a list of commands or help for a single command
   
GLOBAL PARAMETERS:
--debug, -D Enable debugging logging
   --help, -h show help
--version, -v print version
```

### Build and launch applications manually

##### docker-create an assembly
##### docker-compose --scale docker-compose up --scale mariadb=2 php=3
##### docker-compose
```
The result of executing the command should be as follows:

Creating infoflot-docker-stack_robinproxy_1 ... done
Creating infoflot-docker-stack_phalcon_1 ... done
Creating infoflot-docker-stack_yii2_1 ... done
Creating infoflot-docker-stack_php1_1 ... done
Creating infoflot-docker-stack_php2_1 ... done
Creating infoflot-docker-stack_php3_1 ... done
Creating infoflot-docker-stack_mariadb-haproxy_1 ... done
Creating infoflot-docker-stack_mariadb_1 ... done
Creating infoflot-docker-stack_mariadb_2 ... done
Creating infoflot-docker-stack_redis_1 ... done

Launching infoflot-docker-stack_robinproxy_1 ... completed
Launching infoflot-docker-stack_phalcon_1 ... done
Launching infoflot-docker-stack_yii2_1 ... done
Launching infoflot-docker-stack_php1_1 ... done
Launching infoflot-docker-stack_php2_1 ... done
Launching infoflot-docker-stack_php3_1 ... done
Launching infoflot-docker-stack_mariadb-haproxy_1 ... completed
Launching infoflot-docker-stack_mariadb_1 ... done
Launching infoflot-docker-stack_mariadb_2 ... done
Launching infoflot-docker-stack_redis_1 ... done
