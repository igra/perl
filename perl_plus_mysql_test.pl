#!/usr/bin/perl
use strict;
use warnings;
use DBI;

my $user = "root";
my $pass = "12345";
my $host = "localhost";

my $dbh = DBI->connect("DBI:mysql:test_schema:$host", $user, $pass);

my $stmt = $dbh->prepare("select * from jobs order by job_id desc");
$stmt->execute
    or die "error to perform sql query";

while (my @row = $stmt->fetchrow_array()) {
    print "$row[0] : $row[1]\n";
}

exit(0);