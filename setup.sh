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
#     Latest:   https://github.com/rjhansen/nsrllookup/tarball/gh-pages
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
if [ -f rds_modernm.zip ]; then
    echo "The Database is already downloaded"
else
    echo "Download the Database (> 1.x GB)"
    wget https://s3.amazonaws.com/rds.nsrl.nist.gov/RDS/current/rds_modernm.zip
fi

echo ""
FILE=rds_modernm.zip
if [ -f rds_modernm.zip ]; then
    echo "The Database is already downloaded"
else
    echo "Download the Database (> 1.x GB)"
    wget https://s3.amazonaws.com/rds.nsrl.nist.gov/RDS/current/rds_modernm.zip
fi