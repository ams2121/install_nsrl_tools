#!/bin/bash
#
#
# This is a script to download and install the NSRL RDS software hash database and 
# tools to validate all the files in your system against it
#
#
# NIST NSRL RDS Minimal - A big list of known good / bad file hash data
#     NIST - The US National Institutes of Standards and Technology
#     NSRL - National Software Reference Library
#     RDS - Reference Data Set
#     Minimal - "Modern RDS  (minimal) - contains the set of DISTINCT appearances of files 
#              in  modern applications; no file entries are duplicated"
#
#     Link:     https://www.nist.gov/itl/ssd/software-quality-group/national-software-reference-library-nsrl
#     File:     https://s3.amazonaws.com/rds.nsrl.nist.gov/RDS/current/rds_modernm.zip
#
#
# nsrllookup - a tool by Robert J. Hansen to look up hashes against an NSRL RDS server
#     Link:     https://github.com/rjhansen/nsrllookup
#     Latest:   https://github.com/rjhansen/nsrllookup/tarball/master
#
# nsrlsvr -  a tool by Robert J. Hansen that runs an NSRL RDS server using the minimal RDS data set
#     Link:     https://github.com/rjhansen/nsrlsvr
#     Latest:   https://github.com/rjhansen/nsrlsvr/tarball/master
#
# hashdeep/md5deep - a tool by Jesse Kornblum that calculates the hash of all files in a directory
#     Link:     https://github.com/jessek/hashdeep/
#     Latest:   https://github.com/jessek/hashdeep/tarball/master
#
#

# download and extract the files if they dont already exist
echo ""
echo "Download all the things!"
echo ""
FILE=rds_modernm.zip
if [ -f $FILE ]; then
    echo "The Database is already downloaded"
else
    echo "Download the Database (> 1.x GB)"
    wget https://s3.amazonaws.com/rds.nsrl.nist.gov/RDS/current/rds_modernm.zip
fi

echo ""
FILE=nsrllookup.tgz
if [ -f $FILE ]; then
    echo "The nsrllookup codebase is already downloaded"
else
    echo "Download the nsrllookup codebase"
    wget https://github.com/rjhansen/nsrllookup/tarball/master -O nsrllookup.tgz
    gunzip nsrllookup.tgz
    tar vfx nsrllookup.tar
fi

echo ""
FILE=nsrlsvr.tgz
if [ -f $FILE ]; then
    echo "The nsrlsvr codebase is already downloaded"
else
    echo "Download the nsrlsvr codebase"
    wget https://github.com/rjhansen/nsrlsvr/tarball/master -O nsrlsvr.tgz
    gunzip nsrlsvr.tgz
    tar vfx nsrlsvr.tar
fi

echo ""
FILE=hashdeep.tgz
if [ -f $FILE ]; then
    echo "The hashdeep codebase is already downloaded"
else
    echo "Download the hashdeep codebase"
    wget https://github.com/jessek/hashdeep/tarball/master -O hashdeep.tgz
    gunzip hashdeep.tgz
    tar vfx hashdeep.tar
fi

#
# Notes below to move to automated install
# 

### sudo apt install autoconf 
### sudo apt install cmake
### sudo apt-get install libboost-all-dev

#in nsrllookup
## cmake .
## make
## sudo make install
# Installing: /usr/local/share/man/man1/nsrllookup.1
# Installing: /usr/local/bin/nsrllookup


# in nsrlserver
## cmake -DPYTHON_EXECUTABLE=`which python3` .
## make
## sudo make install
# unzip and find NSRLFile.txt in the big unzipped nsrl data set
## nsrlupdate /path/to/NSRLFile.txt
# Installing: /usr/local/bin/nsrlsvr
# Installing: /usr/local/bin/nsrlupdate
# Installing: /usr/local/share/man/man1/nsrlsvr.1
# Installing: /usr/local/share/man/man1/nsrlupdate.1


# in hash deep 
# make sure tools are installed
### sudo apt install autoconf 

# sh bootstrap.sh # runs autoconf, automake
# ./configure
# make
# make install
## installs:
#   /usr/local/bin/hashdeep
#   /usr/local/bin/md5deep
#   /usr/local/bin/sha1deep
#   /usr/local/bin/sha256deep
#   /usr/local/bin/whirlpooldeep
#   /usr/local/bin/tigerdeep


# unzip unzip rds_modernm.zip


# nsrlupdate /path/to/NSRLFile.txt
# nsrlupdate /home/user/hashdb/file

(takes a while.... 2-4 min?)
# writes for some reason to '/usr/local/share/nsrlsvr'

#nsrlsrv takes at least 5 Minuts to actually start up

#sudo nsrlsvr
#wait 5 minutes
#md5deep -r . > all_hash.txt
#nsrllookup -s 127.0.0.1 < all_hash.txt > rds_miss.txt
