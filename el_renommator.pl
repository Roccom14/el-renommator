use strict;
use v5.18;

say ("Bienvenue dans el renommator");

for my $file( glob("*.*")){
    my $newName = baptiser($file);
    if (defined $newName){
        say "-> $file va ensuite être renommé en $newName <-";
        if (not -f $newName){
            rename($file,$newName) or die;
        }else{
            say ("$newName existe déjà !");
        }
    }
}

sub baptiser{
    my ($file)=@_; #exemple (7) 31.12.2019.png
    return undef unless my ($id,$day,$month,$year,$ext)=
     $file =~ /^[(](\d+)[)] (\d+).(\d+).(\d+).(gif|jpeg|png|jpg)$/;
    $id = sprintf("%04d", $id);
    #exemple (0007) 2019-12-31.png
    return "($id) $year-$month-$day.$ext";

}



