#/bin/bash

TA_FILE="ta-new.csv"

#echo "\\documentclass{article}"
echo "\\documentclass[14pt]{extarticle}"
echo "\\usepackage[margin=1in]{geometry}"
echo "\\usepackage{nopageno}"
echo "\\usepackage{amssymb}"

#echo "\\usepackage{pdflscape}"
echo "\\begin{document}"
echo "\\centering"

while IFS= read line
do

  hall=`echo $line | awk -F ";" '{print $1}'`
  block=`echo $line | awk -F ";" '{print $2}'`
  sta=`echo $line | awk -F ";" '{print $3}'`
  tas=`echo $line | awk -F ";" '{print $4}'`
  stud_count=`echo $line | awk -F ";" '{print $5}'`

  echo "\\thispagestyle{empty}"
  echo "\\begin{table}"
  echo "{\hspace{3.5cm}\textbf{\Huge $hall -- $block}}\\\\"
  echo "\\\\"

  echo "\\begin{tabular}{|l|p{7cm}|}"
  echo "\\hline"
  echo "Classroom STA & $sta\\\\"
  echo "\\hline"
  echo "Block TAs & $tas\\\\"
  echo "\\hline"
  echo "Student Count & $stud_count\\\\"
  echo "\\hline"
  echo "Present Student Count & \\\\"
  echo "& \\\\"
  echo "\\hline"
  echo "Absent Student Count & \\\\"
  echo "& \\\\"
  echo "\\hline"
  echo "Absent Roll Numbers & 1.\\\\"
  echo "& \\\\"
  echo "& \\\\"
  echo "& 2.\\\\"
  echo "& \\\\"
  echo "& \\\\"
  echo "& 3.\\\\"
  echo "& \\\\"
  echo "& \\\\"
  echo "& 4.\\\\"
  echo "& \\\\"
  echo "& \\\\"
  echo "& 5.\\\\"
  echo "& \\\\"
  echo "& \\\\"
  echo "\\hline"
  echo "List of Stationery Items & \$\\square\$ Stapler -- 1\\\\"
  echo "\\textit{(Put \$\\checkmark\$ against the returned items)} & \$\\square\$ Box of stapler pins -- 1\\\\"
  echo "& \$\\square\$ Whiteboard markers -- 2  \\\\"

  echo "\\hline"
  echo "\\hline"
  echo "\\multicolumn{2}{|p{15cm}|}{\\textbf{Declaration:}}\\\\"
  echo "\\multicolumn{2}{|p{15cm}|}{I, \\textbf{$sta}, declare that all the above information has been correctly filled by me and I have personally verified that all the papers of the present students are kept inside this envelope. I have also returned the stationery.}\\\\"
  echo "\\multicolumn{2}{|p{15cm}|}{}\\\\"
  echo "\\multicolumn{2}{|p{15cm}|}{\\textbf{Signature with Date:}}\\\\"
  echo "\\multicolumn{2}{|p{15cm}|}{}\\\\"
  echo "\\hline"
  echo "\\end{tabular}"
  echo "\\end{table}"
  echo "\\newpage"

done <"$TA_FILE"

echo "\\end{document}"
