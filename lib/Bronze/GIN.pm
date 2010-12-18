package Bronze::GIN;
use MRO::Compat;
use Carp qw(croak);
use Moose;
with qw( Search::GIN::Extract Search::GIN::Keys::Deep );
use namespace::clean -except => 'meta';

sub extract_values {
    my ( $self, $obj, @args ) = @_;

    croak 'Expecting only Bronze::Types::Data values'
      unless $obj->isa('Bronze::Types::Data');

    my $class = ref $obj;
    my $isa = mro::get_linear_isa($class);

    my %keys;

    # now we are going to delegate to the EXTRACT submethod of each
    # class.
    {
        no strict 'refs';
        foreach (grep { $_->isa('Bronze::Types::Data') &&
                          exists *{$_.'::'}->{EXTRACT} } @$isa) {
            my $res = *{$_.'::'}->{EXTRACT}->($obj);
            next unless ref $res eq 'HASH';
            $self->_merge_extracted_values(\%keys, $res);
        }
    }

    return $self->process_keys({ %keys, blessed => $class, isa => $isa });
}

sub _merge_extracted_values {
    my ($self, $dst, $src) = @_;

    foreach my $key (keys %$src) {
        if (exists $dst->{$key}) {
            my $dst_type = ref $dst->{$key};
            my $src_type = ref $src->{$key};
            if (!$dst_type && !$src_type) {
                $dst->{$key} = [ $dst->{$key}, $src->{$key} ];
            } elsif ($dst_type eq 'ARRAY' && !$src_type) {
                push @{$dst->{$key}}, $src->{$key};
            } elsif (!$dst_type && $src_type eq 'ARRAY') {
                unshift @{$src->{$key}}, $dst->{$key};
            } elsif ($dst_type eq 'ARRAY' && $src_type eq 'ARRAY') {
                push @{$dst->{$key}}, @{$src->{$key}};
            } elsif ($dst_type eq 'HASH' && $src_type eq 'HASH') {
                $self->_merge_extracted_values($dst->{$key}, $src->{$key});
            } else {
                croak "Failed to merge EXTRACT GIN values ('$dst_type' and '$src_type')";
            }
        } else {
            $dst->{$key} = $src->{$key}
        }
    }
}


__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

Bronze::GIN - Factory for GIN key exctractor

=head1 DESCRIPTION

This module is used to centralize the definition of which keys should
be indexed in Bronze. It delegates the extraction to the actual
implementing type.

=head1 COPYRIGHT

Copyright 2010 Daniel Ruoso <daniel@ruoso.com>

This module is distributed under the same terms of Perl itself.
