#!/bin/bash
set -e
mvn clean install
mvn assembly:assembly
VERSION=`grep -o -a -m 1 -h -r "version>.*</version" ./pom.xml | head -1 | sed "s/version//g" | sed "s/>//" | sed "s/<\///g"`
scp target/otp-auth-$VERSION-jar-with-dependencies.jar glassfish@snurran.sics.se:/var/www/hops/otp-auth-$VERSION.jar
