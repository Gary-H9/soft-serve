FROM charmcli/soft-serve:latest
# Create a directory inside the container to mount the data volume
RUN mkdir /soft-serve/scripts

# Copy the scripts into the scripts directory
COPY scripts /soft-serve/scripts

# Set the working directory to the new directory
WORKDIR /soft-serve

# Expose ports
# SSH
EXPOSE 23231/tcp
# HTTP
EXPOSE 23232/tcp
# Stats
EXPOSE 23233/tcp
# Git
EXPOSE 9418/tcp

ENV SOFT_SERVE_INITIAL_ADMIN_KEYS="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTCYa3EdbOBMTkKaJp4hIqChDte7b+0SWTy7hMTiHUpzrE9DaMS58s/1hZ5EwpOif4aSf4ML5jvtm2+U1SOuFi28+huPjbuPyvdaIsUlvlv6Mnu7M05ovAkNXfhCroDIjZO/Yl9SG4Bf9xkwxA70vKi7NyIveTHgmt19e6MqbR8FVhYP+KLlrXSdkXfkBIEU7aLq4Kw943KD5DzPUFvaRu8Q2n81Lb1mM7Mf5YGhXYhn+i4+1iWVU+1DuN+Wg1rRP7nkqDZC3W4eIGqi6ZdA0o2P5461xxxHHWWoR5NMPLh8HZ3hO9ULSrYiH8KfGmt4TEd27XRtamCl2pKsJc0hXgLn3TzOUWfZTDbCUFfjYD8GVYMkE1Og1T7Wcafaya1+bR/f9HGwYuKc4/3pFyiBUAfd33cep+sYRM2xv8GT3zrXJJ6ZhhRKOXiFLfJcg5VJDNhWigxaKd8ajJst2DTjQIiErLiXYk6MdvmJMc2GXFJ+FMXEq76l1rjnifRO93Z4U= root@localhost"
# RUN ssh-keygen -t rsa -N "" -f "/root/.ssh/id_rsa" -C "root@localhost"

# Add the initial admin key - required to allow the scripts to run as an authorised user.
# RUN echo "initial_admin_keys:" >> config.yaml
# RUN echo "  - \"$(cat /root/.ssh/id_rsa.pub)\"" >> config.yaml

# Call the startup.sh script
# ENTRYPOINT [ "scripts/startup.sh" ]

# ENTRYPOINT [ "/usr/local/bin/soft", "serve" ]

# # Run the scripts to add the repositories
# RUN chmod +x scripts/add-repo-mirrors.sh
# CMD ./scripts/add-repo-mirrors.sh
