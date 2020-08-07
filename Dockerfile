FROM resin/rpi-raspbian:latest

RUN apt-get update && apt-get install -y \
  motion \
  mailutils \
  msmtp \
  msmtp-mta

RUN mkdir -p /mnt/motion && chown motion /mnt/motion

COPY motion.conf /etc/motion/motion.conf
COPY msmtprc.conf /etc/msmtprc

# For image saving
#VOLUME /mnt/motion

# For video streaming
#EXPOSE 15722

ENTRYPOINT ["motion"]