FROM  python:3.8.5-slim-buster

# ARG AIRFLOW_USER_HOME=opt
# ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}

RUN apt-get update
RUN apt-get install -y curl gcc supervisor less
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# RUN apt-get install -y curl gcc python3-dev
# RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
# # RUN mkdir opt/src
# RUN mkdir opt/src
# WORKDIR ${AIRFLOW_USER_HOME}
# RUN pwd
WORKDIR opt
# RUN pwd
COPY src src
COPY constraints-3.8.txt .
COPY supervisord.conf .
# RUN ls src

RUN pip install apache-airflow==2.0.0 --constraint constraints-3.8.txt 

RUN airflow db init
EXPOSE 8080
# USER airflow
# WORKDIR ${AIRFLOW_USER_HOME}
CMD ["/usr/bin/supervisord"]
# ENTRYPOINT ["/entrypoint.sh"]
# CMD ["airflow webserver"]