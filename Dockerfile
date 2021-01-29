FROM  python:3.8.5-slim-buster
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
RUN poetry --version
RUN peotry init && poetry update
RUN poetry export -f requirements.txt --output requirements.txt
RUN pip install -r requirements.txt --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.0.0/constraints-3.8.txt

# RUN for item in $(cat constraints-3.8.txt); do   poetry add "${item}"; done

# pip install apache-airflow==2.0.0 \
#  --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.0.0/constraints-3.8.txt"

CMD ["bin/bash"]