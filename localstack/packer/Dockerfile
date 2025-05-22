FROM ubuntu:24.10

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \  
    wget \
    pipx \
    && rm -rf /var/lib/apt/lists/*

RUN pipx ensurepath
RUN pipx install --include-deps ansible
# If you need specific Python packages for your Ansible playbooks:
# Create and activate a virtual environment (recommended)
RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

# Install Ansible dependencies within the virtual environment
#COPY requirements.txt /app/  # If you have a requirements file
#RUN pip install -r requirements.txt

# Or install individual packages
# RUN pip install requests boto3  # Example

# Clean up
# RUN rm /app/requirements.txt # Optional: remove if no longer needed
