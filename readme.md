## Сборка Docker: Nginx, php-fpm, HAProxy + MariaDB + PhpMyadmin, Redis

Сборка Nginx Load Balancer для компании **ООО "INFOFLOT"**: управление несколькими экземплярами приложения, для облачной среды, позволяет отслеживать их, используя средства циклического DNS, встроенное в текущую сборку Docker.

##### Особенности сборки:

Для динамического управления конфигурацией распределенных приложений, предлагается использовать **[Interlock](https://github.com/ehazlett/interlock/tags)** расширение.

Базовая конфигурация:
- **1** Round-Robin proxy based on nginx:alpine;
- **2** Nginx servers nginx:alpine;
- **3** узла приложения основного сайта бронирования (dev-phalcon 3.0) nginx:latest;
- **2** узла сайта "конструктор круизов" (dev-yii2) nginx:latest;
- **3** экземпляров php7.0-fpm;
- **2** узла redis:3.2-alpine;
- **2** узла HAProxy для балансировки нагрузки MariaDB;
- **2** узла MariaDB Galera в кластере с Master-Master режиме репликации;
- **1** экземпляр PhpMyAdmin для работы с MariaDB Galera в графическом режиме;

<span style="color:blue">*Примечание*</span>

- Базовая конфигурация стека может не отвечать оптимальным настройкам для вашего железа;
- Для уточнения конфигурации предустановки, ознакомьтесь с инструкцией [Optimal workload](https://github.com/Correcter/infoflot-docker-stack/blob/master/workload.md)
- каждый узел масштабируется n-раз в зависимости от нагрузки на систему

<span style="color:red">*Внимание*</span>

*Установка доступна для пользователей с правами ``sudo``, совместима с Debian-подобными дистрибутивами. Тестировалась и работала на ОС Linux **Ubuntu server 16.4 x86_64***

Установка с параметрами по-умолчанию:
```
curl https://raw.githubusercontent.com/Correcter/infoflot-docker-stack/master/install.sh | sudo bash
```
####Работа установщика:

- Установка всех необходимых компонентов, для работы Docker;
- Сборка и настройка стека приложений, базы данных с репликой;
- Ремасштабирование стека (по-умолчанию);
- Скачивание и настройка __**демо**__ проектов из публичных репозиториев;
- Установка актуальных зависимостей через **php composer**

```
Требования к Docker:
   17.04.0+ 

Использование с пользовательскими настройками:
      
docker-compose COMMANDS:
    "up"  up app stack
   --scale <app> = num_of_instances
   --help, h  Shows a list of commands or help for one command
   
GLOBAL OPTIONS:
   --debug, -D      Enable debug logging
   --help, -h       show help
   --version, -v    print the version
```

### Сборка и запуск приложений вручную

##### docker-compose build
##### docker-compose --scale docker-compose up --scale dev-phalcon=1 dev-yii2=1 php=1 mariadb-haproxy=1 mariadb=2 redis=1
##### docker-compose up
```
The result of command should be like that:

Creating infoflot-docker-stack_robinproxy_1      ... done
Creating infoflot-docker-stack_phalcon_1         ... done
Creating infoflot-docker-stack_phalcon_2         ... done
Creating infoflot-docker-stack_phalcon_3         ... done
Creating infoflot-docker-stack_yii2_1            ... done
Creating infoflot-docker-stack_yii2_2            ... done
Creating infoflot-docker-stack_php_1             ... done
Creating infoflot-docker-stack_php_2             ... done
Creating infoflot-docker-stack_php_3             ... done
Creating infoflot-docker-stack_mariadb-haproxy_1         ... done
Creating infoflot-docker-stack_mariadb-haproxy_2         ... done
Creating infoflot-docker-stack_mariadb_1         ... done
Creating infoflot-docker-stack_mariadb_2         ... done
Creating infoflot-docker-stack_redis_1         ... done
Creating infoflot-docker-stack_redis_2         ... done
Creating infoflot-docker-stack_robinproxy_1     ... done
Starting infoflot-docker-stack_dev-phalcon_1     ... done
Starting infoflot-docker-stack_dev-phalcon_2     ... done
Starting infoflot-docker-stack_dev-phalcon_3     ... done
Starting infoflot-docker-stack_dev-yii2_1        ... done
Starting infoflot-docker-stack_dev-yii2_2        ... done
Starting infoflot-docker-stack_mariadb-haproxy_1         ... done
Starting infoflot-docker-stack_mariadb-haproxy_2         ... done
Starting infoflot-docker-stack_mariadb_1         ... done
Starting infoflot-docker-stack_mariadb_2         ... done
Starting infoflot-docker-stack_php_1             ... done
Starting infoflot-docker-stack_php_2             ... done
Starting infoflot-docker-stack_php_3             ... done
Starting infoflot-docker-stack_redis_1           ... done
Starting infoflot-docker-stack_redis_2           ... done

Attaching to infoflot-docker-stack_dev-robinproxy_1, infoflot-docker-stack_dev-phalcon_1, infoflot-docker-stack_dev-phalcon_2, infoflot-docker-stack_dev-phalcon_3, infoflot-docker-stack_dev-yii2_1, infoflot-docker-stack_dev-yii2_2, infoflot-docker-stack_mariadb_1, infoflot-docker-stack_mariadb_2, infoflot-docker-stack_redis_1, infoflot-docker-stack_redis_2```