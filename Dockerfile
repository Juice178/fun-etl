FROM  python:3.8.5-slim-buster
RUN apt-get update
RUN apt-get install -y curl gcc
# RUN apt-get install -y curl gcc python3-dev
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
RUN mkdir opt/src
WORKDIR opt
COPY . .
RUN ls
# ENV PATH $HOME/.poetry/bin
ENV PATH = "${PATH}:/root/.poetry/bin"
# RUN echo $PATH
# RUN poetry --version
# RUN poetry update
# RUN poetry init && poetry update
RUN poetry export -f requirements.txt --output requirements.txt --without-hashes
RUN pip install -r requirements.txt --constraint constraints-3.8.txt 

# RUN for item in $(cat constraints-3.8.txt); do   poetry add "${item}"; done

# pip install apache-airflow==2.0.0 \
#  --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.0.0/constraints-3.8.txt"

CMD ["/bin/bash"]