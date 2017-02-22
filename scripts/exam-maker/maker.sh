#/bin/bash

TA_FILE="ta.csv"
TEMP_FILE="l7520.tmp"

echo "\documentclass[12pt]{article}"
echo "\usepackage{amssymb}"

#echo "\usepackage{pdflscape}"
echo "\begin{document}"
echo "\centering"

while IFS= read line
do

  hall=`echo $line | awk -F ";" '{print $1}'`
  block=`echo $line | awk -F ";" '{print $2}'`
  sta=`echo $line | awk -F ";" '{print $3}'`
  tas=`echo $line | awk -F ";" '{print $4}'`
  stud_count=`echo $line | awk -F ";" '{print $5}'`

  echo "\\begin{tabular}{|l|p{7cm}|}"
  echo "\\hline"
  echo "Classroom & $hall\\\\"
  echo "\\hline"
  echo "Block & $block\\\\"
  echo "\\hline"
  echo "Classroom STA & $sta\\\\"
  echo "\\hline"
  echo "Block TAs & $tas\\\\"
  echo "\\hline"
  echo "Student Count & $stud_count\\\\"
  echo "\\hline"
  echo "Present Student Count & \\\\"
  echo "\\hline"
  echo "Absent Student Count & \\\\"
  echo "\\hline"
  echo "Absent Roll Numbers & 1.\\\\"
  echo "& 2.\\\\"
  echo "& 3.\\\\"
  echo "& 4.\\\\"
  echo "& 5.\\\\"
  echo "& 6.\\\\"
  echo "& 7.\\\\"
  echo "& 8.\\\\"
  echo "& 9.\\\\"
  echo "& 10.\\\\"
  echo "\\hline"
  echo "List of Stationery Items & \$\\square\$ Stapler -- 1\\\\"
  echo "\\textit{(Put \$\\checkmark\$ against the returned items)} & \$\\square\$ Box of stapler pins -- 1\\\\"
  echo "& \$\\square\$ Whiteboard markers -- 2  \\\\"

  echo "\\hline"
  echo "\\hline"
  echo "\\multicolumn{2}{|p{13cm}|}{\\textbf{Declaration:}}\\\\"
  echo "\\multicolumn{2}{|p{13cm}|}{I, \\textbf{$sta}, declare that all the above information has been correctly filled by me and I have personally verified that all the papers of the present students are kept inside this envelope. I have also returned the stationery.}\\\\"
  echo "\\multicolumn{2}{|p{13cm}|}{}\\\\"
  echo "\\multicolumn{2}{|p{13cm}|}{\\textbf{Signature with Date:}}\\\\"
  echo "\\multicolumn{2}{|p{13cm}|}{}\\\\"
  echo "\\hline"
  echo "\\end{tabular}"

done <"$TA_FILE"

echo "\end{document}"
