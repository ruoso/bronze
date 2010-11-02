#!/usr/bin/perl
use Test::More;

BEGIN { use_ok('Bronze::Types::Category') }

my $c = Bronze::Types::Category->new({ lang => 'pt_BR',
                                       owner => 'ruoso',
                                       group => 'users',
                                       permissions => 0644,
                                       system_name => '/um/path com/coercao',
                                       display_name => 'Categoria Tal' });

is($c->lang, 'pt_BR', 'saves the lang attribute correctly.');
is($c->owner, 'ruoso', 'saves the owner correctly');
is($c->group, 'users', 'saves the group correctly');
is($c->permissions, 0644, 'saves the permission correctly');
is($c->system_name, 'um/path_com/coercao', 'coerces the system name');
is($c->display_name, 'Categoria Tal', 'But keeps the display_name intact');

done_testing;
