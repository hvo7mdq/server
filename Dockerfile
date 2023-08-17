FROM python:3.11-slim as python-base

RUN apt-get update -y

#poetry
ENV POETRY_VERSION=1.5.1 \
    POETRY_HOME="/opt/poetry" \
    ETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1

ENV PATH="$POETRY_HOME:$PATH"
#RUN pip install -U virtualenv
RUN curl -sSL https://install.python-poetry.org | python

#code
WORKDIR /code
COPY . /code/
# RUN export PATH="$POETRY_HOME/bin:$PATH"
#CMD [ "poetry --version" ] 
#RUN poetry --version
#finally
ENTRYPOINT [ "/code/entrypoint/runserver.sh" ]