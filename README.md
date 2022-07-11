# flask-jwt

> Run this command to install python environment
- python3 -m venv env
> Install environment data
- pip install -r requirements.txt
> Run flask
- uwsgi --socket 0.0.0.0:7000 --protocol=http -w __init__:app
