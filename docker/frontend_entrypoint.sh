python /code/manage.py makemigrations caffe_app --settings=ide.docker_settings
python /code/manage.py migrate --setting=ide.docker_settings

cd /code && npm install

/code/node_modules/.bin/webpack --progress
echo "#############PYTHON VERSION#############"
python --version
python /code/manage.py runserver 0.0.0.0:8080 --settings=ide.docker_settings


