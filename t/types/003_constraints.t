#!/usr/bin/perl
use Test::More;
BEGIN { use_ok('Bronze::Types::Constraints', qw(SystemName)) }

{ package TestClass;
  use Moose;
  use Bronze::Types::Constraints qw(SystemName);
  has n => ( is     => 'rw',
             isa    => SystemName,
             coerce => 1 );
};

my $a = TestClass->new( n => 'valid' );
is($a->n, 'valid', 'valid value is stored as is');

$a->n('valid/with/sub/categories');
is($a->n, 'valid/with/sub/categories', 'it accepts sub categories');

$a->n('invalid string');
is($a->n, 'invalid_string', 'coerces values');

$a->n('invalid string/with/slashes in it');
is($a->n, 'invalid_string/with/slashes_in_it', 'coerces values');

$a->n('invalid string/with////slashes in it');
is($a->n, 'invalid_string/with/slashes_in_it', 'coerces values');

$a->n('invalid % string/with////slashes in it');
is($a->n, 'invalid_!25_string/with/slashes_in_it', 'coerces values');

$a->n('/invalid % string/with////slashes in it');
is($a->n, 'invalid_!25_string/with/slashes_in_it', 'coerces values');

$a->n('/invalid % string/with////slashes in it/');
is($a->n, 'invalid_!25_string/with/slashes_in_it', 'coerces values');

$a->n('something/wit/a!foo');
is($a->n, 'something/wit/a!21foo', 'encodes everything with !');

$a->n('something/wit/a!21foo');
is($a->n, 'something/wit/a!21foo', 'but accepts already encoded strings');


done_testing;
