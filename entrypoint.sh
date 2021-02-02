#!/bin/bash
airflow db init && airflow scheduler && airflow webserver --port 8080