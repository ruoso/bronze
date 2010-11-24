package Bronze::Types::Constraints;
use MooseX::Types::Moose qw(Str);
use MooseX::Types -declare => ['SystemName'];

=head1 NAME

Bronze::Type::Constraints - Library of common type constraints

=head1 DESCRIPTION

This module implements a library of commonly used type constraints.

=head1 DECLARATIONS

=over

=item SystemName

This is a constraint to be used when building public identifiers. It
restricts the character set to a-z, A-Z, 0-9, - and _. It also
requires at least one character, while allowing the use of slashes to
split several parts of the name.

=cut

subtype SystemName,
  as Str,
  where { /^(?:(?:[a-zA-Z0-9\-_\.]|![0-9a-fA-F]{2})+\/?)+$/ },
  message { "Invalid SystemName" };

coerce SystemName,
  from Str,
  via {
      join '/',
        map {
            s/\s+/_/g;
            s/([^a-zA-Z0-9\-_])/sprintf("!%0x",ord($1))/ge;
            $_;
        } grep { $_ }
          split '/';
  };

=item PublishStatus

This is a constraint for the different states that a content might
have.

The states are: "draft", "ready", "published", "archived" and
"deleted".

=cut

subtype PublishStatus,
  as Str,
  where { /^(:draft|ready|published|archived)$/ },
  message { "Invalid publish status" };

1;

__END__

=back

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
