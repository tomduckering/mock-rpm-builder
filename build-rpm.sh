#!/bin/bash



mkdir ~/specs
mkdir ~/sources

cd specs

curl -OL https://raw.github.com/imeyer/ruby-1.9.3-rpm/master/ruby19.spec

cd ../sources

curl -OL http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p484.tar.gz

cd ..


mock -r centos-6-x86_64-slc --resultdir=./rubysrpm --buildsrpm --spec specs/ruby19.spec --sources sources

mock -r centos-6-x86_64-slc --resultdir=./rubyrpm --rebuild ./rubysrpm/ruby*.src.rpm