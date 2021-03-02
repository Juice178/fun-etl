from airflow import DAG, settings
from airflow.executors.celery_executor import CeleryExecutor
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta



def _fetch_artist_info(artist, **context):
    print(context)
    # test_url = 'https://en.wikipedia.org/wiki/Zara_Larsson'
    artist = "Zara Larsson"
    scraper = ArtistScraper()
    scraper.fetch_artist_info(artistl)
    return True

default_args = {
    'owner': 'Airflow', 
    'depends_on_past' : False, 
    'start_date' : datetime(2020, 8, 1), 
    # 'end_date' : datetime(2020, 3, 2),
    # 'email': ['ariflow@example.com'], 
    # 'email_on_failure': False, 
    # 'email_on_retry': False, 
    'retries': 0,
    'retry_delay': timedelta(minutes=10), 
    # 'queue': 'bash_queue',
    # 'pool': 'backfill',
    # 'priority_weight': 10,
    # 'end_date': datetime(2016, 1, 1),
}


DAG_NAME = "artist-info"

dag = DAG(
      dag_id=DAG_NAME, default_args=default_args, schedule_interval="@once"
    )

t0 = DummyOperator(
    task_id='start',
    trigger_rule='dummy',
    dag=dag,
)


t0
    
