FROM python:3.10-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

ENV PORT 8080
RUN mkdir -p ~/.streamlit && \
    echo "\
    [server]\n\
    port = 8080\n\
    enableCORS = false\n\
    headless = true\n\
    " > ~/.streamlit/config.toml

CMD ["streamlit", "run", "app.py"]
