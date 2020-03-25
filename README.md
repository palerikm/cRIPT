# cRIPT

Aims to be a C implementation if the IETF RIPT draft 

For noe all it does is build the client and server examples from lsquick outside that src tree.

## Building

Build and install lsquick
https://github.com/litespeedtech/lsquic

In that process boringssl is also build

It helps to have a directory structure like this:
```
[some dir]/boringssl
[some dir]/lsquick
[some dir]/cRIPT
```

The build.sh scripts assumes that. If your directory structure is different adjust the -DBORINGSSL_DIR and 
-DLSQUIC_DIR variables accordingly when calling cmake. 

## Running

The ript_server and ript_client currently takes all the same parameters as the lsquic examples.
A lot of nice features there to test HTTP/3 and QUIC paramters. Nice job you litespeedtech folks!