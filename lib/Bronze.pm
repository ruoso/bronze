package Bronze;
use Moose;


__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

Bronze - Model-oriented Content Management System

=head1 DESCRIPTION

This module is used to centralize the definition of which keys should
be indexed in Bronze. It delegates the extraction to the actual
implementing type.

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.

