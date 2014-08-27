# isign-bluez

An iSign advertiser utility for deploying on a linux machine running the Bluez Bloutooth stack. It has been tested on a Raspberry Pi.

## What's an iSign

An iSign is an iBeacon advertisement which is augmented with a service id that points to where the service advertised by the beacon can be accessed.

Many iBeacon motes already advertise additional information by extending the iBeacon advertisement. They usually store a common name for the device to simplify mote admin UI's.

Extended iBeacons are fully compatible with iOS and MAC OS X.

![iSign Payload](http://ajres.github.io/isign-bluez/isignpayload.png)

## What use is an iSign

Apple's vision for iBeacons is focused on retailers and results in a model where one UUID ==> One App ==> One Retailer.

An alternative vision for iBeacons focuses on Consumers and results in a model where one point-of-interest ==> one UUID ==> many providers of the POI.

A user expresses an interest in a service or brand, e.g. "Food", the interest is hashed to generate a 128bit UUID.

This UUID is used to look for iBeacon advertisements with a matching UUID.

A plain iBeacon advertisement would use the Major/Minor numbers as a key to lookup a particular provider of the interest, in this case "Food". The lookup will take place via a centrally hosted service.

If the advertisement is an iSign (iBeacon with extended data), the major/minor (4 bytes) plus an additional 28bytes (total 32 bytes) represent the public key of an elliptical-key-cryptogrophy public/private key pair.

This key can be used to securely connect to the service provider over a network without the need to access a centrally hosted lookup service.

## Other uses

You can use the approach taken by iSign to extend iBeacon advertisements with your own metadata to create more intelligent apps. 

These extended iBeacon advertisements are fully compatible with iOS and MAC OS X core location and core bluetooth frameworks.

A binary is included in the project 'ibeacon-extended' that lets you try this out

The extended data must be formatted as Bluetooth 4.0 Advertisments, see BT 4.0 spec for details
 
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

The ibeacon-extended binary has the following usage:

```
ibeacon-extended <advertisement time in ms> <UUID 16 bytes> <major number> <minor number> <RSSI calibration amount> [<scan data max 31 bytes>]
```

To add a custom device name of MyBeacon, you can use the following example:
```
sudo ./ibeacon-extended 100 e2c56db5dffb48d2b060d0f5a71096e0 10 100 -29 13094d79426561636f6e00000000000000000000
```

The isign binary has the following usage:

```
isign <advertisement time in ms> <UUID 16 bytes> <Public Key 32bytes> <RSSI calibration amount>
```

To advertise a public key, you can use the following example:
```
sudo ./isign 100 e2c56db5dffb48d2b060d0f5a71096e0 a71096e0dffb48d2e2c56db5b060d0f5dffb48d2b060d0f5a71096e0e2c56db5 -29
```


