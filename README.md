# iSign-advertiser-rpi

An iSign advertiser utility for deploying on a raspberry pi


## Building from source

iSign has been tested on a Raspberry Pi B and B+

First follow the instructions on configuring the RPi as an iBeacon [here](http://www.wadewegner.com/2014/05/create-an-ibeacon-transmitter-with-the-raspberry-pi/)

When building the Bluez stack use the --enable-library argument to configure i.e.

```
sudo ./configure --disable-systemd --enable-library
```

After installing Bluez you can make the isign binary

```
make
```

To run the isign binary use the following command line:

```
isign 100 e2c56db5dffb48d2b060d0f5a71096e0 10 11 -50
```
