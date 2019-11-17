#!/usr/bin/perl -w

use File::Find;

find(\&located, "/");

sub located 
{
    if($File::Find::name =~ /\.conf$/)
    {
        print "$File::Find::name\n";
    }
}
