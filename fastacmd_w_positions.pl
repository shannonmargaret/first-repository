#!/bin/env perl
##blastp using blast + with exclude option denoted by exclude..gilist
#INPUT-> tab delimited list of gi#s and 

# OUTPUT-> seqs associated with blast search from inteins against the nr


$db='';
$keyfile="/usr/local/blast/data/pangenomes/16s/clusters.pan.genome.microbial.95.txt";
#grabbing all files with extension '.pasted'
	#@name=split(/\./,$seq);
	open (IN, "< $keyfile") or die "Cannot open $keyfile!!";
	@pangenomes=<IN>;
	foreach(@pangenomes){
		chomp ;
		$filename= $_.".q_ready";
		open (KEY, "< /home/frednabby/pangenomes/$filename") or die "Cannot open $filename";
		$outname= $_.".int_seqs";
		$db=$_;
		$outfile="/home/frednabby/pangenomes/$outname";
		while (defined($i=<KEY>)){
			@parts=split(/\t/, $i);
			@gi=split(/\|/, $parts[0]);
			print "$db\n";
			system("fastacmd -d '/usr/local/blast/data/pangenomes/16s/pan.genome.microbial.95/$db' -s $gi[1] -L $parts[1],$parts[2] > tmp.txt");
			`cat $outfile tmp.txt > x.x`;
			`mv x.x $outfile`;					
								}
			
		}
		
