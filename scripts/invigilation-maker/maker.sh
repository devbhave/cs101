#/bin/bash

TA_FILE="ta.csv"
STU_FILE="student-master.csv"
ABS_FILE="absent-mid-sem.csv"


echo "\\documentclass{article}"
echo "\\usepackage[margin=0.5in]{geometry}"
echo "\\usepackage{arydshln}"
echo "\\usepackage{graphicx}"
echo "\\usepackage{ulem}"
echo "\\usepackage{nopageno}"

#echo "\\usepackage{pdflscape}"
echo "\\begin{document}"
echo "\\centering"

while IFS= read line
do

  jta=`echo $line | awk -F "," '{print $1}'`
  day=`echo $line | awk -F "," '{print $2}' | sed 's/[0-9]//g'`
  group=`echo $line | awk -F "," '{print $2}' | sed 's/[A-Za-z]//g'`


echo "\\textbf{\\large $day -- Group \\#$group -- $jta}"
echo ""
echo "\\vspace{\\baselineskip}"

echo "\\begin{tabular}{|c|p{2cm}|c|c|c|c|c|c|}"
echo "\\hline"
echo "\textbf{Roll No.} & \textbf{Name} &  \textbf{Q. 1} & \textbf{Q. 2} & \textbf{Q. 3} & \textbf{Q. 4} & \textbf{Q. 5} & \textbf{Total}\\begin{tabular}{l} \\\\ \\\\ \\end{tabular}\\\\"
echo "& &  \textit{(12 Marks)} & \textit{(10 Marks)} & \textit{(14 Marks)} & \textit{(10 Marks)} & \textit{(14 Marks)} & \textit{(60 Marks)}\\begin{tabular}{l} \\\\ \\\\ \\end{tabular}\\\\"
echo "\\hline"
while IFS= read line_stud
do
  rollno=`echo $line_stud | awk -F "," '{print $1}'`
  name=`echo $line_stud | awk -F "," '{print $2}'`
  daygroup=`echo $line_stud | awk -F "," '{print $3}'`

#echo "$rollno-$name-$daygroup"
  if [ $daygroup == "$day$group" ] 
    then   
    absent=`grep -c -x "$rollno" $ABS_FILE`
    if [ $absent -eq "0" ]; then
      echo "\\hline"
      echo "$rollno & $name & & &  & & & \\begin{tabular}{l} \\\\ \\\\ \\end{tabular}\\\\"
    else
      echo "\\hline"
      echo "\\sout{$rollno} & \\sout{$name} & & &  & & & \\begin{tabular}{l} \\\\ \\\\ \\end{tabular}\\\\"
    fi
  fi
done <"$STU_FILE"

echo "\\hline"
echo "\\hline"
echo "& \\rotatebox{60}{Checked By (Name)}  &  & &  & & &  \\\\ "
echo "\\end{tabular}"
echo "\\newpage"


done <"$TA_FILE"

echo "\\end{document}"
