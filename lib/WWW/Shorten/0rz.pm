package WWW::Shorten::0rz;
use strict;
use warnings;
use Carp;
our $VERSION = '0.02';
use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw( makeashorterlink makealongerlink );

use WWW::Mechanize;

sub makeashorterlink {
    my $url = shift;
    my $ua = new WWW::Mechanize;
    $ua->get('http://0rz.net');
    $ua->submit_form(fields => { url => $url });
    return $ua->field('xxurl');
}

sub makealongerlink {
    my $tinyurl_url = shift
	or croak 'No TinyURL key / URL passed to makealongerlink';
    my $ua = __PACKAGE__->ua();
    $tinyurl_url = "http://0rz.com/$tinyurl_url"
        unless $tinyurl_url =~ m!^http://!i;
    my $resp = $ua->get($tinyurl_url);
    return undef unless $resp->is_redirect;
    my $url = $resp->header('Location');
    return $url;
}

1;

__END__

=head1 NAME

  WWW::Shorten::0rz - Shorten URL using 0rz.net

=head1 DESCRIPTION

  use WWW::Shorten '0rz';
  my $short_url = makeashorterlink($longurl);

=head1 COPYRIGHT

Copyright 2004 by Kang-min Liu <gugod@gugod.org>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

See <http://www.perl.com/perl/misc/Artistic.html>

=cut

