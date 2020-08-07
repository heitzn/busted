# Busted

## What is it?
Busted is a small Raspberry Pi project providing a simple containerized CCTV system using the Raspi Cam.

## How does it work?
Motion capture is done using [Motion](https://motion-project.github.io/).

Everytime a new event captured by the camera, an email is sent through Gmail to notify that something is happening. Then a series of photos are taken at a regular (configurable) time interval to capture the motion scene and each photo is sent individually by email.

## Technical requirements
* Raspberry Pi (tested on a Pi 2 running Raspbian buster)
* Docker installed and configured (tested with version 19.03)
* Raspberry Pi Camera module connected and enabled in the `raspi-config` interface

## Configuration
* Configure the `motion.conf` file as required (in particular the `on_event_start` and `on_picture_save` properties)
* Configure the `msmtprc.conf` file to use you own email provider and account
* Make the `cctv.sh` script executable: `chmod u+x cctv.sh`

## Building the Docker image
`docker build . -t busted`

## Launching the application
`docker run --device=/dev/video0:/dev/video0 busted`
