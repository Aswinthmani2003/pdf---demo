# Use the official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Streamlit runs on port 8501 by default; Cloud Run expects 8080
# So we configure Streamlit to run on 0.0.0.0:8080
ENV PORT 8080
RUN echo "[server]\nport = 8080\nenableCORS = false\nheadless = true\n" > ~/.streamlit/config.toml

# Run Streamlit app
CMD ["streamlit", "run", "app.py"]
