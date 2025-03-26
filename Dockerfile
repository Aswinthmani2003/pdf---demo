# Use the official Python image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy all files, including templates, into the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set Streamlit to run on the port expected by Cloud Run
ENV PORT 8080
RUN mkdir -p ~/.streamlit && \
    echo "\
    [server]\n\
    port = 8080\n\
    enableCORS = false\n\
    headless = true\n\
    " > ~/.streamlit/config.toml

# Run the application
CMD ["streamlit", "run", "app.py"]
