#!/usr/bin/perl
use Test::More;

BEGIN { use_ok('Bronze::Types::Data') }

my $c = Bronze::Types::Data->new({ lang => 'pt_BR',
                                   owner => 'ruoso',
                                   group => 'users',
                                   permissions => 0644 });

is($c->lang, 'pt_BR', 'saves the lang attribute correctly.');
is($c->owner, 'ruoso', 'saves the owner correctly');
is($c->group, 'users', 'saves the group correctly');
is($c->permissions, 0644, 'saves the permission correctly');

done_testing;
