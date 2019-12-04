#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Crypt::JWT qw(encode_jwt);
use Perl6::Slurp qw(slurp);

sub encode {
  my $private_key = slurp('<:utf8', './keys/private-key.pem');
  my $token = encode_jwt(
    payload => { uid => 123 },
    key => \$private_key,
    alg => 'RSA-OAEP',
    enc => 'A256CBC-HS512',
  );
  say $token;
}

encode();
