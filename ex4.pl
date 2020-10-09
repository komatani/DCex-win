# read response.txt (format: "word\tresponse") into %response
my %response = ();
open(RESPONSE, "./response.txt") || die $!;
while(<RESPONSE>){
  chomp;
  /^(.+)\t(.+)$/ || next;
  $response{$1} = $2;
}

open(CMD, "ex1.bat |");
while (<CMD>) {
  chomp;
  $output = "";
  if (m|sentence1:(.*)|) {
    my(@words) = split(/\s/, $1);
    foreach my $a_word (@words){
      $output = $response{$a_word} if(defined($response{$a_word}));
    }
    if ($output ne "") {
      print "speak: $output\n";
      system("speak.bat $output");
    }
    else {
      print "result $1\n";
    }
  }
}
close(CMD);
