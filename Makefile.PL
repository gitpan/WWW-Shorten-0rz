use inc::Module::Install;

name            ('WWW-Shorten-0rz');
abstract        ('1');
author          ('Kang-min Liu <gugod@gugod.org>');
license         ('perl');
version_from    ('lib/WWW/Shorten/0rz.pm');
requires        ('WWW::Shorten');
build_requires  ('Test::More');

&WriteAll;

