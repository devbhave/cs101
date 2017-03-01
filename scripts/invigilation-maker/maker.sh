#/bin/bash

TA_FILE="ta.csv"
STU_FILE="student-master.csv"
ABS_FILE="absent-mid-sem.csv"


echo "\\documentclass{article}"
echo "\\usepackage[margin=1in]{geometry}"
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


echo "\\textbf{\\large $day -- $group -- $jta}"

echo "\\begin{tabular}{|l|p{2cm}|l|l|l:l|l|l:l:l:l|l|}"
echo "\\hline"
echo "Roll No. & Name &  Q. 1 & Q. 2 & Q. 3a & Q. 3b & Q. 4 & Q. 5a & Q. 5b & Q. 5c & Q. 5d & Total\\begin{tabular}{l} \\\\ \\\\ \\end{tabular}\\\\"

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
      echo "$rollno & $name & & &  & & &  &  & &  & \\begin{tabular}{l} \\\\ \\\\ \\end{tabular}\\\\"
    else
      echo "\\hline"
      echo "\\sout{$rollno} & \\sout{$name} & & &  & & &  &  & &  & \\begin{tabular}{l} \\\\ \\\\ \\end{tabular}\\\\"
    fi
  fi
done <"$STU_FILE"

echo "\\hline"
echo "\\hline"
echo "& \\rotatebox{60}{Checked by TA Name}  &  & &  & & &  &  & &  & \\\\ "
echo "\\end{tabular}"
echo "\\newpage"


done <"$TA_FILE"

echo "\\end{document}"
