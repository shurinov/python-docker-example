# python-docker-example
Easy example for deploy python project with docker

Install python
```
sudo apt update
sudo apt install python3 python3-venv
```

Using virtual enviroment and prepaing
```
python3 -m venv venv
source venv/bin/activate
```

For deactivate virtual enviroment
```
deactivate
```
Update requirements.txt
```
pip freeze > requirements.txt
```

## DOCKER

Build container
```
docker build -t python_test .
```

Run all as deamon
```
docker compose up -d
```

Show list of active containers 
```
docker compose ps -a
```

Show service logs:
```
docker compose logs ip
docker compose logs serv_one
docker compose logs serv_two
```

Show final container config
```
docker compose config
```

Remove containers
```
docker compose down
```

Prune all stopped docker containers, networks
```
docker system prune --all
```