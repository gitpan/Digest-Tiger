# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..4\n"; }
END {print "not ok 1\n" unless $loaded;}
use Digest::Tiger;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

if (Digest::Tiger::hexhash('abc') eq 'F258C1E88414AB2A527AB541FFC5B8BF935F7B951C132951') {
  print "ok 2\n";
}
else {
  print "not ok 2\n";
}

if (Digest::Tiger::hexhash('Tiger') eq '9F00F599072300DD276ABB38C8EB6DEC37790C116F9D2BDF') {
  print "ok 3\n";
}
else {
  print "not ok 3\n";
}

if (Digest::Tiger::hexhash('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-') eq '87FB2A9083851CF7470D2CF810E6DF9EB586445034A5A386') {
  print "ok 4\n";
}
else {
  print "not ok 4\n";
}

