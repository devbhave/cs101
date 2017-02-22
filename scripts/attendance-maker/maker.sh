#/bin/bash

JTA_FILE="all-jta.csv"
STUDENT_FILE="all-stud.csv"
TEMP_FILE="l1287.tmp"

echo "\documentclass[12pt]{article}"
echo "\usepackage[a4paper, landscape, margin=1cm]{geometry}"
echo "\usepackage{array}"

#echo "\usepackage{pdflscape}"
echo "\begin{document}"
echo "\centering"
echo "\renewcommand{\arraystretch}{3}"

while IFS= read line
do
 # echo "\begin{landscape}"

  day=`echo $line | awk -F , '{print $1}'`
  group=`echo $line | awk -F , '{print $2}'`
  lab=`echo $line | awk -F , '{print $3}'`
  jta=`echo $line | awk -F , '{print $4}'`
  sta=`echo $line | awk -F , '{print $5}'`

  echo "\thispagestyle{empty}"
  echo "\begin{tabular}{ll}"
	echo "\textbf{CS101 Lab:} & \texttt{$day, Group \#$group, Room: $lab}\\\\"
  echo "\textbf{STA Name:} & \texttt{$sta}\\\\"
  echo "\textbf{JTA Name:} & \texttt{$jta}\\\\"
  echo "&\\\\"
  echo "\end{tabular}"

  echo "\begin{tabular}{|l|l||l|l||l||l||l||l|l||l||l||l||l|l||l||}"
  echo "\hline"
  echo "\textbf{Roll No.} & \textbf{Name}& UGL1 & UGL2 & GL1 & UGL3 & GL2 & UGL4 & UGL5 & GL3 & UGL6 & GL4 & UGL7 & UGL8 & GL5\\\\"
  echo "\hline"
  grep "$day,$group,$lab" $STUDENT_FILE | awk -F , '{print "\\texttt{"$1"} & \\texttt{"$2"}" " & & & & & & & & & & & & &\\\\\hline"}' > $TEMP_FILE
  head -n 7 $TEMP_FILE
  echo "\end{tabular}"

  #echo "\end{landscape}"
  echo "\newpage"
  echo "\thispagestyle{empty}"

  echo "\begin{tabular}{|l|l||l|l||l||l||l||l|l||l||l||l||l|l||l||}"
  echo "\hline"
  echo "\textbf{Roll No.} & \textbf{Name}& UGL1 & UGL2 & GL1 & UGL3 & GL2 & UGL4 & UGL5 & GL3 & UGL6 & GL4 & UGL7 & UGL8 & GL5\\\\"
  echo "\hline"
  grep "$day,$group,$lab" $STUDENT_FILE | awk -F , '{print "\\texttt{"$1"} & \\texttt{"$2"}" " & & & & & & & & & & & & &\\\\\hline"}' > $TEMP_FILE
  tail -n +8 $TEMP_FILE
  echo "\end{tabular}"
  echo "\newpage"

done <"$JTA_FILE"

echo "\end{document}"
