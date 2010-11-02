#!/usr/bin/perl
use Test::More;

BEGIN { use_ok('Bronze::Types::Config') }

my $c = Bronze::Types::Config->new({ lang => 'pt_BR',
                                      owner => 'ruoso',
                                      group => 'users',
                                      permissions => 0644,
                                      key => 'foo',
                                      value => 'bar' });

is($c->lang, 'pt_BR', 'saves the lang attribute correctly.');
is($c->owner, 'ruoso', 'saves the owner correctly');
is($c->group, 'users', 'saves the group correctly');
is($c->permissions, 0644, 'saves the permission correctly');
is($c->key, 'foo', 'saves the key correctly');
is($c->value, 'bar', 'saves the value correctly');

done_testing;
