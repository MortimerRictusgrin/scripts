#!/usr/bin/perl

use warnings;
use strict;
use v5.36;
use utf8;
use File::Copy qw(move);

my $wp = $ENV{'HOME'} . "/Pictures/Wallpaper";
# my $wp = ".";
my $num = 0;
my $format;

opendir(my $DIR, $wp) or die "$!\n$wp not found";
my @files = readdir $DIR;

foreach my $file (@files) {
  $num += 1;
  $format = "wp-" . "$num" . ".jpg";
  if ($file =~ /pexels/) {
    say $file;
    move($file, $format);
  }
}

closedir $DIR;
