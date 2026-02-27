# Linux Fundamentals: Read and Write Text Files

- Practice Read and Write.
- created notes.tx with `touch notes.txt` command.
- Added one line with ` echo "Hello! Welcome.." > notes.txt `.
- Added second line with ` echo "I hope you are doing great." >> notes.txt `, and this second line got appended bellow my first line.
- Added fourth  line  with the ` tea -a ` command where it append the line in notes.txt as well as it outputs the line in terminal also.
-` cat notes.txt` shows the contents of ` notes.txt `.

![notes](https://github.com/Alok-Nayak/90DaysOfDevOps/blob/ba790e04c0c52ccd30df1a7ec637acee63e884e4/2026/day-06/day-06-images/notes.png)

Key Learning
` > ` overwrites a file.
` >> ` appends to a file.
` tee -a ` writes and displays at the same time.
` head ` and ` tail ` help inspect large files quickly.
