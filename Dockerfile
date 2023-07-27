FROM ubuntu:latest
# Create a directory inside the container to mount the data volume
RUN mkdir -p /soft-serve/scripts

# Copy the scripts into the scripts directory
COPY scripts /soft-serve/scripts

# Set the working directory to the new directory
WORKDIR /soft-serve

# Update image and install Soft Serve
RUN apt update && apt upgrade 
RUN apt install curl gpg -y
RUN curl -fsSL https://repo.charm.sh/apt/gpg.key | gpg --dearmor -o /etc/apt/keyrings/charm.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | tee /etc/apt/sources.list.d/charm.list
RUN apt update && apt install soft-serve -y 

RUN chmod +x scripts/entrypoint.sh

# Expose ports
# SSH
EXPOSE 23231/tcp
# HTTP
EXPOSE 23232/tcp
# Stats
EXPOSE 23233/tcp
# Git
EXPOSE 9418/tcp

CMD ./scripts/entrypoint.sh

