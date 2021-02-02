FROM  python:3.8.5-slim-buster


ARG AIRFLOW_USER_HOME=/usr/local/airflow
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}


RUN apt-get update
RUN apt-get install -y curl gcc supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# RUN apt-get install -y curl gcc python3-dev
# RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
# # RUN mkdir opt/src
# WORKDIR opt
WORKDIR ${AIRFLOW_USER_HOME}
COPY . .
# RUN ls
# ENV PATH $HOME/.poetry/bin
# ENV PATH = "${PATH}:/root/.poetry/bin"
# RUN echo $PATH
# RUN poetry --version
# RUN poetry update
# RUN poetry init && poetry update
# RUN poetry export -f requirements.txt --output requirements.txt --without-hashes

# RUN pip install -r requirements.txt
RUN pip install apache-airflow==2.0.0 --constraint constraints-3.8.txt 

# COPY entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# EXPOSE 8080 5555 8793
RUN airflow db init
EXPOSE 8080
# USER airflow
WORKDIR ${AIRFLOW_USER_HOME}
CMD ["/usr/bin/supervisord"]
# ENTRYPOINT ["/entrypoint.sh"]
# CMD ["airflow webserver"]