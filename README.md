# Busted

## What is it?
Busted is a small Raspberry Pi project providing a simple containerized CCTV system using the Raspi Cam.

## How does it work?
Motion capture is done using [Motion](https://motion-project.github.io/).

Everytime a new event is captured by the camera, an email is sent through Gmail to notify that something is happening. Then a series of photos are taken at a regular (configurable) time interval to capture the motion scene. Each photo is sent individually by email.

## Technical requirements
* Raspberry Pi (tested on a Pi 2 running Raspbian Buster)
* Docker Engine installed and configured
* Raspberry Pi Camera module connected and enabled in the `raspi-config` interface

## Configuration
* Configure the `motion.conf` file as required (in particular the `on_event_start` and `on_picture_save` properties)
* Configure the `msmtprc.conf` file to use you own email provider and account

## Building the Docker image
`docker build . -t busted`

## Launching the application
`docker run --device=/dev/video0:/dev/video0 busted`
